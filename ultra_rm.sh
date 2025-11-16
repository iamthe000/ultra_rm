#!/bin/bash

items=(*)

if [ ${#items[@]} -eq 0 ]; then
	echo "This directory is empty!"
	exit 0
fi

echo "=== Files and Directories ==="
for i in "${!items[@]}"; do
	echo "[$i] ${items[$i]}"
done

echo ""
read -p "Enter indexes to delete (space-separated): " -a selection

echo ""
echo "Selected items:"
for idx in "${selection[@]}"; do
	echo " - ${items[$idx]}"
done

echo ""
read -p "Are you sure you want to delete them? (y/N): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
	echo "Canceled."
	exit 0
fi

echo ""
echo "Deleting..."

for idx in "${selection[@]}"; do
	target="${items[$idx]}"
	if [ -d "$target" ]; then
		rm -r "$target"
	else
		rm "$target"
	fi
	echo "Deleted: $target"
done

echo "Done!"
