<a href="ja_README.md">🇯🇵日本語README</a>
# ultra_rm.sh

`ultra_rm.sh` is a simple interactive shell script that lets you delete multiple files and directories at once.
It lists all items in the current directory, allows you to select multiple entries by their index, and removes them in a single operation.
Directories are deleted recursively.

## Features

* Lists all files and directories in the current working directory
* Select multiple items by index
* Confirmation prompt before deletion
* Automatically detects directories and removes them recursively (`rm -r`)
* Uses only POSIX-friendly shell features

## Usage

### 1. Make the script executable

```bash
chmod +x ultra_rm.sh
```

### 2. Run the script

```bash
./ultra_rm.sh
```

### 3. Example interaction

If your directory contains:

```
[0] a.txt
[1] notes.md
[2] images
[3] data.json
```

You can select multiple items like this:

```
Enter indexes to delete (space-separated): 1 2
```

The script will then confirm:

```
Selected:
 - notes.md
 - images

Are you sure you want to delete them? (y/N):
```

Press `y` to proceed or anything else to cancel.

## Requirements

* Bash
* A healthy respect for `rm` (this script deletes things *for real*)

## Warning

This script **irreversibly deletes files and directories**.
Use with care — especially when running it in important paths.

## License

MIT License.
