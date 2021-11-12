@echo off

cd %cd%

mkdir build\opencv_processing
javac -cp "C:\Program Files\processing\core\library\core.jar" gab\opencv\*.java
move /y opencv_processing\*.class build\opencv_processing\
cd build
jar cvfm ..\opencv_processing.jar manifest.txt opencv_processing\*.class
cd ..
move opencv_processing.jar ..\library\

@pause