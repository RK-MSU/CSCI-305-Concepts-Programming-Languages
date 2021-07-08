import 'dart:html';
import 'dart:async';
import 'dart:math' as math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;

Ball ball;

class Ball {
  double x = 50;
  double y = 50;
  double r = 15;
  double vx = 0;
  double vy = 0;
  Ball(this.x, this.y);
}


void main() {
  
  // init ball
  ball = new Ball(1, 1);
  
  // init ball movement
  const move = Duration(milliseconds: 12);
  // init timer
  new Timer.periodic(move, (Timer t) => update(ball));
  
  // get canvas element
  canvas = querySelector('#canvas');
  canvas.onClick.listen(jump);
  canvas.setAttribute("height", "400");
  canvas.setAttribute("width", "600");
  ctx = canvas.getContext('2d');
}

void jump(MouseEvent event) {
  ball.x = event.offset.x;
  ball.y = event.offset.y;
  update(ball);
}

void redraw() {
  ctx.save();
  
  ctx.restore();
}

void update(ball) {
  
  // 1 - apply velocity to position (vx -> x)
  ball.x += ball.vx;
  ball.y += ball.vy;

  // 2 - apply drag/friction to velocity
  ball.vx *= .99;
  ball.vy *= .99;
  
  // 3 - apply gravity to velocity
  ball.vy += .25;
  ball.vx += .25;

   // 4 - check for collisions
  if (ball.y + ball.r > canvas.height) {
    ball.y = canvas.height - ball.r;
    ball.vy = -ball.vy.abs();
  }
  
  if (ball.x + ball.r > canvas.width) {
    ball.x = canvas.width - ball.r;
    ball.vx = -ball.vx.abs();
  }

  // Draw ball
  ctx.save();
  
  ctx.fillStyle = "red";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  
  ctx.translate(ball.x, ball.y);
  ctx.fillStyle = "blue";
  ctx.beginPath();
  ctx.arc(0, 0, ball.r, 0, 44 / 7, true);
  ctx.closePath();
  ctx.fill();
  ctx.restore();
}
