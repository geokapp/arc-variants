# arc-variants
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://www.paypal.me/geokapp)

arc-variants is a tool that generates new color variants of the [Arc theme](https://github.com/horst3180/arc-theme). In addition to the new color variants, arc-variants can generate their respective high DPI versions. Currently, the following environments are supported: GTK2, GTK3 (up to 3.22), Gnome Shell, xfwm4, and Cinnamon.

## Custom elements

arc-variants adds some custom elements to the Arc theme. However, if you prefer the vanilla Arc theme, then the tool gives you the option to preserve its original elements.

## Variants 

arc-variants generates four build-in color variants, as well as their respective dark and high DPI versions: blue, red, green, and brown. 
The user can also specify a custom color name accompanied with a color in hex format. In this case, the tool creates the new variant by generating shades of the specified color.

### arc-blue / arc-blue-hidpi

![A screenshot of arc-blue-hidpi](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/blue-light.png)

### arc-blue-dark / arc-blue-hidpi-dark

![A screenshot of arc-blue-hidpi-dark](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/blue-dark.png)

### arc-blue-darker / arc-blue-hidpi-darker

![A screenshot of arc-blue-hidpi-darker](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/blue-darker.png)

### arc-red / arc-red-hidpi

![A screenshot of arc-red-hidpi](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/red-light.png)

### arc-red-dark / arc-red-hidpi-dark

![A screenshot of arc-red-hidpi-dark](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/red-dark.png)

### arc-red-darker / arc-red-hidpi-darker

![A screenshot of arc-red-hidpi-darker](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/red-darker.png)

### arc-green / arc-green-hidpi

![A screenshot of arc-green-hidpi](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/green-light.png)

### arc-green-dark / arc-green-hidpi-dark

![A screenshot of arc-green-hidpi-dark](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/green-dark.png)

### arc-green-darker / arc-green-hidpi-darker

![A screenshot of arc-red-hidpi-darker](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/green-darker.png)

### arc-brown / arc-brown-hidpi

![A screenshot of arc-brown-hidpi](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/brown-light.png)

### arc-brown-dark / arc-brown-hidpi-dark

![A screenshot of arc-brown-hidpi-dark](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/brown-dark.png)

### arc-brown-darker / arc-brown-hidpi-darker

![A screenshot of arc-brown-hidpi-darker](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/brown-darker.png)

### arc-silver / arc-silver-hidpi (base color: #c1c1c1)

![A screenshot of arc-silver-hidpi](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/silver-light.png)

### arc-silver-dark / arc-silver-hidpi-dark (base color: #c1c1c1)

![A screenshot of arc-silver-hidpi-dark](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/silver-dark.png)

### arc-silver-darker / arc-silver-hidpi-darker (base color: #c1c1c1)

![A screenshot of arc-silver-hidpi-darker](https://raw.githubusercontent.com/geokapp/arc-variants/master/examples/silver-darker.png)

## Installation and usage

### 0. Requirements

To build the theme variants the following packages are required: 
* `autoconf`
* `automake`
* `pkg-config` or `pkgconfig` if you use Fedora
* `libgtk-3-dev` for Debian based distros or `gtk3-devel` for RPM based distros
* `git` 
* `nodejs`
* `npm` 
* `optipng`
* `inkscape`
* `python`

**Note:** If you use a docker container to build the theme then you don't need to install the above packages on your host.

**Note:** If your distribution doesn't ship separate development packages you just need GTK 3 instead of the `-dev` packages.

For the theme to function properly, install the following:
* Gnome Shell, GTK 3.14 - 3.22
* The `gnome-themes-standard` package
* The murrine engine. This has different names depending on your distro.
* `gtk-engine-murrine` (Arch Linux)
* `gtk2-engines-murrine` (Debian, Ubuntu, elementary OS)
* `gtk-murrine-engine` (Fedora)
* `gtk2-engine-murrine` (openSUSE)
* `gtk-engines-murrine` (Gentoo)

### 1. Get the source

Clone the git repository with:

    git clone https://github.com/geokapp/arc-variants && cd arc-variants

### 2. Build and install a theme variant

    ./arc-variants -i=VAR

The VAR argument has the  form: `name[-hidpi][:colorhex]`. The `name` field is the name of the color variant. It can be either a build-in variant name, or a user-defined name. In the former case, the `colorhex` field is omitted. But, in the latter case it is mandatory. The `hidpi` argument informs the tool to build the high DPI version of the requested variant. For example: `-i=red-hidpi` informs the tool to install the high DPI version of the build-in red variant. Similarly, `-i=mycolor:7636a3` informs the tool to install the user defined color variant named `mycolor` and to create shades of #7636a3. The supported build-in variants are: blue, red, green, brown.

By default, the tool produces elements for all GTK3 versions. You can use the `-v, --gtk3-versions` flag to inform the tool to build elements for the given GTK3 versions only. E.g.: 

    ./arc-variants -i=red -v="20 22"

You can also inform the tool to skip the dark variants by using the `-d, --disable-dark` flag. E.g.:   

    ./arc-variants -i=green-hidpi -v=22 -d

### 3. Uninstall a theme variant

You can use the `-u, --uninstall` flag to uninstall a variant. E.g.:

    ./arc-variants -u=red

### 4. Build and install a theme variant using a Docker container
(Credits to @MoriTanosuke for providing the Dockerfile and the instructions). 

Build the image:

    docker build -t arc-variants .

Start a temporary container, will be removed when everything is done:

    docker run --rm -it -v $(pwd):/src -w /src arc-variants

Then build the theme in the temporary container. For example:

    ./arc-variants --install=blue-hidpi && cp -r /usr/share/themes/Arc* . && exit

Now you should have the theme directories in the local directory on your host. Copy the files into /usr/share/themes and switch to your ARC theme.

### 5. Other Options

Other options to pass to arc-variants are:

    -p, --dpi       Set a custom DPI value for the high DPI variants. The default is 140. 
    -o, --original  Preserve the original assets of the vanilla Arc theme.
    -c, --clear     Delete all the generated folder inside the tool's folder.
    -h, --help      Print a help message.

After the installation is complete you can activate the theme with `gnome-tweak-tool` or a similar program by selecting `Arc`, `Arc-Darker` or `Arc-Dark` as Window/GTK+ theme and `Arc` or `Arc-Dark` as Gnome Shell/Cinnamon theme.

## Bugs
If you find a bug, please report it at https://github.com/geokapp/arc-variants/issues

## License
arc-variants is available under the terms of the GPL-3.0. See `COPYING` for details.

## Full Preview

![A full screenshot of the Arc Red light variant](http://i.imgur.com/VtOKUta.png)

![A full screenshot of the Arc Red darker variant](http://i.imgur.com/P82CLnr.png)

<sub>Screenshot Details: Icons: [Vibrancy-Colors](http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html) | [Wallpaper](http://i.imgur.com/dc8cIit.jpg) | XFCE 4.12 </sub>
