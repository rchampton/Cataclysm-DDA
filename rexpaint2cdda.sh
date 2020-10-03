#!/bin/bash

for f in $(ls *-CDDA.txt)
do
	echo Processing ${f}
	sed -i 's/_>/>/g' ${f}

	# Replacements where CDDA doesn't have the color pair
	sed -i 's/color_white_dark_gray/color_white/g' ${f}
	sed -i 's/color_white_light_gray/color_white/g' ${f}
	sed -i 's/color_dark_gray_light_gray/color_dark_gray/g' ${f}

	#cat ${f} >> data/json/_append_ascii_arts.json

	# Trim >1 trailing blank line
	#sed -i 's///g' ${f}
	#sed -i 's/(\w+"\w+\n",)+\(\w+"\w+"\)/\1/g' ${f}

	code ${f}
done
