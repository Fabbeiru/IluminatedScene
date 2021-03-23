// Fabián Alfonso Beirutti Pérez
// 2021 - CIU

class Ball {
  float x, y, z, ang;
  
  Ball() {
    this.x = 0;
    this.y = 0;
    this.z = -4000;
    this.ang = 0;
  }

  void display(){
    if (lightSwitch) {
      pointLight(255, 0, 0, mouseX, mouseY, 00);
      pointLight(0, 0, 255, width - mouseX, height - mouseY, 00);
    } else {
      pointLight(255, 255, 255, x, y+500, z);
    }
    pushMatrix();
    translate(this.x, this.y, this.z);
    textSize(75);
    text("1", 0, 500);
    rotateX(radians(ang));
    rotateY(radians(ang));
    noStroke();
    sphere(width*0.25);
    popMatrix();
    
    ang=ang+0.50;
    if (ang>360) ang=0;
  }
  
  void effect() {
    background(0);
    camera();
    pointLight(255, 0, 0, mouseX, mouseY, 64);
    pointLight(0, 0, 255, width - mouseX, height - mouseY, 64);
    noStroke();
    pushMatrix();
    translate(width * 0.5, height * 0.5, -width * 0.25);
    textAlign(LEFT);
    textSize(35);
    text("> This is how the original effect looks like.", -(width/2)-225, -(height/2)-80);
    text("> Use the mouse to change the direction of the lights.", -(width/2)-225, -(height/2));
    text("> Press 1 to return.", -(width/2)-225, -(height/2)+80);
    rotateX(radians(ang));
    rotateY(radians(ang));
    sphere(width * 0.25);
    popMatrix();
    
    ang=ang+0.50;
    if (ang>360) ang=0;
  }
}
