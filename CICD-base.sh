. ./bzroot.sh
cd ..
unzip "$filename" "bzfirmware" -d "$dir"
cd ./"$dir" || exit
mkdir firmware
firmware=$(realpath ./firmware)
cd "$firmware" || exit
unsquashfs -d $firmware ../bzfirmware
rm ../bzfirmware
cd ..
tar -cf bzfirmware.tar -C ./firmware .
rm -dr firmware
mv bzfirmware.tar ../CICD-base/
