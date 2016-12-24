#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="$1.svg"
ASSETS_DIR=$2
INDEX=$3
DARK_SRC_FILE="$1-dark.svg"
DARK_ASSETS_DIR="$2-dark"

for i in `cat $INDEX`
do

if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
	      --export-dpi=140 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
fi

if [ -f $DARK_ASSETS_DIR/$i.png ]; then
    echo $DARK_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $DARK_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
	      --export-dpi=140 \
              --export-png=$DARK_ASSETS_DIR/$i.png $DARK_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $DARK_ASSETS_DIR/$i.png 
fi

done

cp $ASSETS_DIR/entry-toolbar.png $ASSETS_DIR/../menubar-toolbar/entry-toolbar.png
cp $ASSETS_DIR/entry-active-toolbar.png $ASSETS_DIR/../menubar-toolbar/entry-active-toolbar.png
cp $ASSETS_DIR/entry-disabled-toolbar.png $ASSETS_DIR/../menubar-toolbar/entry-disabled-toolbar.png

cp $ASSETS_DIR/menubar.png $ASSETS_DIR/../menubar-toolbar/menubar.png
cp $ASSETS_DIR/menubar_button.png $ASSETS_DIR/../menubar-toolbar/menubar_button.png

cp $DARK_ASSETS_DIR/button.png $DARK_ASSETS_DIR/../menubar-toolbar/button.png
cp $DARK_ASSETS_DIR/button-hover.png $DARK_ASSETS_DIR/../menubar-toolbar/button-hover.png
cp $DARK_ASSETS_DIR/button-active.png $DARK_ASSETS_DIR/../menubar-toolbar/button-active.png
cp $DARK_ASSETS_DIR/button-insensitive.png $DARK_ASSETS_DIR/../menubar-toolbar/button-insensitive.png

cp $DARK_ASSETS_DIR/entry-toolbar.png $DARK_ASSETS_DIR/../menubar-toolbar/entry-toolbar-dark.png
cp $DARK_ASSETS_DIR/entry-active-toolbar.png $DARK_ASSETS_DIR/../menubar-toolbar/entry-active-toolbar-dark.png
cp $DARK_ASSETS_DIR/entry-disabled-toolbar.png $DARK_ASSETS_DIR/../menubar-toolbar/entry-disabled-toolbar-dark.png

cp $DARK_ASSETS_DIR/menubar.png $DARK_ASSETS_DIR/../menubar-toolbar/menubar-dark.png
cp $DARK_ASSETS_DIR/menubar_button.png $DARK_ASSETS_DIR/../menubar-toolbar/menubar_button-dark.png
exit 0
