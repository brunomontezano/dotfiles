# Imports
import os
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from typing import List

# Variables
mod = "mod4"
my_terminal = "alacritty"
my_browser = "firefox"
my_file_manager = "alacritty -e vifm"
my_editor = "alacritty -e nvim"
screenshot = "scrot -e 'mv $f ~/img/screenshots/Screenshot%Y-%m-%d%H:%M:%S.png'"
screenshot_selection = "scrot -s -e 'mv $f ~/img/screenshots/Screenshot%Y-%m-%d%H:%M:%S.png'"

# Key shortcuts
keys = [
    # Launch stuff
    Key([mod], "Return", lazy.spawn(my_terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(my_browser), desc="Launches my web browser"),
    Key([mod], "f", lazy.spawn(my_file_manager), desc="Launches my file manager"),
    Key([mod], "d", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "shift"], "x", lazy.spawn("sflock -h -b 'Locked.'")),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Audio control
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute 0 toggle")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%")),

    # Screen brightness control
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 15")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 15")),

    # Cmus control
    Key([], "XF86AudioNext", lazy.spawn("cmus-remote --next")),
    Key([], "XF86AudioPrev", lazy.spawn("cmus-remote --prev")),
    Key([], "XF86AudioPause", lazy.spawn("cmus-remote --pause")),
    Key([], "XF86AudioPlay", lazy.spawn("cmus-remote --pause")),

    # Screenshot
    Key([mod], "z", lazy.spawn(screenshot)),
    Key([mod], "s", lazy.spawn(screenshot_selection)),
]

# Workspaces
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # Modifier + group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # Modifier + shift + group = switch focused window to group
         Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
             desc="Move focused window to group {}".format(i.name)),
    ])

# Connected screens
def get_monitors():
    xr = subprocess.check_output('xrandr --query | grep " connected"', shell=True).decode().split('\n')
    monitors = len(xr) - 1 if len(xr) > 2 else len(xr)
    return monitors

monitors = get_monitors()

for i in range(monitors):
    keys.extend([Key([mod, "mod1"], str(i+1), lazy.window.toscreen(i))])

# Colors
colors = {
          'background': '#202734',
          'foreground': '#CBCCC6',
          "black0": '#191E2A',
          "red0": '#FF3333',
          "green0": '#BAE67E',
          "yellow0": '#FFA759',
          "blue0": '#73D0FF',
          "magenta0": '#FFD580',
          "cyan0": '#95E6CB',
          "white0": '#C7C7C7',
          "black1": '#686868',
          "red1": '#F27983',
          "green1": '#A6CC70',
          "yellow1": '#FFCC66',
          "blue1": '#5CCFE6',
          "magenta1": '#FFEE99',
          "cyan1": '#95E6CB',
          "white1": '#FFFFFF'
          }

# Default theme for layouts
layout_theme = {"border_width": 2,
                "margin": 12,
                "border_focus": colors["yellow1"],
                "border_normal": colors["background"]
                }

# Layouts to be used
layouts = [
    layout.MonadTall(**layout_theme, ratio = 0.55),
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    layout.RatioTile(**layout_theme),
    layout.Floating(**layout_theme)
]

# Define prompt
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

# Default widget settings
widget_defaults = dict(
    font='Iosevka',
    fontsize=18,
    padding=2,
    background=colors["foreground"]
)

extension_defaults = widget_defaults.copy()

# Widgets in status bar
screens = [
    Screen(
        top=bar.Bar(
            [
              widget.GroupBox(
                       font = "Iosevka Bold",
                       fontsize = 18,
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 3,
                       borderwidth = 3,
                       active = colors["white0"],
                       inactive = colors["yellow0"],
                       rounded = False,
                       highlight_color = colors["black0"],
                       highlight_method = "line",
                       this_current_screen_border = colors["blue0"],
                       this_screen_border = colors["green0"],
                       other_current_screen_border = colors["blue0"],
                       other_screen_border = colors["green0"],
                       foreground = colors["foreground"],
                       background = colors["background"]
                       ),
             widget.TextBox(
                       text = '|',
                       font = "Iosevka",
                       background = colors["background"],
                       foreground = colors["black1"],
                       padding = 2,
                       fontsize = 18
                       ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       foreground = colors["foreground"],
                       background = colors["background"],
                       padding = 0,
                       scale = 0.8
                       ),
              widget.CurrentLayout(
                       foreground = colors["foreground"],
                       background = colors["background"],
                       padding = 5
                       ),
             widget.TextBox(
                       text = '|',
                       font = "Iosevka",
                       background = colors["background"],
                       foreground = colors["black1"],
                       padding = 2,
                       fontsize = 18
                       ),
              widget.WindowName(
                       foreground = colors["magenta0"],
                       background = colors["background"],
                       padding = 0,
                       fontsize = 18
                       ),
              widget.Prompt(
                	prompt = 'Run: ',
                	padding = 5,
                	foreground = colors["foreground"],
                	background = colors["background"],
                	),
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors["background"],
                       background = colors["background"]
                       ),

              widget.Memory(
                       foreground = colors["background"],
                       background = colors["yellow0"],
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(my_terminal + ' -e htop')},
                       format = '{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}',
                       update_interval = 10,
                       padding = 2
                       ),
              widget.Volume(
                       foreground = colors["black0"],
                       background = colors["cyan1"],
                       padding = 2
                       ),
              widget.Battery(
                      foreground = colors["black0"],
                      background = colors["green1"],
                      low_percentage = 0.25,
                      update_interval = 5,
                      full_char = '⚡',
                      charge_char = '🔌',
                      discharge_char = '🔋',
                      low_foreground = colors["black0"],
                      low_background = colors["red1"],
                      format = '{char} {percent:2.0%}',
                      padding = 2),
              widget.Clock(
                       foreground = colors["black0"],
                       background = colors["magenta1"],
                       format = " %A, %Y-%m-%d, %H:%M ",
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(my_browser + " https://calendar.google.com")},
                       padding = 2
                       ),
            ],
            24,
        ),
            wallpaper = '/home/pepper/img/wallpapers/0119.jpg',
            wallpaper_mode = 'fill',
    ),
]

# Mouse bindings in floating layouts
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# Rules for windows that'll float
floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_class='R_x11'),
    Match(wm_class='gnuplot_qt'),
    Match(wm_class='matplotlib'),
])

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# Startup script
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

wmname = "LG3D"
