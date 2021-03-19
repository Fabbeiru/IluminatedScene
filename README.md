# IluminatedScene by Fabián Alfonso Beirutti Pérez
Iluminated scene using processing.

## Introducción
El objetivo de esta segunda práctica de la asignatura de 4to, Creación de Interfaces de Usuario (CIU), es empezar a tratar los conceptos y las primitivas básicas 3D para el dibujo de objetos. Para ello, se ha pedido el desarrollo de una aplicación que componga una escena a elección propia con objetos tridimensionales que incluya texturas, luces y cámaras y cualquier extra deseado. Todo ello, usando el lenguaje de programación y el IDE llamado Processing. Este permite desarrollar código en diferentes lenguajes y/o modos, como puede ser processing (basado en Java), p5.js (librería de JavaScript), Python, entre otros.
<p align="center"><img src="/IluminatedSceneGif.gif" alt="Iluminated scene using processing"></img></p>

## Controles
Los controles de la aplicación se mostrarán en todo momento por pantalla para facilitar su uso al usuario:
- **Teclas W A S D:** Desplaza la nave respecto a los ejes X e Y (sube/baja, izquierda/derecha).
- **Teclas Q E:** Desplaza la nave respecto al eje Z (se acerca/aleja al sistema).
- **Tecla C:** Cambia la perspectiva.
- **Teclas N M:** Al presionar estas teclas podremos rotar nuestro sistema planetario para observar el resultado en su completitud.
- **Tecla R:** Resetea la posición de la nave y la rotación del sistema planetario.
- **Tecla ESC:** Cerrar la aplicación.

## Descripción
Aprovechando que el lenguaje de programación que utiliza el IDE Processing por defecto está basado en Java, podemos desarrollar nuestro código utilizando el paradigma de programación de "Programación Orientada a Objetos". Así pues, hemos descrito tres clases de Java:
- **IluminatedScene:** clase principal.

Para la realización de este proyecto se ha reutilizado el código de *PlanetarySystem*. Así pues, se han aplicado mejoras funcionales y extras al mismo como, por ejemplo, una pantalla de inicio dinámica o un efecto de campo de estrellas o *starfield* que transmite la sensación al usuario de velocidad, esto es, que se desplaza en el sistema.

## Explicación
### Clase IluminatedScene

## Descarga y prueba
Para poder probar correctamente el código, descargar los ficheros (el .zip del repositorio) y en la carpeta llamada IluminatedScene se encuentran los archivos de la aplicación listos para probar y ejecutar. El archivo "README.md" y aquellos fuera de la carpeta del proyecto (IluminatedScene), son opcionales, si se descargan no deberían influir en el funcionamiento del código ya que, son usados para darle formato a la presentación y explicación del repositorio en la plataforma GitHub.

## Recursos empleados
Para la realización de este sistema planetario en 3D, se han consultado y/o utilizado los siguientes recursos:
* Guión de prácticas de la asignatura CIU
* <a href="https://processing.org">Página de oficial de Processing y sus referencias y ayudas</a>
* Processing IDE

Por otro lado, las librerías empleadas fueron:
* <a href="https://github.com/extrapixel/gif-animation">GifAnimation</a>
