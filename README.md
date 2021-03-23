# IluminatedScene by Fabián Alfonso Beirutti Pérez
Iluminated scene using processing.

## Introducción
El objetivo de esta segunda práctica de la asignatura de 4to, Creación de Interfaces de Usuario (CIU), es empezar a tratar los conceptos y las primitivas básicas 3D para el dibujo de objetos. Para ello, se ha pedido el desarrollo de una aplicación que componga una escena a elección propia con objetos tridimensionales que incluya texturas, luces y cámaras y cualquier extra deseado. Todo ello, usando el lenguaje de programación y el IDE llamado Processing. Este permite desarrollar código en diferentes lenguajes y/o modos, como puede ser processing (basado en Java), p5.js (librería de JavaScript), Python, entre otros.
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
Esta es la clase principal de la aplicación, la cual gestiona la información mostrada por pantalla al usuario (interfaz gráfica), esto es, el desarrollo de los métodos setup() y draw().
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
```

## Descarga y prueba
Para poder probar correctamente el código, descargar los ficheros (el .zip del repositorio) y en la carpeta llamada IluminatedScene se encuentran los archivos de la aplicación listos para probar y ejecutar. El archivo "README.md" y aquellos fuera de la carpeta del proyecto (IluminatedScene), son opcionales, si se descargan no deberían influir en el funcionamiento del código ya que, son usados para darle formato a la presentación y explicación del repositorio en la plataforma GitHub.

## Recursos empleados
Para la realización de este sistema planetario en 3D, se han consultado y/o utilizado los siguientes recursos:
* Guión de prácticas de la asignatura CIU
* <a href="https://processing.org">Página de oficial de Processing y sus referencias y ayudas</a>
* Processing IDE

Por otro lado, las librerías empleadas fueron:
* <a href="https://github.com/extrapixel/gif-animation">GifAnimation</a>

Modelo 3D de las pelotas:
* "<a href="https://skfb.ly/6SJNp">Balls</a>" by <a href="https://sketchfab.com/krolzuzannapl">SusanKing</a> from Sketchfab.
