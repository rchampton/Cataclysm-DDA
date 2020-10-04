#!/bin/bash

# jq .id <(cat screwdriver-TESTING.txt) or cat screwdriver-CDDA.txt | jq .id

if [ ! -z "$1" ]; then
	filemask=$1
else
	filemask="*-CDDA.txt"
fi

for f in $(ls $filemask)
do
	sed -i 's/_>/>/g' ${f}

	# Replacements where CDDA doesn't have the color pair
	sed -i 's/color_white_dark_gray/color_white/g' ${f}
	sed -i 's/color_white_light_gray/color_white/g' ${f}
	sed -i 's/color_dark_gray_light_gray/color_dark_gray/g' ${f}
	sed -i 's/color_light_gray_dark_gray/color_light_gray/g' ${f}
	sed -i 's/color_yellow_dark_gray/color_yellow/g' ${f}

	sed -i 's/  }/  },/' ${f}

    itemid=$(sed 's/-CDDA\.txt//' <(echo ${f}))
	CMD="egrep -riIn 'id.+:.+${itemid}' data/json/items"
	eval $CMD

	code ${f}
done
