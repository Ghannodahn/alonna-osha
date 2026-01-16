# todd-image-convert: Image Conversion Tool

**Purpose:** Batch convert images with consistent resolution and format using pyvips/libvips

**Use Cases:**
- Converting PNG to WebP for web optimization
- Standardizing image resolutions (1080p, 4k, 720p)
- Preparing images for /ig-evaluate workflow
- Batch processing visual assets

---

## Quick Start

### Basic Conversion (PNG to WebP at 1080p)

```bash
# For NEW visuals (skip existing files):
todd-image-convert *.png --resolution 1080p --output-format webp --no-replace

# For UPDATING visuals (overwrite existing):
todd-image-convert *.png --resolution 1080p --output-format webp --replace
```

### Common Use Cases

**Convert all PNGs in a directory:**
```bash
todd-image-convert docs/visuals/*.png --resolution 1080p --output-format webp
```

**Convert with custom output directory:**
```bash
todd-image-convert *.png --output-dir ./optimized --resolution 1080p
```

**High-quality 4k conversion:**
```bash
todd-image-convert *.png --resolution 4k --quality 100 --lossless
```

**Batch convert and clean up originals:**
```bash
todd-image-convert *.png --resolution 1080p --output-format webp --cleanup
```

---

## Command Reference

### Positional Arguments

- `inputs` - Input files, directories, or glob patterns
  - Examples: `*.png`, `image.jpg`, `docs/visuals/`

### Options

#### Output Settings

- `--output-dir OUTPUT_DIR` - Target output directory (default: same as input)
  - Mirrors input directory structure
  - Example: `--output-dir ./web-assets`

- `--output-format FORMAT` - Target format (default: `webp`)
  - Supported: webp, png, jpg, jpeg, tiff, etc.
  - Example: `--output-format png`

#### Resolution Presets

- `--resolution {1080p|4k|720p|original}` - Resolution preset (default: `4k`)
  - `1080p` - 1920x1080 (web/standard)
  - `4k` - 3840x2160 (high-res)
  - `720p` - 1280x720 (low-res)
  - `original` - Keep original dimensions
  - Example: `--resolution 1080p`

#### Quality Settings

- `--quality QUALITY` - Output quality 1-100 (default: `100`)
  - Higher = better quality, larger file
  - Example: `--quality 85`

- `--lossless` - Force lossless encoding (when format supports it)
  - Best quality, larger files
  - Example: `--lossless`

- `--lossy` - Force lossy encoding even at quality 100
  - Smaller files, slight quality loss
  - Example: `--lossy`

#### Metadata

- `--strip-metadata` - Remove EXIF/metadata from outputs
  - Reduces file size, removes GPS/camera info
  - Example: `--strip-metadata`

#### File Handling

- `--replace` - Overwrite existing output files
  - Use when **updating/replacing** visuals
  - Example: `--replace`

- `--no-replace` - Skip existing files silently
  - Use when generating **new** visuals
  - Default behavior if neither flag specified: warn and skip
  - Example: `--no-replace`

- `--cleanup` - Remove original files after successful conversion
  - ⚠️ **CAUTION:** Deletes source files
  - Only use when you're sure you don't need originals
  - Example: `--cleanup`

#### Performance

- `--parallel PARALLEL` - Concurrent workers (default: `8`)
  - Higher = faster (up to CPU count)
  - Example: `--parallel 16`

- `--progress` / `--no-progress` - Show real-time progress (default: enabled)
  - Example: `--no-progress` for silent operation

#### Verbosity

- `--verbosity {silent|summary|verbose}` - Logging level (default: `summary`)
  - `silent` - No output
  - `summary` - Just stats at end
  - `verbose` - Detailed per-file output
  - Example: `--verbosity verbose`

---

## Best Practices

### For /ig-evaluate Workflow

**Always convert PNG to WebP at 1080p before evaluation:**

```bash
# Step 1: Convert images
todd-image-convert docs/writing/*/visuals/*/*.png \
  --resolution 1080p \
  --output-format webp \
  --no-replace

# Step 2: Evaluate the webp files
/ig-evaluate docs/writing/*/visuals/*/*.webp
```

**Why WebP?**
- Consistent 1080p resolution
- Smaller file sizes (better for web)
- Better compression without quality loss
- Standard format for EventAI visual assets

### For New vs. Updating Visuals

**New visuals (from NotebookLM, first time):**
```bash
# Skip existing files silently (don't overwrite previous work)
todd-image-convert *.png --resolution 1080p --output-format webp --no-replace
```

**Updating/replacing visuals:**
```bash
# Overwrite existing files
todd-image-convert *.png --resolution 1080p --output-format webp --replace
```

### Resolution Selection

**Use 1080p for:**
- Web/screen display
- Infographics in curriculum
- /ig-evaluate workflow
- File size optimization

**Use 4k for:**
- Print materials
- High-resolution archives
- Posters/large displays
- Maximum quality preservation

**Use 720p for:**
- Thumbnails
- Email attachments
- Quick previews
- Extreme file size constraints

### Quality Settings

**Default (quality 100, auto lossless/lossy):**
- Best for most use cases
- Smart compression based on format

**Explicit lossless:**
```bash
todd-image-convert *.png --quality 100 --lossless
```
- Largest files, zero quality loss
- Good for archival

**Optimized for web (lossy):**
```bash
todd-image-convert *.png --quality 85 --lossy
```
- Good balance of size/quality
- Recommended for web assets

### Parallel Processing

**Default (8 workers):**
- Good for most systems
- Balanced CPU usage

**High-end system (16+ cores):**
```bash
todd-image-convert *.png --parallel 16
```
- Faster processing
- Higher CPU usage

**Low-end system or background processing:**
```bash
todd-image-convert *.png --parallel 4
```
- Lighter CPU usage
- Slower but doesn't freeze system

---

## Common Workflows

### 1. EventAI Infographic Pipeline

```bash
# Download PNGs from NotebookLM to docs/writing/topic/visuals/name/

# Convert to 1080p WebP
cd docs/writing/1-transformation/visuals/barriers
todd-image-convert *.png --resolution 1080p --output-format webp --no-replace

# Evaluate
/ig-evaluate *.webp

# Review evaluation report
cat barriers.eval.md
```

### 2. Bulk Conversion for Web

```bash
# Convert all images in a tree to WebP
todd-image-convert docs/writing/**/*.png \
  --resolution 1080p \
  --output-format webp \
  --quality 85 \
  --strip-metadata \
  --no-replace \
  --parallel 16
```

### 3. Archive High-Res Originals

```bash
# Keep originals, create 4k lossless copies
todd-image-convert originals/*.png \
  --output-dir ./archive-4k \
  --resolution 4k \
  --quality 100 \
  --lossless
```

### 4. Replace Old Assets

```bash
# Regenerated infographics, need to overwrite
todd-image-convert new-barriers/*.png \
  --resolution 1080p \
  --output-format webp \
  --replace
```

---

## Troubleshooting

### "ModuleNotFoundError: No module named 'todd_media.image_converter'"

**Problem:** Environment variables not set

**Solution:** Set PYTHONPATH
```bash
export PYTHONPATH="/Users/ja/Documents/CodeProjects/todd-lab/.todd/lib/py/todd-media/image-converter:$PYTHONPATH"
```

Or add to `~/.zshrc` permanently:
```bash
echo 'export PYTHONPATH="/Users/ja/Documents/CodeProjects/todd-lab/.todd/lib/py/todd-media/image-converter:$PYTHONPATH"' >> ~/.zshrc
source ~/.zshrc
```

### "libvips is required for pyvips"

**Problem:** libvips library not found

**Solution:** Set DYLD_LIBRARY_PATH
```bash
export DYLD_LIBRARY_PATH="/opt/homebrew/opt/vips/lib:$DYLD_LIBRARY_PATH"
```

Or install vips if not installed:
```bash
brew install vips
```

Or add to `~/.zshrc` permanently:
```bash
echo 'export DYLD_LIBRARY_PATH="/opt/homebrew/opt/vips/lib:$DYLD_LIBRARY_PATH"' >> ~/.zshrc
source ~/.zshrc
```

### "No files processed" or "skipped=N"

**Check:**
1. Input glob pattern matches files: `ls *.png`
2. Files aren't already converted (use `--replace` to overwrite)
3. Verbosity level allows output: `--verbosity verbose`

### Conversion fails on some files

**Try:**
1. Check file permissions: `ls -la *.png`
2. Verify images aren't corrupted: `file *.png`
3. Use `--verbosity verbose` to see detailed errors

---

## Environment Setup (One-Time)

**Add to ~/.zshrc for permanent setup:**

```bash
# todd-image-convert environment
export PYTHONPATH="/Users/ja/Documents/CodeProjects/todd-lab/.todd/lib/py/todd-media/image-converter:$PYTHONPATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/opt/vips/lib:$DYLD_LIBRARY_PATH"
```

Then reload:
```bash
source ~/.zshrc
```

Test it works:
```bash
todd-image-convert --help
```

---

## Integration with /ig-evaluate

The `/ig-evaluate` skill **requires** images to be converted to WebP at 1080p before evaluation.

**Automatic workflow:**
```bash
# /ig-evaluate should handle conversion internally, but if manual:
todd-image-convert visuals/*.png --resolution 1080p --output-format webp --no-replace
/ig-evaluate visuals/*.webp
```

**Why this requirement:**
- Consistent resolution for comparison
- Smaller files for faster evaluation
- Standard format for EventAI assets
- Better web performance

---

## Tips & Tricks

### Preview Before Converting

```bash
# List what would be converted (dry run via ls)
ls docs/writing/*/visuals/*/*.png

# Then convert
todd-image-convert docs/writing/*/visuals/*/*.png --resolution 1080p
```

### Convert Only New Files

```bash
# Use --no-replace to skip existing webp files
todd-image-convert *.png --resolution 1080p --output-format webp --no-replace
```

### Silent Batch Processing

```bash
# For cron jobs or scripts
todd-image-convert *.png --resolution 1080p --verbosity silent --no-progress
```

### Check Output Stats

```bash
# Default summary shows conversion stats
todd-image-convert *.png --resolution 1080p

# Output: "Summary: total=10 converted=8 skipped=2 errors=0"
```

---

## Technical Details

**Underlying Library:** pyvips (Python bindings for libvips)

**Supported Formats:**
- Input: PNG, JPG, JPEG, TIFF, GIF, BMP, WebP, and more
- Output: WebP, PNG, JPG, JPEG, TIFF, and more

**Performance:**
- Multi-threaded by default (--parallel 8)
- Efficient memory usage via libvips streaming
- Fast conversion (typically 1-2 seconds per 1080p image)

**Quality:**
- Lossless WebP when quality=100 (default)
- Lossy WebP when quality<100 or --lossy flag
- Preserves color profiles unless --strip-metadata

---

## See Also

- `/ig-evaluate` - Infographic evaluation workflow
- EventAI Visual Identity Guide - Brand standards
- Infographics Best Practices - Tufte principles

---

*Skill maintained by: EventAI + Lemmy System*
*Last updated: December 29, 2025*
