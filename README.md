# arc-variants

arc-variants is a tool that generates new color variants of the [Arc theme](https://raw.githubusercontent.com/horst3180/arc-theme). In addition to the new color variants, arc-variants can generate their respective high DPI versions. Currently, the following environments are supported: GTK2, GTK3 (up to 3.22), Gnome Shell, xfwm4, and Cinnamon.

## Custom elements

arc-variants adds some custom elements to the Arc theme. However, if you prefer the vanilla Arc theme, then the tool gives you the option to preserve its original elements.

## Variants 

arc-variants currentrly generates four color variants, as well as their respective dark and high DPI versions: blue, red, green, and brown, However, it is easy to modify the script in order add your favorite variant.

##### arc-blue / arc-blue-hidpi

![A screenshot of arc-blue-hidpi](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/blue-light.png)

##### arc-blue-dark / arc-blue-hidpi-dark

![A screenshot of arc-blue-hidpi-dark](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/blue-dark.png)

##### arc-blue-darker / arc-blue-hidpi-darker

![A screenshot of arc-blue-hidpi-darker](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/blue-darker.png)

##### arc-red / arc-red-hidpi

![A screenshot of arc-red-hidpi](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/red-light.png)

##### arc-red-dark / arc-red-hidpi-dark

![A screenshot of arc-red-hidpi-dark](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/red-dark.png)

##### arc-red-darker / arc-red-hidpi-darker

![A screenshot of arc-red-hidpi-darker](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/red-darker.png)

##### arc-green / arc-green-hidpi

![A screenshot of arc-green-hidpi](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/green-light.png)

##### arc-green-dark / arc-green-hidpi-dark

![A screenshot of arc-green-hidpi-dark](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/green-dark.png)

##### arc-green-darker / arc-green-hidpi-darker

![A screenshot of arc-red-hidpi-darker](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/green-darker.png)

##### arc-brown / arc-brown-hidpi

![A screenshot of arc-brown-hidpi](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/brown-light.png)

##### arc-brown-dark / arc-brown-hidpi-dark

![A screenshot of arc-brown-hidpi-dark](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/brown-dark.png)

##### arc-brown-darker / arc-brown-hidpi-darker

![A screenshot of arc-brown-hidpi-darker](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/brown-darker.png)

## Installation and usage

#### 0. Requirements

To build the theme variants the following packages are required: 
* `autoconf`
* `automake`
* `pkg-config` or `pkgconfig` if you use Fedora
* `libgtk-3-dev` for Debian based distros or `gtk3-devel` for RPM based distros
* `git` 
* `nvm` (https://github.com/creationix/nvm)
* `optipng`
* `inkscape`

**Note:** If your distribution doesn't ship separate development packages you just need GTK 3 instead of the `-dev` packages.

For the theme to function properly, install the following
* Gnome Shell, GTK 3.14 - 3.22
* The `gnome-themes-standard` package
* The murrine engine. This has different names depending on your distro.
* `gtk-engine-murrine` (Arch Linux)
* `gtk2-engines-murrine` (Debian, Ubuntu, elementary OS)
* `gtk-murrine-engine` (Fedora)
* `gtk2-engine-murrine` (openSUSE)
* `gtk-engines-murrine` (Gentoo)

#### 1. Get the source

Clone the git repository with:

    git clone https://github.com/geokapp/arc-variants && cd arc-variants

#### 2. Build and install a theme variant

    ./arc_variants -i=VAR

The VAR option can be one of the following:
* `blue`: The blue variants.
* `blue-hidpi`: The high DPI versions of the blue variants.
* `red`: The red variants.
* `red-hidpi`: The high DPI versions of the red variants.
* `green`: The green variants.
* `green-hidpi`: The high DPI versions of the green variants.
* `brown`: The brown variants.
* `brown-hidpi`: The high DPI versions of the brown variants.

By default, the tool produces elements for all GTK3 versions. You can use the `-v, --gtk3-versions` flag to inform the tool to build elements for the given GTK3 versions only. E.g.: 

    ./arc_variants -i=red -v="20 22"

You can also inform the tool to skip the dark variants by using the `-d, --disable-dark` flag. E.g.:   

    ./arc_variants -i=green-hidpi -v="22" -d

### 3. Uninstall a theme variant

You can use the `-u, --uninstall` flag to uninstall a variant. E.g.:

    ./arc_variants -u=red

### 4. Other Options

Other options to pass to arc-variants are

    --clear     Delete all the generated folder inside the tool's folder.
    --help      Print a help message.

After the installation is complete you can activate the theme with `gnome-tweak-tool` or a similar program by selecting `Arc`, `Arc-Darker` or `Arc-Dark` as Window/GTK+ theme and `Arc` or `Arc-Dark` as Gnome Shell/Cinnamon theme.

## Add a new color variant

It is fairly easy to add your favorite color variant to the tool. To produce the new color variants, the tool has some arrays of variant names and colors. It uses these arrays to map a new color to its respective base color. The base colors are the default colors found in the original Arc theme:

* `variants`: This array includes the variant names. Note that the high DPI name of a variant must follow its normal version name. The `vsize` variable tracks the position of the last element of this array.
* `colors0`: This array includes the base colors (blue) that will get mapped to new colors. The `0` at the end of the array name indicates that the name of this color is the string included in `variants[0]`. The variable `csize` tracks the position of the last element of this array.
* `colors1`: This array is the same as `colors0`. It is used for the high DPI version.
* `colorsN`: This array specifies the colors that  will be mapped to the base colors. The mapping is performed by columns, thus the `colorN[2]` collor will be mapped to `colors2[2]` color. The `N` at the end of the array name indicates that the name of this color is the string included in `variants[N]`. The size of this array should be `csize`.

To add a new color (e.g., yellow), open the `arc-variants` script with a text editor and perform the following:

* Add the names "yellow", and "yellow-hidpi" to the `variants` array.
* Increate the `vsize` variable by one.
* Add two new arrays `colorN`, and `colorN+1` with your desired color mappings.

## Bugs
If you find a bug, please report it at https://github.com/geokapp/arc-theme/issues

## License
arc-variants is available under the terms of the GPL-3.0. See `COPYING` for details.


