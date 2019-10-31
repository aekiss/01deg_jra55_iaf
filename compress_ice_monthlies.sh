#!/bin/bash
module use /g/data3/hh5/public/modules/
module load conda/analysis3-unstable 

echo "doing nccompress --nccopy -r -o -p -v $@"
nccompress --nccopy -r -o -p -v "$@" && chgrp v45 "$@" && chmod g+r "$@" && rm $(dirname $1)/COMPRESS-IN-PROGRESS
