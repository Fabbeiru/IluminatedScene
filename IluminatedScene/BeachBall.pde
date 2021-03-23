// Fabián Alfonso Beirutti Pérez
// 2021 - CIU

class BeachBall {
  float x, y, z, ang;
  PShape shape, globo;
  
  BeachBall() {
    this.x = -2000;
    this.y = 0;
    this.z = -4000;
    this.ang = 0;
    shape = loadShape("beachBall.obj");
    beginShape();
    globo = createShape(SPHERE, 150);
    globo.setStroke(255);
    globo.scale(1.85, 1.09, 1.15);
    endShape(CLOSE);
  }
  
  void display(){
    pushMatrix();
    translate(this.x, this.y, this.z);
    textSize(75);
    text("2", 0, 500);
    rotateX(radians(ang));
    rotateY(radians(ang));
    shape(globo);
    popMatrix();
    
    ang=ang+0.50;
    if (ang>360) ang=0;
  }  
  
  void effect() {
    background(0);
    camera();
    if (mousePressed) {
      pointLight(250, 255, 125, mouseX, mouseY, 400);
      directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
    }
    pushMatrix();
    translate(width * 0.5, height * 0.6, -width * 0.25);
    textAlign(LEFT);
    textSize(35);
    text("> This is how the original effect looks like.", -(width/2)-225, -(height/2)-150);
    text("> Right or left click on the mouse to activate light.", -(width/2)-225, -(height/2)-80);
    text("> Move the mouse to change the direction of the lights.", -(width/2)-225, -(height/2)-10);
    text("> Press 2 to return.", -(width/2)-225, -(height/2)+60);
    rotateY(radians(ang));
    rotateX(PI);
    scale(2);
    shape(shape);
    popMatrix();
    
    ang=ang+0.50;
    if (ang>360) ang=0;
  }
}
