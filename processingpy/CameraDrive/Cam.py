# https://processing.org/reference/camera_.html
class Cam(object):
    def __init__(self):
        self.pos = PVector(0,0,0)
        self.poi = PVector(0,0,0)
        self.up = PVector(0,0,0)
        #~
        self.p3d = g
        self.mouse = PVector(0,0,0)
        #self.proj = PMatrix3D()
        self.cam = PMatrix3D()
        #self.modvw = PMatrix3D()
        self.modvwInv = PMatrix3D()
        self.screen2Model = PMatrix3D()
        #~    
        self.displayText = ""
        self.fontSize = 12
        self.font = createFont("Arial", self.fontSize)
        #~
        self.defaultPos()
        self.defaultPoi()
        self.defaultUp()
    
    def screenToWorldCoords(self, p):
        self.cam = self.p3d.modelview.get() # camera.get()
        self.modvwInv = self.p3d.modelviewInv.get()
        self.screen2Model = self.modvwInv
        self.screen2Model.apply(self.cam)
        println(p);
        screen = [ p.x, p.y, p.z ]
        model = [ 0, 0, 0 ]
        model = self.screen2Model.mult(screen, model)
        #~        
        return PVector(model[0] + (self.poi.x - width/2), model[1] + (self.poi.y - height/2), model[2])
    
    def screenToWorldMouse(self):
        self.mouse = self.screenToWorldCoords(PVector(mouseX, mouseY, self.poi.z))
    
    '''
    Cam():
        defaultPos()
        defaultPoi()
        defaultUp()
        init()
    
    Cam(_pos):
        pos = _pos
        defaultPoi()
        defaultUp()
        init()
    
    Cam(_pos, _poi):
        pos = _pos
        poi = _poi
        defaultUp()
        init()
    
    Cam(_pos, _poi, _up):
        pos = _pos
        poi = _poi
        up = _up
        init()
    '''
    
    def update(self):
        self.screenToWorldMouse()
    
    def draw(self):
        camera(self.pos.x, self.pos.y, self.pos.z, self.poi.x, self.poi.y, self.poi.z, self.up.x, self.up.y, self.up.z)
        self.drawText()
    
    def run(self):
        self.update()
        self.draw()
    
    def move(self, x, y, z):
        p = PVector(x,y,z)
        self.pos = self.pos.add(p)
        self.poi = self.poi.add(p)
    
    def defaultPos(self):
        self.pos.x = width/2.0
        self.pos.y = height/2.0
        self.pos.z = (height/2.0) / tan(PI*30.0 / 180.0)
    
    def defaultPoi(self):
        self.poi.x = width/2.0
        self.poi.y = height/2.0
        self.poi.z = 0
    
    def defaultUp(self):
        self.up.x = 0
        self.up.y = 1
        self.up.z = 0
    
    def reset(self):
        self.defaultPos()
        self.defaultPoi()
        self.defaultUp()
    
    def drawText(self):
        if (self.displayText != ""):
            pushMatrix()    
            translate((self.pos.x - (width/2)) + (self.fontSize/2), (self.pos.y - (height/2)) + self.fontSize, self.poi.z)
            textFont(self.font, self.fontSize)
            text(self.displayText, 0, 0)
            popMatrix()

'''
TODO
https://processing.org/reference/frustum_.html
https://processing.org/reference/beginCamera_.html
https://processing.org/reference/endCamera_.html
'''