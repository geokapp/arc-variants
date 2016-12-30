#!/usr/bin/python

import colorsys
import re
import sys

def main():
    if len(sys.argv) == 3:        
        color = sys.argv[1]
        base = sys.argv[2]        
        base = re.sub('[\[A-Z\]]', '', base)
        
        rgbcolor = [0.0, 0.0, 0.0]
        rgbbase = [0.0, 0.0, 0.0]
        rgbresult = [0, 0, 0]
        
        # Convert user color hex to rgb
        rgbcolor[0] = float(int(color[0:2], 16)) / 255
        rgbcolor[1] = float(int(color[2:4], 16)) / 255
        rgbcolor[2] = float(int(color[4:6], 16)) / 255
      
        # Convert base color hex to rgb
        rgbbase[0] = float(int(base[0:2], 16)) / 255
        rgbbase[1] = float(int(base[2:4], 16)) / 255
        rgbbase[2] = float(int(base[4:6], 16)) / 255

        # Convert the rgb values to hls
        hlscolor = colorsys.rgb_to_hls(rgbcolor[0], rgbcolor[1], rgbcolor[2])
        hlsbase = colorsys.rgb_to_hls(rgbbase[0], rgbbase[1], rgbbase[2])

        # Get the rgb value of the result color. If the hue value of the user
        # color is not zero, then we use the hue value of the user color and
        # we keep the lightness and saturation of the base color. Otherwise,
        # we use the lightness of the base color and the saturation of the
        # user color.
        if hlscolor[0] > 0:
            rgb = colorsys.hls_to_rgb(hlscolor[0], hlsbase[1], hlsbase[2])
        else:
            rgb = colorsys.hls_to_rgb(hlscolor[0], hlsbase[1], hlscolor[2])

        # Convert the result to hex format
        rgbbase[0] = rgb[0] * 255
        rgbbase[1] = rgb[1] * 255
        rgbbase[2] = rgb[2] * 255
        rgbresult[0] = int(round(rgbbase[0]))
        rgbresult[1] = int(round(rgbbase[1]))
        rgbresult[2] = int(round(rgbbase[2]))
        print "%s%s%s" % (format(rgbresult[0], 'x'), format(rgbresult[1], 'x'), format(rgbresult[2], 'x')) 
    else:
        print 0, 0, 0

if __name__ == "__main__":
    main()
