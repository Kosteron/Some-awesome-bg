# Stellae - Animated Wallpaper

Stellae is a kind of wallpaper engine but for linux. It uses chromium to display animated wallpapers compacted into single HTML files that embed CSS and JS as a wallpaper

**It's a personal experimental project to recreate a semblance of a wallpaper engine on Linux, don't expect miracles**

## Getting Started

Awesome screenshot here

### Dependencies

The program requires some dependencies to work properly :
- xdotool [xdotool(1) — xdotool — Debian testing — Debian Manpages](https://manpages.debian.org/testing/xdotool/xdotool.1.en.html)
- devilspie [devilspie(1) — devilspie — Debian testing — Debian Manpages](https://manpages.debian.org/testing/devilspie/devilspie.1.en.html)

**_xdotool_** : lets you programmatically (or manually) simulate keyboard input and mouse activity, move and resize windows, etc. It does this using X11's XTEST extension and other Xlib functions. 
**_devilspie_** : is a program which can detect windows as they are created, and perform actions on them if they match as set of criteria. 

Each of these programs allows the Stellae script to interact with chromium

So please install the following packages
```bash
sudo apt-get update && sudo apt-get install xdotool devilspie
```

Get the latest packaged version of Stellae, decompress where you want
```bash
unzip <STELLAE.ZIP>
```

### Usage

Please dont forget to make some-awesome-bg runnable
```
chmod +x some-awesome-bg
```

Run this command on the **some-awesome-bg** directory
```bash
bash stellae.sh help
```
You will know what to do

```bash
 BETA v1.0
-------------------------------------------------------------
- Stellae                                                   -
-------------------------------------------------------------
Type 'stellae.sh start'		for run Stellae Wallpaper
Type 'stellae.sh stop'		for stop Stellae Wallpaper
Type 'stellae.sh preset'	for a detailled config menu
Type 'stellae.sh help'		show this help
```

### Themes

Most of them are snippets from codepen
Themes are simple HTML files embedding CSS and Javascript available in the theme folder.
They are also provided with a readme file containing useful information about the origin of the script, it's creator...

type :
```bash
stellae.sh help
```
to see the saved themes :
```bash
-------------------------------------------------------------
- Stellae                                                   -
-------------------------------------------------------------

Number of preset available :
0 - Emotional Skeleton
1 - Geometrical Dimension
2 - Geometrical Dimension DC
3 - Geometrical Madness
4 - Loading 01
5 - Moon Dune
6 - Petri Culture
7 - Pokemon Pikachu
8 - Polygon Animal
9 - Polygon Madness
10 - Shy Ghost
11 - Snowy Mountain
12 - Steam Logo
13 - Stellae Space
Choose your preset >
```

If you condense everything you need in an html file you can add your own themes in the theme folder

**NOTE** : The icons are hidden behind Stellae

### Misc
#### CPU consumption / RAM consumption
TO-DO : Benchmark Stellae vs Wallpaper Engine 
#### 

### Built With

* Chromium
* [GitHub - jiahaog/nativefier: Make any web page a desktop application](https://github.com/jiahaog/nativefier) based on electron
* Bash
* HTML/CSS/JS trinity

### Authors

* Automnes - Core script (stellae.sh) 

### Licence

**MIT - Licence** PLEASE READ : LICENSE.md

[The MIT License | Open Source Initiative](https://opensource.org/licenses/MIT)
[Licensing - CodePen Blog](https://blog.codepen.io/legal/licensing/)
For any complain about licensing read this :
[What Should I Do If Someone Copies My Work? - CodePen Blog](https://blog.codepen.io/documentation/faq/copied-work/)
I would like to draw your attention to

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


### To-Do

This section is a kind of version log
