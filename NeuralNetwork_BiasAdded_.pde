Perceptron brain;

Point[] points = new Point[100];

void setup() {
  size(800,800);
  brain = new Perceptron(3);
  
  for (int i = 0; i < points.length ; i++){
    points[i] = new Point();
  }
  
  float[] inputs = {-1, 0.5, 1};
  int guess = brain.guess(inputs);
  println(guess);
}

void draw() {
  background(255);
  stroke(0);
  
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line(p1.pixelX(),p1.pixelY(),p2.pixelX(),p2.pixelY());
  
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  
  line(p3.pixelX(),p3.pixelY(),p4.pixelX(),p4.pixelY());
  
  for(Point pt : points){
    pt.show();
  }
  
  for (Point pt : points){
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;
    int guess = brain.guess(inputs);
    if (guess == target){
      fill(0,255,0);
    }else{
      fill(255,0,0);
    }
    noStroke();
    ellipse(pt.pixelX(), pt.pixelY(), 16, 16);
  }    
}
  

void mousePressed() {
  for (Point pt : points){
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;
    brain.train(inputs, target);
  }
}
