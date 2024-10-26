import os
import subprocess
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import hashlib

CACHE_DIR = Path.home() / ".cache/video_thumbnails"
CACHE_DIR.mkdir(parents=True, exist_ok=True)
VIDEO_EXTENSIONS = {".mp4", ".mkv", ".avi", ".webm", ".mov", ".flv", ".wmv"}

def get_thumbnail_path(video_path):
    """Return cached thumbnail path if available, else generate it."""
    video_path = Path(video_path)
    video_hash = hashlib.md5(str(video_path).encode()).hexdigest()
    thumbnail_path = CACHE_DIR / f"{video_hash}.png"

    if thumbnail_path.exists():
        return thumbnail_path

    # Get video duration and extract thumbnail at 10%
    result = subprocess.run(
        ["ffprobe", "-v", "error", "-show_entries", "format=duration", "-of",
         "default=noprint_wrappers=1:nokey=1", str(video_path)],
        capture_output=True, text=True, check=True
    )
    duration = float(result.stdout.strip())
    timestamp = duration * 0.1

    # Generate thumbnail
    subprocess.run(
        ["ffmpeg", "-ss", str(timestamp), "-i", str(video_path),
         "-frames:v", "1", str(thumbnail_path), "-y", "-loglevel", "quiet"],
        check=True
    )
    return thumbnail_path if thumbnail_path.exists() else None

def cache_directory_thumbnails(directory):
    """Generate thumbnails for all video files in a directory."""
    video_files = [f for f in Path(directory).glob("*") if f.suffix.lower() in VIDEO_EXTENSIONS]
    with ThreadPoolExecutor(max_workers=4) as executor:
        executor.map(get_thumbnail_path, video_files)

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python video_thumbnailer.py <directory>")
        sys.exit(1)
    cache_directory_thumbnails(sys.argv[1])
