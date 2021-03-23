// Fabián Alfonso Beirutti Pérez
// 2021 - CIU

Ball ball;
Box box;
BeachBall beachBall;
boolean lightSwitch, menu, showEffect, ballEffect, beachBallEffect, boxEffect;
boolean keyStatus, up, down, left, right, forward, backward;
float viewX, viewY, viewZ, speedView, ang;

void setup() {
  size(1200, 800, P3D);
  smooth(8);
  ball = new Ball();
  box = new Box();
  beachBall = new BeachBall();
  initCameraValues();
  menu = true;
  lightSwitch = false;
  showEffect = false;
  ballEffect = false;
  boxEffect = false;
  beachBallEffect = false;
  ang = 0;
}

void draw() {
  if (menu) menu();
  else {
    if (ballEffect) ball.effect();
    if (boxEffect) box.effect();
    if (beachBallEffect) beachBall.effect();
    if (!showEffect) {
      background(0);
      translate(width/2, height/2);
      camera(viewX, viewY, viewZ, ball.x, 0.0, ball.z*10000, 0.0, 1.0, 0.0);
      viewControls();
      showHelp();
      ball.display();
      box.display();
      beachBall.display();
    }
  }
}

void initCameraValues() {
  viewX = 0.0;
  viewY = 0.0;
  viewZ = 0.0;
  speedView = 20.0;
}

void viewControls() {
  //if (up) viewY -= speedView;
  //if (down) viewY += speedView;
  if (left) viewX -= speedView;
  if (right) viewX += speedView;
  if (forward) viewZ -= speedView;
  if (backward) viewZ += speedView;
}

// Display help
void showHelp() {
  pushMatrix();
  camera(0, 0, (height/2) / tan(PI/6), 0, 0, 0, 0, 1, 0); 
  textAlign(LEFT);
  stroke(255);
  textSize(20);
  text("> Press A - D to move left or right.", -(width/2)+20, -(height/2)+50);
  text("> Press Q - E to move forward or backward.", -(width/2)+20, -(height/2)+100);
  text("> Press L to turn on light effects.", -(width/2)+20, -(height/2)+150);
  text("> Press R to reset camera position.", -(width/2)+20, -(height/2)+200);
  text("> Press ESC to exit.", -(width/2)+20, -(height/2)+250);
  text("> If only you knew what are those numbers for...", -(width/2)+20, (height/2)-30);
  popMatrix();
}

// Initial screen
void menu() {
  background(0);
  pushMatrix();
  translate(600, 0);
  textSize(50);
  textAlign(CENTER);
  fill(255);
  text("Iluminated Scene", 0, 100);
  text("3D model", 0, 150);
  textSize(25);
  text("by Fabián B.", 0, 200);
  fill(255, 0, 0);
  text("Lets see if you can find the secret.", 0, 600);
  fill(255);
  text("Press ENTER to continue", 0, 700);
  popMatrix();
  menuEffect();
}

void menuEffect() {
  spotLight(33, 66, 255, width * 0.5, height * 0.1,
            0, cos(frameCount * 0.05), 1, 0,
            PI, 100);
 
  for(int i = 0; i < 5; i++){
    float xTranslate = map(i, 0, 4, width * 0.1, width * 0.9);
    pushMatrix();
    translate(xTranslate, height * 0.5, 0); 
    noStroke();
    sphere(width * 0.05);
    popMatrix();
  }
}

void keyPressed() {
  if (keyCode == ENTER) menu = false;
  if (showEffect == false) {
    if (key == 'R' || key == 'r') initCameraValues();
    if (key == 'L' || key == 'l') lightSwitch = !lightSwitch;
  }
  if ((key == '1') && boxEffect == false && beachBallEffect == false) {
    ballEffect = !ballEffect;
    showEffect = !showEffect;
  }
  if ((key == '2') && ballEffect == false && boxEffect == false) {
    beachBallEffect = !beachBallEffect;
    showEffect = !showEffect;
  }
  if ((key == '3') && ballEffect == false && beachBallEffect == false) {
    boxEffect = !boxEffect;
    showEffect = !showEffect;
  }
  
  keyStatus = true;
  if (key == 'W' || key == 'w') up = keyStatus;
  if (key == 'S' || key == 's') down = keyStatus;
  if (key == 'A' || key == 'a') left = keyStatus;
  if (key == 'D' || key == 'd') right = keyStatus;
  if (key == 'Q' || key == 'q') forward = keyStatus;
  if (key == 'E' || key == 'e') backward = keyStatus;
}

void keyReleased() {
  keyStatus = false;
  if (key == 'W' || key == 'w') up = keyStatus;
  if (key == 'S' || key == 's') down = keyStatus;
  if (key == 'A' || key == 'a') left = keyStatus;
  if (key == 'D' || key == 'd') right = keyStatus;
  if (key == 'Q' || key == 'q') forward = keyStatus;
  if (key == 'E' || key == 'e') backward = keyStatus;
}
