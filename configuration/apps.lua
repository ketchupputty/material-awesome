local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'terminator',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'terminator',
    screenshot = 'gnome-screenshot',
    region_screenshot = 'gnome-screenshot -a',
    delayed_screenshot = 'gnome-screenshot -d 3',
    browser = 'brave-browser',
    editor = 'gedit', -- gui text editor
    game = rofi_command,
    files = 'nautilus',
    music = rofi_command 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    'numlockx on', -- enable numlock
    'xfce4-power-manager', -- Power manager
    --'pnmixer', -- shows an audiocontrol applet in systray when installed.
    --'nm-applet --indicator', -- enable if your laptop or tower has wifi connectivity
    --'blueberry-tray', -- Bluetooth tray icon
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    --'steam -silent', -- enable if your have steam installed
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
