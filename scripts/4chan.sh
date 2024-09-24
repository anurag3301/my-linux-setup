#!/bin/sh

if [[ ${#2} == 0 ]]
then
    echo "Please provide input as: 4chan [Thread Code] [DirName]"
    echo "Example: 4chan 24148672 demo"
    exit
fi

board=$1
thread_code=$2
dir=$3

base_dir="$HOME/.chan"
complete_dir="$base_dir/$board/$dir"
echo $complete_dir

base_url="https://boards.4chan.org"
complete_url="$base_url/$board/thread/$thread_code"
echo $complete_url

mkdir -p $complete_dir
cd $complete_dir


curl $complete_url | grep -Po '(?<=href=")[^"]*\.(webm|jpg|png)' | awk '{ print "https:"$1 }' | uniq | xargs wget -nc -T 3

echo "\n!! DOWNLOAD COMPLETED !!"
