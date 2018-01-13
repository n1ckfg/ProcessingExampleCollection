class Cube(object):
    def __init__(self, _cam):
        global cam
        cam = _cam
        self.pos = cam.mouse
        self.rot = PVector(-PI/random(3,6), PI/random(3,6), 0)
             
    def run(self):
        pushMatrix()
        translate(self.pos.x, self.pos.y, self.pos.z)
        self.rotateXYZ(self.rot.x, self.rot.y, self.rot.z)
        box(10)
        popMatrix()
    
    def rotateXYZ(self, x, y, z):
        rotateX(x)
        rotateY(y)
        rotateZ(z)