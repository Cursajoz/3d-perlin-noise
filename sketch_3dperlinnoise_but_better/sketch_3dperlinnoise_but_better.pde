float squareSize = 5;
float res = 10;
float heightConstant = 20;
void setup()
{
   size(1920, 1080, P3D);
   noStroke();
   
}
void draw()
{
  background(255);
  rotateX(radians(60));
  translate(50, -40, -100);
  pushMatrix();
   for(float x = 0; x < width/squareSize; x++){
    for(float y = 0; y < height/squareSize; y++){
      fill(setColour(x, y));
      float heightDifference = noise(x / res, y / res) * heightConstant;
      translate(0, 0, heightDifference);
      translate(x * squareSize, y * squareSize);
      box(squareSize);
      translate(-x * squareSize, -y * squareSize);
      translate(0, 0, -heightDifference);
    }
  }
  popMatrix();
}color setColour(float x, float y){
  float noiseValue = noise(x / res, y / res);
  if(noiseValue < 0.2){
   return color(0, 120, 0); 
  }else if(noiseValue < 0.4){
    return color(0, 75, 0);
  }else if(noiseValue < 0.5){
    return color(0, 90, 0);
  }else if(noiseValue < 0.6){
    return color(0, 105, 0);
  }else if(noiseValue < 0.69){
    return color(200, 200, 100);
  }else if(noiseValue < 0.7){
    return color(0, 0, 80);
  }else if(noiseValue < 0.8){
    return color(0, 25, 200);
  }else{
    return color(0, 0, 100);
  }
}
