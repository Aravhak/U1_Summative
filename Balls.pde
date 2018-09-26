class Balls
{
  float x;
  float y;
  float w;
  float h;
  float speedX;
  float speedY;
  int R;
  int G;
  int B;
  int directionY;
  int directionX;

  
  
  
  Balls()
  {
    x=random(0,width);
    y=random(0,height);
    w=random(4,9);
    h=random(4,9);
    speedX=random(-3,3);
    speedY=random(-3,3);
    R=255;
    G=255;
    B=255;
    directionX=1;
    directionY=1;
    
    
  }
  
  
  
  
  void Render()
  {
    noStroke();
   fill(R,G,B);
   ellipse(x,y,w,h);
   
   
  }
  
  void Move()
  {
    x=x+(speedX*directionX);
    y=y+(speedY*directionY);
    
    
    if(w>75|h>75)
    {
      w=random(3,7);
      h=random(3,7);
      speedX=random(-3,3);
      speedY=random(-3,3);
    }
   
   }
   
    
  
  
}