import 'dart:html';

import 'dart:math';

void main() {
  CanvasElement canvas = Element.tag('canvas');
  canvas.id = 'canvas1';
  canvas.height = 300;
  canvas.width = 500;
  
  document.body.nodes.add(canvas);

  CanvasRenderingContext2D context = canvas.getContext('2d');

  dibujarCorazon(context);


}


//  Método con el cual se dibuja la gráfica de corazón en el canvas

void dibujarCorazon(CanvasRenderingContext2D context) {
  const Red = 'red';
const Shadow = 'black';
const canvasWith = 300;
const canvasHeigth = 300;
const x_min = -3.0;
const y_min = -3.0;
const x_max = 3.0;
const y_max = 3.0;
var dx = (x_max - x_min) / canvasWith;
var dy = (y_max - y_min) / canvasHeigth;

  for (var y = y_min; y <= y_max; y += dy) {
    for (var x = x_min; x <= x_max; x += dx) {
      var expr = pow(x * x + y * y - 3, 3) - (3 * x * x * y * y * y);
      if (expr <= 0) {
        var px = (x - x_min) / (x_max - x_min) * canvasWith;
        var py = (y_max - y) / (y_max - y_min) * canvasHeigth;
        context
          ..beginPath()
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
// werdev serve
