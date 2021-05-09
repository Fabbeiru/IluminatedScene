# IluminatedScene by Fabián Alfonso Beirutti Pérez
Iluminated scene using processing.

## Introducción
El objetivo de esta práctica de la asignatura de 4to, Creación de Interfaces de Usuario (CIU), es seguir con los conceptos y las primitivas básicas 3D para el dibujo de objetos y aplicarles diferentes efectos de luz. Para ello, se ha pedido el desarrollo de una aplicación que componga una escena a elección propia con objetos tridimensionales que incluya texturas, luces y cámaras y cualquier extra deseado. Todo ello, usando el lenguaje de programación y el IDE llamado Processing. Este permite desarrollar código en diferentes lenguajes y/o modos, como puede ser processing (basado en Java), p5.js (librería de JavaScript), Python, entre otros.
<p align="center"><img src="/iluminatedSceneGif.gif" alt="Iluminated scene using processing"></img></p>

## Controles
Los controles de la aplicación se mostrarán en todo momento por pantalla para facilitar su uso al usuario:
- **Teclas A D:** Desplaza la cámara hacia la izquierda o derecha.
- **Teclas Q E:** Desplaza la la cámara hacia delante o atrás (se acerca/aleja la escena).
- **Tecla L:** Activa las luces de la escena.
- **Tecla R:** Resetea la posición de la cámara.
- **Tecla ESC:** Cerrar la aplicación.

## Descripción
Aprovechando que el lenguaje de programación que utiliza el IDE Processing por defecto está basado en Java, podemos desarrollar nuestro código utilizando el paradigma de programación de "Programación Orientada a Objetos". Así pues, hemos descrito tres clases de Java:
- **IluminatedScene:** clase principal.
- **Ball:** clase que representa al objeto/resultado de crear la esfera y sus efectos.
- **BeachBall:** clase que representa al objeto/resultado de crear la pelota y sus efectos.
- **Box:** clase que representa al objeto/resultado de crear el cubo y sus efectos.

Con el objetivo de alcanzar un cierto nivel de interacción con el usuario, la aplicación cuenta con una "funcionalidad oculta", no es difícil de encontrar, lo que, hay que ser observador...¿Serás capaz de encontrar el secreto que esconde la escena?

## Explicación
### Clase IluminatedScene
Esta es la clase principal de la aplicación, la cual gestiona la información mostrada por pantalla al usuario (interfaz gráfica), esto es, el desarrollo de los métodos *setup()* y *draw()*.
```java
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
```
Como se puede ver, en la función *draw()*, controlamos, según los valores de variables booleanas que se manejan según la interacción del usuario con la aplicación, qué se muestra por pantalla y con qué perspectiva. Esto es, mostrar los objetos por pantalla y aplicarles los efectos desarrollados en los métodos relativos a la clase de cada uno de ellos, *display()* y *effect()*.

Por otra parte, esta misma clase es la que maneja la interacción entre el usuario y la interfaz mediante la implementación de los métodos *keyPressed()*, *keyReleased()*, *mousePressed()*, entre otros. Un ejemplo se muestra a continuación:
```java
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
```

### Clase Ball
La estructura de la clase *Ball*, *BeachBall* y *Box* es similar. Todas tienen su constructor, método *display()* y *effect()*, siendo estos dos úlitmos propios de cada clase/objeto, consiguiendo así un efecto único para cada uno de ellos.
```java
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
```
En esta clase, se implementa un efecto lumínico para la vista general de la escena donde, todos los objetos se ven afectados por dos focos de luz, uno azul y otro rojo, ambos, mueven su punto de mira según el movimiento del ratón. De esta manera, podemos ver como los tres objetos de la escena reciben un foco de luz en diferentes direcciones: la esfera desde abajo, la pelota desde su derecha y el cubo desde su izquierda. Además, si el usuario no ha activado las luces en la escena, los objetos reciben un único foco de luz blanca, en lugar de los dos del caso anterior. La implementación de este efecto es la siguiente:
```java
if (lightSwitch) {
  pointLight(255, 0, 0, mouseX, mouseY, 00);
  pointLight(0, 0, 255, width - mouseX, height - mouseY, 00);
} else {
  pointLight(255, 255, 255, x, y+500, z);
}
```

## Funcionalidad secreta
La *hidden feature*, *easter egg* o funcionalidad secreta de la aplicación, si no la has averiguado ya, consiste en, si se pulsa la tecla numérica correspondiente con el número de las figuras u objetos que se muestran en la escena, se activará una ventana o perspectiva nueva en la que se puede apreciar y probar el efecto único de luces y sombras que tiene cada uno de ellos.

## Descarga y prueba
Para poder probar correctamente el código, descargar los ficheros (el .zip del repositorio) y en la carpeta llamada IluminatedScene se encuentran los archivos de la aplicación listos para probar y ejecutar. El archivo "README.md" y aquellos fuera de la carpeta del proyecto (IluminatedScene), son opcionales, si se descargan no deberían influir en el funcionamiento del código ya que, son usados para darle formato a la presentación y explicación del repositorio en la plataforma GitHub.

## Recursos empleados
Para la realización de este proyecto, se han consultado y/o utilizado los siguientes recursos:
* Guión de prácticas de la asignatura CIU
* <a href="https://processing.org">Página de oficial de Processing y sus referencias y ayudas</a>
* Processing IDE

Por otro lado, las librerías empleadas fueron:
* <a href="https://github.com/extrapixel/gif-animation">GifAnimation</a>

Modelo 3D de las pelotas:
* "<a href="https://skfb.ly/6SJNp">Balls</a>" by <a href="https://sketchfab.com/krolzuzannapl">SusanKing</a> from Sketchfab.
