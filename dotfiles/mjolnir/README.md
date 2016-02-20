# Mjolnir configuration

All my keys are prefixed with `hyper` which is `ctrl+shift+alt+cmd`, which is bound to a single key on my keyboard. This is set to a variable `hyper` and can be easily changed.

## Hotkeys

### Reload Mjolnir Configuration

After editing the init.lua file, Mjolnir must be reloaded with `hyper + 0`.

### Grid system

#### Mapping a key to a cell (section of the screen)
The thought process behind this is ease of moving and resizing windows on a grid
system capable of being done solely by my left hand.

Considering a standard layout of QWERTY, the left hand on my keyboard makes a
3x5 grid with [QWERTY, ASDFG, ZXCVB] being the rows. Each character is mapped to
a cell in this grid.

|Q|W|E|R|T|
|:---: |:---: |:---: |:---: |:---: |
| **A** | **S** | **D** | **F** | **G** |
| **Z** | **X** | **C** | **V** | **B** |

#### Spanning multiple cells
Combining 2 or more of these keys will use the rectangle defined by the keys to
create a layout spanning those corners on the outermost edges. For example,
pressing `hyper+Q+A` will resize the window to span a 2 cell tall window in the
top left of the screen. Another example, pressing `hyper+Q+A+S+D` if you have
that many fingers would produce a 2 tall and 3 wide window in the top left
corner of the screen. Redundant keys are ignored.

#### Configuration

The variable `grid_keys`, `grid.GRIDWIDTH`, and `grid.GRIDHEIGHT` determine the
configuration for this system.

### Spaces

- `hyper + ]`: Switch to next space
- `hyper + [`: Switch to previous space
- `hyper + =`: Move focused window to next space
- `hyper + -`: Move focused window to previous space

### Focus

- `hyper + u`: Focus or open iTerm2
- `hyper + y`: Focus or open Emacs (I use Spacemacs, vim 4 lyfe)
- `hyper + o`: Focus or open Google Chrome
- `hyper + p`: Focus or open Spotify
- `hyper + \`: Focus or open Dash
- `hyper + right`: Focus window to the right
- `hyper + left`: Focus window to the left
- `hyper + up`: Focus window above
- `hyper + down`: Focus window below

### Hints
- `hyper + h`: Show window hints for all windows
- `hyper + n`: Show window hints for current application windows

### Layouts
- `hyper + l`: Cycle layouts
- `hyper + j`: Next window in layout
- `hyper + k`: Previous window in layout
- `hyper + return`: Promote window in layout to main window
