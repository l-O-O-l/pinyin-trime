#!/bin/bash

cd trime
rm app -fr
git checkout .
git checkout develop
git branch -d release_3.1.3
git checkout tags/3.1.3 -b release_3.1.3
git submodule update --recursive --init

# update build tool versions
sed -i 's|"20.0.5594570"|"21.4.7075529"|g' app/build.gradle 
sed -i 's|"3.10.2"|"3.19.7"|g' app/build.gradle

# update code / config
rm app/src/main/assets/rime -fr
cp -r ../ptrime/* .

# update name
sed -i 's|同文输入法|同文拼音|g' app/src/main/res/values-zh-rCN/strings.xml
sed -i 's|同文輸入法|同文拼音|g' app/src/main/res/values-zh-rTW/strings.xml

f_name=$(find  app/src/main/res/ -name "*xml" | xargs fgrep "Trime" 2>/dev/null | fgrep ime_name | cut -d':' -f 1)
echo $f_name | xargs sed -i 's|ime_name">Trime|ime_name">Ptrime|g'

cd app/src/main/java/
mv com xit ; mv xit/osfans xit/offline ; mv xit/offline/trime xit/offline/ptrime;
find . -name *.java -print | xargs sed -i 's|com.osfans.trime|xit.offline.ptrime|g'
cd ../../../..
sed -i 's|com.osfans.trime|xit.offline.ptrime|g' app/src/main/res/xml/method.xml
sed -i 's|com.osfans.trime|xit.offline.ptrime|g' app/src/main/res/layout/*
sed -i 's|com/osfans/trime/Rime|xit/offline/ptrime/Rime|g' app/src/main/jni/CMakeLists.txt
sed -i 's|com.osfans.trime|xit.offline.ptrime|g' app/src/main/AndroidManifest.xml

