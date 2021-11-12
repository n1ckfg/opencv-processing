#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR

mkdir build/opencv_processing
javac -cp /Applications/Processing.app/Contents/Java/core.jar gab/opencv/*.java
mv opencv_processing/*.class build/opencv_processing/
cd build
jar cvfm ../opencv_processing.jar manifest.txt opencv_processing/*.class
cd ..
mv opencv_processing.jar ../library/