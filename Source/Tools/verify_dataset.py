
from pathlib import Path
from collections import defaultdict
import hashlib

dataset = Path(
    r"D:\SoC_PYNQ_Z2_MRI_CNN\source\Dataset_MRI\classification_task"
)

groups = defaultdict(list)
counts = {}

for split in ["train", "test"]:
    images = list((dataset / split).rglob("*.jpg"))
    counts[split] = len(images)

    for image in images:
        with image.open("rb") as f:
            key = hashlib.file_digest(f, "sha256").hexdigest()
        groups[key].append(image)

duplicates = [g for g in groups.values() if len(g) > 1]

cross_split = [
    g for g in duplicates
    if len({p.relative_to(dataset).parts[0] for p in g}) > 1
]

print("Train images:", counts["train"])
print("Test images:", counts["test"])
print("Total images:", sum(counts.values()))
print("Duplicate groups:", len(duplicates))
print("Train/Test duplicate groups:", len(cross_split))
