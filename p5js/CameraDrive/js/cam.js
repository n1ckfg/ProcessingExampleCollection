"use strict";

// https://processing.org/reference/camera_.html
class Cam {

    constructor(_canvas) {
        this.pos = createVector(0,0,0);
        this.poi = createVector(0,0,0);
        this.up = createVector(0,0,0);

        this.mouse = createVector(0,0,0);
        this.canvas = _canvas;
        
        this.displayText = "";
        this.font;
        this.fontSize = 12;

        this.defaultPos();
        this.defaultPoi();
        this.defaultUp();
    }

    screenToWorldMouse() {
        this.mouse = this.projectCanvasToWorld(this.canvas, createVector(mouseX, mouseY, 1));//this.poi.z)));
    }
    
    update() {
        //this.screenToWorldMouse();
    }
    
    draw() {
        camera(this.pos.x, this.pos.y, this.pos.z);//, this.poi.x, this.poi.y, this.poi.z, this.up.x, this.up.y, this.up.z);
        this.drawText();
    }
    
    run() {
        this.update();
        this.draw();
    }
    
    move(x, y, z) {
        var p = createVector(x,y,z);
        this.pos = this.pos.add(p);
        this.poi = this.poi.add(p);
    }
    
    defaultPos() {
        this.pos.x = width/2.0;
        this.pos.y = height/2.0;
        this.pos.z = (height/2.0) / tan(PI*30.0 / 180.0);
    }
    
    defaultPoi() {
        this.poi.x = width/2.0;
        this.poi.y = height/2.0;
        this.poi.z = 0;
    }
    
    defaultUp() {
     this.up.x = 0;
     this.up.y = 1;
     this.up.z = 0;
    }
    
    reset() {
     this.defaultPos();
     this.defaultPoi();
     this.defaultUp();
    }
    
    drawText() {
        /*
        if (!this.displayText.equals("")) {
            push();    
            translate((this.pos.x - (width/2)) + (this.fontSize/2), (this.pos.y - (height/2)) + this.fontSize, this.poi.z);
            //textFont(this.font, this.fontSize);
            text(this.displayText, 0, 0);
            pop();
        }
        */
    }

	// https://github.com/processing/p5.js/issues/1553
    /* Multiply a 4x4 homogeneous matrix by a Vector4 considered as point
     * (ie, subject to translation). */
	multMatrixVector(m, v) {
	    if (!(m instanceof p5.Matrix) || !(v instanceof p5.Vector)) {
	        print('multMatrixVector : Invalid arguments');
	        return;
	    }

	    var _dest = createVector();
	    var mat = m.mat4;

		// Multiply in column major order.
		_dest.x = mat[0] * v.x + mat[4] * v.y + mat[8] * v.z + mat[12];
		_dest.y = mat[1] * v.x + mat[5] * v.y + mat[9] * v.z + mat[13];
		_dest.z = mat[2] * v.x + mat[6] * v.y + mat[10] * v.z + mat[14]; 
		var w =   mat[3] * v.x + mat[7] * v.y + mat[11] * v.z + mat[15];

		if (Math.abs(w) > Number.EPSILON) {
		    _dest.mult(1.0 / w);
		}

		return _dest;
	}

	/* Project a vector from Canvas to World coordinates. */
	projectCanvasToWorld(canvas, vCanvas) {
	    // Retrieve the ModelView and Projection matrices.
	    var mv = canvas.uMVMatrix.copy();
	    var p  = canvas.uPMatrix.copy();

	    // Compute the ModelViewProjection matrix.
	    var mvp = mv.mult(p);

	    // Inverts the MVP.
	    var invMVP = mvp.invert(mvp);
	 
	    // Transform the canvas vector to Normalized Device Coordinates (in [-1, 1]³),
	    // Here viewport is (0, 0, drawingBufferWidth, drawingBufferHeight).
	    var vNDC = createVector();
	    vNDC.x = (-1.0 + 2.0 * (vCanvas.x / canvas.GL.drawingBufferWidth));
	    vNDC.y = (-1.0 + 2.0 * (vCanvas.y / canvas.GL.drawingBufferHeight));
	    vNDC.z = (-1.0 + 2.0 * (vCanvas.z));

	    // Transform vector from NDC to world coordinates.
	    var vWorld = this.multMatrixVector(invMVP, vNDC);

	    return vWorld;
	}

	/* Project a vector from World to Canvas coordinates. */
	projectWorldToCanvas(canvas, vWorld) {
	    // Calculate the ModelViewProjection Matrix.
	    var mvp = (canvas.uMVMatrix.copy()).mult(canvas.uPMatrix);

	  // Transform the vector to Normalized Device Coordinate.
	    var vNDC = this.multMatrixVector(mvp, vWorld);

	    // Transform vector from NDC to Canvas coordinates.
	    var vCanvas = createVector();
	    vCanvas.x = 0.5 * (vNDC.x + 1.0) * canvas.GL.drawingBufferWidth;
	    vCanvas.y = 0.5 * (vNDC.y + 1.0) * canvas.GL.drawingBufferHeight;
	    vCanvas.z = 0.5 * (vNDC.z + 1.0);

	    return vCanvas;
	}

}

// TODO
// https://processing.org/reference/frustum_.html
// https://processing.org/reference/beginCamera_.html
// https://processing.org/reference/endCamera_.html