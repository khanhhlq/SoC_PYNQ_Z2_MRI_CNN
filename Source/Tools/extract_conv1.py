
from pathlib import Path
import numpy as np
import h5py

# Step 1: Model path
source_dir = Path(__file__).resolve().parent
model_path = source_dir / "tiny_cnn_v5.h5"

if not model_path.is_file():
    raise FileNotFoundError(model_path)

# Step 2: Find Conv1 tensors
kernel_candidates = []
bias_candidates = []

with h5py.File(model_path, "r") as model:

    def find_tensors(name, obj):
        if not isinstance(obj, h5py.Dataset):
            return

        if obj.shape == (3, 3, 1, 8):
            kernel_candidates.append((name, obj[()]))

        elif obj.shape == (8,):
            bias_candidates.append((name, obj[()]))

    model.visititems(find_tensors)

# Step 3: Verify tensor shapes
if len(kernel_candidates) != 1:
    raise ValueError(
        f"Expected one Conv1 kernel, found "
        f"{len(kernel_candidates)}"
    )

if len(bias_candidates) != 1:
    raise ValueError(
        f"Expected one Conv1 bias, found "
        f"{len(bias_candidates)}"
    )

kernel_path, weights = kernel_candidates[0]
bias_path, bias = bias_candidates[0]

weights = np.asarray(weights, dtype=np.float32)
bias = np.asarray(bias, dtype=np.float32)

if not np.isfinite(weights).all():
    raise ValueError("Invalid Conv1 weights")

if not np.isfinite(bias).all():
    raise ValueError("Invalid Conv1 bias")

# Step 4: Save extracted parameters
np.save(source_dir / "conv1_weights.npy", weights)
np.save(source_dir / "conv1_bias.npy", bias)

# Step 5: Display results
print("Model:", model_path.name)
print("Kernel dataset:", kernel_path)
print("Bias dataset:", bias_path)
print("Weight shape:", weights.shape)
print("Bias shape:", bias.shape)
print("Weight count:", weights.size)
print("Bias count:", bias.size)
print("Total parameters:", weights.size + bias.size)
print("Data type:", weights.dtype)

print("\nConv1 extraction completed successfully.")


# ==========================================
# EXPORT CONV1 PARAMETERS FOR HLS
# Fixed-point format: signed Q1.15
# ==========================================

scale = 1 << 15

weights_q15 = np.rint(weights * scale).astype(np.int16)
bias_q15 = np.rint(bias * scale).astype(np.int16)

header_path = source_dir / "conv1_params.h"

lines = [
    "#ifndef CONV1_PARAMS_H",
    "#define CONV1_PARAMS_H",
    "",
    "#include <stdint.h>",
    "",
    "#define CONV1_Q 15",
    "",
    "static const int16_t conv1_w_q15[8][3][3] = {"
]

for f in range(8):
    lines.append("    {")

    for ky in range(3):
        values = [
            str(int(weights_q15[ky, kx, 0, f]))
            for kx in range(3)
        ]

        comma = "," if ky < 2 else ""
        lines.append(
            "        {" + ", ".join(values) + "}" + comma
        )

    comma = "," if f < 7 else ""
    lines.append("    }" + comma)

lines.append("};")
lines.append("")

bias_values = ", ".join(
    str(int(value)) for value in bias_q15
)

lines.append(
    "static const int16_t conv1_b_q15[8] = "
    "{" + bias_values + "};"
)

lines.append("")
lines.append("#endif")

header_path.write_text(
    "\n".join(lines) + "\n",
    encoding="utf-8"
)

weight_error = np.max(
    np.abs(weights - weights_q15.astype(np.float32) / scale)
)

bias_error = np.max(
    np.abs(bias - bias_q15.astype(np.float32) / scale)
)

print("\n===== HLS EXPORT =====")
print("Format: Signed Q1.15")
print("Weight shape:", weights_q15.shape)
print("Bias shape:", bias_q15.shape)
print("Maximum weight quantization error:", weight_error)
print("Maximum bias quantization error:", bias_error)
print("HLS header:", header_path.name)
print("HLS export completed successfully.")

