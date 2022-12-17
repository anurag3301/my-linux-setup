#!/bin/sh

if [[ ${#2} == 0 ]]
then
    echo "Please provide input as: 4chan [Thread Code] [DirName]"
    echo "Example: 4chan 24148672 demo"
    exit
fi

thread_code=$1
dir=$2

base_dir="$HOME/.chan"
complete_dir="$base_dir/$dir"

base_url="https://boards.4chan.org/gif/thread"
complete_url="$base_url/$thread_code"

mkdir -p $complete_dir
cd $complete_dir

curl $complete_url | grep -Po '(?<=href=")[^"]*.webm' | awk '{ print "https:"$1 }' | uniq | xargs wget -nc -T 3

echo "\n!! DOWNLOAD COMPLETED !!"
