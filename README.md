# Mini matrix
Output random 0 and 1 or custom characters 
# screenshot
![](/images/screenshot.png)
# Installation
## Arch
```bash
yay -S mini-matrix
```
## Debian based distros 
clone github repo
```bash
git clone https://github.com/SkwalExe/mini-matrix
```
run make
```bash
cd mini-matrix
make
```
# Usage 
```
Usage: mini-matrix [OPTION]

Autor : SkwalExe [Léopold Ibghy Koprivnik]
Github : https://github.com/SkwalExe

Displays a matrix of random characters

Options:
  -h, --help    Show this help message and exit
  -v, --version Show version and exit
  -s, --speed   Set the delay between each line [default: 0.5]
  -l, --loop    Loop the output [default: false]
  -c, --chars   Set the number of characters to output [default: 10]
  -a, --custom-chars   Set the custom characters to use [default: "01"]
```

## Example
`mini-matrix -c 20 --custom-chars "abcdefghijklmnopqrstuvwxyz"`

![](/images/screenshot2.png)

## Example with polybar  

```ini
[module/matrix]
type = custom/script
exec = mini-matrix -c 20 -s 0.07
tail = true
```
![](/images/screenshot.gif)
# Used by 
- ### [dotfiles](https://github.com/SkwalExe/dotfiles)
# final
If you have any probleme, don't hesitate to open an issue
# contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

<a href="https://github.com/SkwalExe#ukraine"><img src="https://raw.githubusercontent.com/SkwalExe/SkwalExe/main/ukraine.jpg" width="100%" height="15px" /></a>