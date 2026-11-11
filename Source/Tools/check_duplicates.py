
from pathlib import Path
from collections import defaultdict
import hashlib

dataset = Path(
    r"D:\SoC_PYNQ_Z2_MRI_CNN\source\Dataset_MRI\classification_task"
)

report = dataset.parent / "duplicate_preview.txt"
groups = defaultdict(list)

# Step 1: Scan dataset
for split in ["train", "test"]:
    for image in (dataset / split).rglob("*.jpg"):
        with open(image, "rb") as f:
            key = hashlib.file_digest(f, "sha256").hexdigest()
        groups[key].append(image)

# Step 2: Identify duplicates
to_delete = []
conflicts = []
duplicate_groups = 0
cross_split_groups = 0

for images in groups.values():
    if len(images) < 2:
        continue

    duplicate_groups += 1

    labels = {p.parent.name for p in images}
    splits = {p.relative_to(dataset).parts[0] for p in images}

    if len(splits) > 1:
        cross_split_groups += 1

    # Do not delete duplicates with conflicting labels
    if len(labels) > 1:
        conflicts.append(images)
        continue

    # Prioritize keeping test images
    images.sort(key=lambda p: (
        0 if p.relative_to(dataset).parts[0] == "test" else 1,
        str(p)
    ))

    to_delete.extend(images[1:])

# Step 3: Generate preview report
lines = [
    f"Total images: {sum(map(len, groups.values()))}",
    f"Duplicate groups: {duplicate_groups}",
    f"Train/Test duplicate groups: {cross_split_groups}",
    f"Images proposed for deletion: {len(to_delete)}",
    f"Conflicting-label groups (skipped): {len(conflicts)}",
    "",
    "PROPOSED DELETIONS:"
]

for image in to_delete:
    lines.append(str(image.relative_to(dataset)))

report.write_text("\n".join(lines), encoding="utf-8")

# Step 4: Display results
for line in lines:
    print(line)


# Step 5: Delete confirmed duplicates
if conflicts or len(to_delete) != 50:
    raise SystemExit("Dataset changed. Deletion cancelled.")

confirm = input("\nType DELETE 50 to confirm: ").strip()

if confirm == "DELETE 50":
    log = dataset.parent / "deleted_duplicates.txt"
    deleted = []

    for image in to_delete:
        image.unlink()
        deleted.append(str(image.relative_to(dataset)))
        log.write_text("\n".join(deleted), encoding="utf-8")

    remaining = sum(
        1 for image in dataset.rglob("*.jpg")
    )

    print("\nDELETION COMPLETED")
    print("Deleted images:", len(deleted))
    print("Remaining images:", remaining)
    print("Deletion log:", log)

else:
    print("Deletion cancelled.")
