import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';

class GameLoop extends Animatable{


  bool advanceTime(num time) {
    //place all timing code here!
    ball.update();
    return true;
  }
}

CanvasElement canvas = querySelector('#stage');
Stage stage = new Stage(canvas);
RenderLoop loop = new RenderLoop();
GameLoop gameLoop = new GameLoop();

var ball = new BouncingBall();

mainCall(){
  loop.addStage(stage);
  stage.juggler.add(gameLoop);
  stage.addChild(ball);
}


class BouncingBall extends Sprite{
  Vector2 velocity = new Vector2(1.0,0.0);
  Vector2 gravity = new Vector2(0.0,0.1);
  Shape circle =  new Shape();
  BouncingBall(){
    addChild(circle);
  }
  update(){
    velocity += gravity;
    circle.x += velocity.x;
    circle.y += velocity.y;

    if(circle.y > 350){
      velocity.y *= -0.96;
    }
    graphics.clear();
    graphics..circle(circle.x, circle.y, 25)..fillColor(Color.Red);

  }
}
