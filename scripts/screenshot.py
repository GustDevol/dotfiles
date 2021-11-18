#!/usr/bin/python3

from sys import argv
from os import system as command
from datetime import datetime

currtime = datetime.now().strftime("%Y-%m-%d_%H:%M:%S")

dirloc = "$HOME/Pictures/Screenshots/"
filename = "screenshot_" + currtime + ".png"


def copiedshot():
    command("gnome-screenshot -a -f /tmp/tmpshot.png")
    command("xclip -selection clipbaord -t image/png /tmp/tmpshot.png")
    command("rm /tmp/tmpshot.png")


def namedshot():
    shotcommand = """
    user_filename=`echo "{0}" | dmenu -p "Filename "`
    if [ ! -e {1}"$user_filename" ] 
    then
        gnome-screenshot -a -f {1}"$user_filename" 
    else
        notify-send Screenshot "File {1}$user_filename already exists"
    fi
    """ 
    command(shotcommand.format(filename, dirloc))


def delayshot(args, mode='screen'):

    for i in range(len(args)):
        if args[i] == '-d':
            break
    delay = str(args[i + 1])

    if mode == 'window':
        command("gnome-screenshot -w -f " + dirloc + filename + " -d " + delay)
    else:
        command("gnome-screenshot -f " + dirloc + filename + " -d " + delay)


if len(argv) == 1:
    command("gnome-screenshot -f " + dirloc + filename)

elif "-n" in argv:
    namedshot()

elif "-c" in argv:
    copiedshot()

elif "-w" in argv:
    if "-d" not in argv:
        command("gnome-screenshot -w -f " + dirloc + filename)
    else:
        delayshot(argv, mode='window')

elif "-s" in argv:
    command("gnome-screenshot -a -f " + dirloc + filename)

elif "-d" in argv:
    delayshot(argv)

else:
    print("Oh crap! I specified wrong args")
