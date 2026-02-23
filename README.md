# vbunny.sh 🐰

A tiny POSIX bunny for batch video conversion with ffmpeg.

`vbunny` is a small `/bin/sh` tool that batch-converts media files using ffmpeg.  
It’s simple, portable, and works on Linux, macOS, BSD, and minimal systems.

---

## Features

- POSIX-compliant shell script (`/bin/sh`)
- Batch conversion by extension
- Optional filename prefix with auto numbering
- Handles spaces in filenames
- No dependencies except for **ffmpeg**

---

## Requirements

- POSIX shell (`/bin/sh`)
- `ffmpeg` in PATH

---

## Installation

Clone or copy the script:

```sh
chmod +x vbunny
```

---

## Usage

`vbunny` converts media files in bulk using file extensions.

---

### Basic Syntax

```sh
vbunny -i <input_ext> -o <output_ext> [-d directory] [-f prefix]
```

---

### Options

| Flag | Description |
|------|------------|
| `-i` | Input extension (required) |
| `-o` | Output extension (required) |
| `-d` | Directory to scan (default: current directory) |
| `-f` | Optional output filename prefix (auto-numbered) |

Extensions can be provided with or without a dot.

---

### Examples

#### Convert files in current directory
Convert all `.mkv` → `.mp4`:

```sh
vbunny -i mkv -o mp4
```

---

#### Convert files in a specific folder

```sh
vbunny -d /path/to/folder -i mkv -o mp4
```

---

#### Add automatic numbering with prefix

```sh
vbunny -d /path/to/folder -i mkv -o mp4 -f video_series
```

Output:

```
video_series1.mp4
video_series2.mp4
video_series3.mp4
```

---

#### Real-world examples

Convert `.mov` → `.mp4`:

```sh
vbunny -i mov -o mp4
```

Convert `.mkv` in Downloads with numbering:

```sh
vbunny -d ~/Downloads -i mkv -o mp4 -f clip
```
