#!/usr/bin/python

import colorsys
import sys

def main():
    if len(sys.argv) == 5:
        r = float(sys.argv[1])
        g = float(sys.argv[2])
        b = float(sys.argv[3])    
        if int(sys.argv[4]) == 0:
            c = colorsys.rgb_to_hls(r, g, b)
        else:
            c = colorsys.hls_to_rgb(r, g, b)
        print c[0], c[1], c[2]
    else:
        print 0, 0, 0

if __name__ == "__main__":
    main()
