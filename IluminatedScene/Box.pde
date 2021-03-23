// Fabián Alfonso Beirutti Pérez
// 2021 - CIU

class Box {
  float x, y, z, ang;
  float locX, locY;
  
  Box() {
    this.x = 2000;
    this.y = 0;
    this.z = -4000;
    this.ang = 0;
  }
  
  void display(){
    pushMatrix();
    translate(this.x, this.y, this.z);
    textSize(75);
    text("3", 0, 500);
    rotateX(radians(ang));
    rotateY(radians(ang));
    noStroke();
    box(width*0.25);
    popMatrix();
    
    ang=ang+0.50;
    if (ang>360) ang=0;
  }
  
  void effect() {
    background(0);
    camera();
    locX = mouseX - height/2;
    locY = mouseY - width/2;
    ambientLight(50, 50, 50);
    directionalLight(255, 0, 0, 0.25, 0.25, 0);
    pointLight(0, 0, 255, locX, locY, 250);
    pushMatrix();
    translate(width * 0.5, height * 0.5, -width * 0.25);
    textAlign(LEFT);
    textSize(35);
    text("> This is how the original effect looks like.", -(width/2)-225, -(height/2)-80);
    text("> Use the mouse to change the direction of the lights.", -(width/2)-225, -(height/2));
    text("> Press 3 to return.", -(width/2)-225, -(height/2)+80);
    rotateZ(frameCount * 0.02);
    rotateX(frameCount * 0.02);
    specular(250);
    box(width * 0.25);
    popMatrix();
  }
}
