
# Convert `.webm` to `.gif`

All solutions available on Pop!_OS to record as `gif` is outdated or not working,
the built in screen recorder is pretty solid, so I created this script so it convert it to gif format.

# Prerequisites

Install `ffmpeg`

```bash
brew install ffmpeg
```

create `gif_converter.sh` file and paste the following:

```bash

#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input_file.webm>"
    exit 1
fi

input_file="$1"
output_file="${input_file%.*}.gif"
palette="/tmp/palette.png"

# Generate palette for better colors
ffmpeg -i "$input_file" -vf "fps=10,scale=iw:-1:flags=lanczos,palettegen" -y "$palette"

# Convert video to gif using the palette
ffmpeg -i "$input_file" -i "$palette" -filter_complex "fps=10,scale=iw:-1:flags=lanczos[x];[x][1:v]paletteuse" -loop 0 -y "$output_file"

# Notify user of completion
if [ $? -eq 0 ]; then
    echo "Conversion completed: $output_file"
else
    echo "An error occurred during conversion."
    exit 1
fi

# Clean up
rm "$palette"

```

or

```bash
#!/bin/bash

# Default values
FPS=10
SCALE="iw:-1"
LOOP=0
OUTPUT_FILE=""
QUALITY=80

# Function to display usage information
usage() {
    echo "Usage: $0 [-f fps] [-s scale] [-l loop] [-o output_file] [-q quality] input_file.webm"
    echo "  -f fps          Set frames per second (default: $FPS)"
    echo "  -s scale        Set scale (default: $SCALE)"
    echo "  -l loop         Set loop (default: $LOOP, 0 for infinite)"
    echo "  -o output_file  Set output file name (default: input_file.gif)"
    echo "  -q quality      Set quality (default: $QUALITY, lower value for smaller size)"
    exit 1
}

# Parse command-line options
while getopts "f:s:l:o:q:" opt; do
    case $opt in
        f) FPS=$OPTARG ;;
        s) SCALE=$OPTARG ;;
        l) LOOP=$OPTARG ;;
        o) OUTPUT_FILE=$OPTARG ;;
        q) QUALITY=$OPTARG ;;
        *) usage ;;
    esac
done
shift $((OPTIND - 1))

# Check if input file is provided
if [ -z "$1" ]; then
    usage
fi

input_file="$1"

# Set default output file name if not provided
if [ -z "$OUTPUT_FILE" ]; then
    OUTPUT_FILE="${input_file%.*}.gif"
fi

palette="/tmp/palette.png"

# Generate palette for better colors
ffmpeg -i "$input_file" -vf "fps=$FPS,scale=$SCALE:flags=lanczos,palettegen=stats_mode=diff:max_colors=128" -y "$palette"

# Convert video to gif using the palette and optimize for size
ffmpeg -i "$input_file" -i "$palette" -filter_complex "fps=$FPS,scale=$SCALE:flags=lanczos[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=3" -loop $LOOP -y "$OUTPUT_FILE"

# Compress the output GIF further
ffmpeg -i "$OUTPUT_FILE" -vf "fps=$FPS,scale=$SCALE:flags=lanczos" -pix_fmt rgb8 -y "$OUTPUT_FILE"

# Notify user of completion
if [ $? -eq 0 ]; then
    echo "Conversion completed: $OUTPUT_FILE"
else
    echo "An error occurred during conversion."
    exit 1
fi

# Clean up
rm "$palette"

```

# Run

```bash
chmod +x gif_converter.sh

./gif_converter.sh filename.webm

# output file in the same directory as default

```
