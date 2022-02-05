# 3D touchprobe
DIY 3D touchprobe 

## Introduction
This is a model for a 3D touchprobe designed in OpenSCAD for use in CNC applications.  I've gotten my inspiration from a lot of different places, but this instructable is pretty good:
https://www.instructables.com/CNC-Manual-Touch-Probe/

As I don't have a lathe I tried to come up with a model I could 3D print or fabricate in some other way.

A youtube movie of the first prototype in action can be found here:
https://youtu.be/TQY-hZFy1YA

##Parts
* The shell can be 3D printed. The stiffer the material the better.
* The ball bearings are those of a typical skate board bearing.
* The metal rods where salvaged from a broken CD-drive.
* The pcb is used to solder the balls too. This is signficantly easier than soldering pieces of wire to the balls and it makes sure that they are placed perfectly.
* A spring to put in between the shells and the probe top part.

##Todo
* The holes in the bottom shell can be made bigger so you can use threaded inserts in stead of really long screws.
* There should be extra holes in the bottom shell to allow fine tuning the pcb level using small screws. Currently I have drilled these in manually
* Some logic circuit to connect it to your cnc machine.  I am using a Snapmaker2 which means it should interact with the CAN bus. If you have pin on the board that can be pulled high or low you don't need that part.

##Challenges
There is some bending going on in model which limits the accuracy. (so far it seems I get about 0.10mm) with the first prototype. Which is actually already pretty decent for what I want to use it for and for a fairly simple 3d printed part

##Other
This is still a very early first version that needs a significant amount of extra work.
Some pictures of the cad drawing in the pictures folder