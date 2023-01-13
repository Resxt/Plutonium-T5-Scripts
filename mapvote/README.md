# Mapvote

A customizable mapvote script for the multiplayer mode of Black Ops.  

This works in custom games, combat training and dedicated servers.
You can still run the script in a private match to get a preview of the menu and configure it the way you like before using it on your server but it won't rotate to your chosen map/mode due to a technical limitation the game has.  

This is heavily inspired by [LastDemon99's IW5 mapvote](https://github.com/LastDemon99/IW5_VoteSystem).  
Huge thanks to him.

![mapvote1](images/mapvote1.png)
*Mouse and keyboard input. Changed settings: horizontal spacing: 100*

![mapvote2](images/mapvote2.png)
*Controller input. Changed settings: red colors, accent mode: max*

## mapvote.gsc

This script has to be installed in `scripts\mp` otherwise it will throw errors when playing zombies.

**[IMPORTANT]** Installing `mapvote_mp_extend.gsc` in `scripts\mp` is **mandatory** to make the mapvote work normally.  

### Main features

- It allows up to 11 elements (maps + modes) to be displayed on screen
- You can configure how much maps and modes you want on screen
- It will automatically adapt the amount of elements to display if you don't choose a fixed amount of maps/modes to show
- It has separate map and mode choices for multiplayer
- It supports custom gamemode names
- It rotates a random map from the list when there are no votes for maps. Same applies for modes too
- Controllers are fully supported and work out of the box
- It has a good level of customization
- It has a debug mode to quickly preview the menu and print some values in the console

### Getting started

By default the script is disabled to avoid running on all your servers.  
Simply set `mapvote_enable` to 1 and the script will be loaded, which as a result will display the voting menu when the game ends (after the killcam).  

To configure the menu before putting it on your server I recommend running it in a custom game with the `mapvote_debug` dvar set to `1`.  
To do that use this command in the console `set mapvote_enable 1;set mapvote_debug 1` before running a custom game.  
Start a custom game and you will see the menu.  
You can then configure the dvars directly in your console and restart the map with `map_restart` in the console to edit the menu quickly and get your perfect setup.

### Dvars

Here are the dvars you can configure:

| Name | Description | Default value | Accepted values |
|---|---|---|---|
| mapvote_enable | Toggle whether the mapvote is activated or not. 0 is off and 1 is on | 0 | 0 or 1 |
| mapvote_debug | Toggle whether the mapvote runs in debug mode or not. This will display the mapvote menu a few seconds after starting the game. 0 is off and 1 is on | 0 | 0 or 1 |
| mapvote_maps | A list of the maps that are available for rotation | Every maps including DLC maps | Any map name. Each map is separated with a colon (:) |
| mapvote_modes | A list of the modes that are available for rotation. The first parameter is how the mode will be displayed, it can be set to anything you like, the second parameter is the gametype | "Team Deathmatch,tdm:Domination,dom" | Any text followed by a comma (,) and then the gametype name. Each block is separated with a colon (:) |
| mapvote_limits_maps | The amount of maps to display. 0 will handle it automatically | 0 | Any plain number from 0 to `mapvote_limits_max` |
| mapvote_limits_modes | The amount of modes to display. 0 will handle it automatically | 0 | Any plain number from 0 to `mapvote_limits_max` |
| mapvote_limits_max | The maximum amount of elements to display (maps + modes) | 11 | Any plain number from 3 to 11 |
| mapvote_colors_selected | The color of the text when hovered or selected. This is also the color of the votes count | cyan | red, green, yellow, blue, cyan, purple, white, grey, gray, black |
| mapvote_colors_unselected | The color of the text when not hovered and not selected | white | red, green, yellow, blue, cyan, purple, white, grey, gray, black |
| mapvote_colors_timer | The color of the timer as long as it has more than 5 seconds remaining | cyan | red, green, yellow, blue, cyan, purple, white, grey, gray, black |
| mapvote_colors_timer_low | The color of the timer when it has 5 or less seconds remaining | red | red, green, yellow, blue, cyan, purple, white, grey, gray, black |
| mapvote_colors_help_text | The color of the help text at the bottom explaining how to use the menu | white | red, green, yellow, blue, cyan, purple, white, grey, gray, black |
| mapvote_colors_help_accent | The color of the accented text of the help text at the bottom | cyan | red, green, yellow, blue, cyan, purple, white, grey, gray, black |
| mapvote_colors_help_accent_mode | The accenting mode for the help text. `standard` only puts the accent color on the button to press and `max` puts it on both the buttons and the action it does | standard | standard or max |
| mapvote_sounds_menu_enabled | Toggle whether the mapvote menu sounds are enabled or not. 0 is off and 1 is on | 1 | 0 or 1 |
| mapvote_sounds_timer_enabled | Toggle whether the timer will start making a beeping sound every second when there's 5 or less seconds remaining to vote or not. 0 is off and 1 is on | 1 | 0 or 1 |
| mapvote_vote_time | The time the vote lasts (in seconds) | 30 | Any plain number above 5 |
| mapvote_blur_level | The amount of blur to put when the mapvote menu starts to show. The max recommended value is 5. 0 disables it | 2.5 | Any number |
| mapvote_horizontal_spacing | The horizontal spacing between the map/mode names on the left and the vote counts on the right. I recommend setting this value according to the longest map or mode name length so that it doesn't overlap with the vote counts | 75 | Any plain number |
| mapvote_display_wait_time | Once the killcam ends, the time to wait before displaying the vote menu (in seconds) | 1 | Any number superior or equal to 0.05 |

### Configuration

Below is an example CFG showing how each dvars can be configured.  
The values you see are the default values that will be used if you don't set a dvar.  

```c
set mapvote_enable 1
set mapvote_maps "Array:Cracked:Crisis:Firing Range:Grid:Hanoi:Havana:Jungle:Launch:Nuketown:Radiation:Summit:Villa:WMD:Berlin Wall:Discovery:Kowloon:Stadium:Convoy:Hotel:Stockpile:Zoo:Drive-in:Hangar 18:Hazard:Silo"
set mapvote_modes "Team Deathmatch,tdm:Domination,dom"
set mapvote_limits_maps 0
set mapvote_limits_modes 0
set mapvote_limits_max 11
set mapvote_colors_selected "cyan"
set mapvote_colors_unselected "white"
set mapvote_colors_timer "cyan"
set mapvote_colors_timer_low "red"
set mapvote_colors_help_text "white"
set mapvote_colors_help_accent "cyan"
set mapvote_colors_help_accent_mode "standard"
set mapvote_sounds_menu_enabled 1
set mapvote_sounds_timer_enabled 1
set mapvote_vote_time 30
set mapvote_blur_level 2.5
set mapvote_horizontal_spacing 75
set mapvote_display_wait_time 1
```

Here are some pre-set values if you want to quickly copy/paste something

| Description | Value |
|---|---|
| All base game maps | "Array:Cracked:Crisis:Firing Range:Grid:Hanoi:Havana:Jungle:Launch:Nuketown:Radiation:Summit:Villa:WMD" |
| All DLC maps | "Berlin Wall:Discovery:Kowloon:Stadium:Convoy:Hotel:Stockpile:Zoo:Drive-in:Hangar 18:Hazard:Silo" |
| Classic modes | "Team Deathmatch,tdm:Domination,dom" |
| Objective modes | "Demolition,dem:Headquaters,hq:Sabotage,sab:Capture the Flag,ctf" |
| Alternative modes | "Kill Confirmed,conf:One Flag CTF,oneflag" |
| Party modes | "Gun Game,gun:One in the Chamber,oic:Sharpshooter,shrp:Sticks & Stones,hlnd" |
| FFA 24/7 | "Free for All,dm" |
| SND 24/7 | "Search & Destroy,sd" |

### Notes

- If right click is set to toggle ads then pressing right click will make the player go up by one every 0.25s until he right clicks again.  
If I didn't change it to be that way players with toggle ads would have to press right click twice to go up by one all the time.  
Now instead they simply right click once to start going up and right click again to stop which is a better user experience.
- When there's only one map/mode, instead of showing a single vote possibility, your single map/mode will be hidden to make the user experience better but it will still always rotate to your one map/mode
- If some map/mode names or vote count don't display at all then you probably have other scripts that create HUD elements and there's too much elements to display so either remove your script or lower `mapvote_limits_max` so that the mapvote will have less elements to display
- When two maps/modes have the same votes, the lowest one in the list will win. In the future it would be nice to randomize between both
- Ending the game with ESC doesn't work when in debug mode.  
Use `map_restart` in the console when your script is compiled. And if you want to leave use `disconnect` in the console until this is fixed  
- For some reason having 12 voting elements like on the other games doesn't show one of the HUD so 11 is the max.

## mapvote_mp_extend.gsc

A small script that goes with `mapvote.gsc` to make it work in multiplayer.  
It has to be installed in the `scripts\mp` directory since it contains multiplayer only code.  
Putting it in `scripts` or `scripts\zm` will throw an error when booting up a zombies map.
