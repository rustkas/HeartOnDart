/**
 * Programa: Hearth on Dart v1.0
 * Developer : William Méndez
 * Licence: GPL V3
 */

import 'dart:html';
import 'dart:math';
/**
 * Declaración de Variables
 */
const String Red = "red";
const String Shadow = "black";
const int canvasWith=400;
const int canvasHeigth = 400;
const int x_min = -3;
const int y_min = -3;
const int x_max = 3;
const int y_max = 3;
var dx = (x_max - x_min)/canvasWith;
var dy = (y_max - y_min)/canvasHeigth;

/**
 * Seleccionamos nuestra etiqueta canvas del html
 */

final CanvasRenderingContext2D context =
      (querySelector("#canvas") as CanvasElement).context2D;
/**
 * Método con el cual se dibuja la gráfica de corazón en el canvas
 */
void DibujarCorazon(){
     for(var y= y_min; y<=y_max; y+=dy)
     {
       for(var x = x_min; x<=x_max; x+=dx)
       {
         var expr = pow(x*x+y*y-3,3)-(3*x*x*y*y*y);
         if(expr <=0)
         {
           var px = (x - x_min)/(x_max -x_min)* canvasWith;
           var py = (y_max -y) /(y_max-y_min)*canvasHeigth;
           context ..beginPath()
                   ..fillStyle = Red
                   ..shadowOffsetX = 5
                   ..shadowOffsetY = 5
                   ..shadowBlur = 4
                   ..fillRect(px, py, 1, 1)
                   ..shadowColor = Shadow;
         }
       }
     } 
}

/**
 * Método principal
 */
void main() {
  DibujarCorazon();
}
