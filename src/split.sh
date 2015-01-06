#!/bin/bash
mkdir out
for file in $(ls *.png);
do
	echo converting: $file
	#mkdir out/${file%%.*}
	/mingw64/bin/convert $file -crop 8x8@ +repage +adjoin out/${file%%.*}_%02d.png #split
	/mingw64/bin/convert out/${file%%.*}_*.png -shave 2x2 out/${file%%.*}_%02d.png #remove 2px margins
	find ./out -name "*.png" -size -275c -delete #purge crap (empty files)
done
echo done