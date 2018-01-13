from Cam import *
from Cube import *
from Controls import *

def setup():
    size(1280, 720, P3D)
    #~
    global cam, cubes
    cam = Cam()
    cubes = []
    #~
    setupControls(cam)
    noStroke()

def draw():
    lights()
    background(0)

    pushMatrix()
    translate(width/2, height/2, 0)
    rotateX(-PI/6)
    rotateY(PI/3)
    box(100)
    popMatrix()
    
    updateControls()
    cam.run()
    
    for cube in cubes:
        cube.run()

    #surface.setTitle(""+frameRate)


def mousePressed():
    global cam
    cubes.append(Cube(cam))