int Count = 20;
Balls[] Balls = new Balls[Count];
int toprightX;
int toprightY;
int topleftX;
int topleftY;
int bottomrightX;
int bottomrightY;
int bottomleftX;
int bottomleftY;
int rightX;
int leftX;
int upY;
int downY;



void setup()
{
  size(800, 800);

  toprightX=800;
  toprightY=0;

  topleftX=0;
  topleftY=0;

  bottomleftX=0;
  bottomleftY=800;

  bottomrightX=800;
  bottomrightY=800;

  rightX=800;
  leftX=0;
  upY=0;
  downY=800;

  for (int i=0; i<Count; i++)
  {
    Balls[i] = new Balls();
  }
}


void draw()
{
  background(0, 0, 0);





  for (int i=0; i<Count; i++)
  {


    if (Balls[i].y<upY-5)
    {
      Balls[i].x=400;
      Balls[i].y=400;
    }

    if (Balls[i].y>downY+5)
    {
      Balls[i].x=400;
      Balls[i].y=400;
    }

    if (Balls[i].x<leftX-5)
    {
      Balls[i].x=400;
      Balls[i].y=400;
    }

    if (Balls[i].x>rightX+5)
    {
      Balls[i].x=400;
      Balls[i].y=400;
    }



    if (Balls[i].y>downY)
    {
      Balls[i].directionY=Balls[i].directionY*-1;

      Balls[i].R=255;
      Balls[i].G=0;
      Balls[i].B=255;
      Balls[i].w=Balls[i].w+0.25;
      Balls[i].h=Balls[i].h+0.25;
    }



    if (Balls[i].y<upY)
    {
      Balls[i].directionY=Balls[i].directionY*-1;

      Balls[i].R=0;
      Balls[i].G=255;
      Balls[i].B=0;
      Balls[i].w=Balls[i].w+0.25;
      Balls[i].h=Balls[i].h+0.25;
    }

    if (Balls[i].x>rightX)
    {
      Balls[i].directionX=Balls[i].directionX*-1;

      Balls[i].R=0;
      Balls[i].G=0;
      Balls[i].B=255;
      Balls[i].w=Balls[i].w+0.25;
      Balls[i].h=Balls[i].h+0.25;
    }

    if (Balls[i].x<leftX)
    {
      Balls[i].directionX=Balls[i].directionX*-1;

      Balls[i].R=255;
      Balls[i].G=0;
      Balls[i].B=0;
      Balls[i].w=Balls[i].w+0.25;
      Balls[i].h=Balls[i].h+0.25;
    }
  }



  for (int i=0; i<Count; i++)
  {
    Balls[i].Render();
    Balls[i].Move();
  }

  if (keyPressed)
  {
    if (keyCode==LEFT)
    {
      rightX=rightX-1;
      bottomrightX=bottomrightX-1;
      toprightX=toprightX-1;
    }

    if (keyCode==RIGHT)
    {
      leftX=leftX+1;
      bottomleftX=bottomleftX+1;
      topleftX=topleftX+1;
    }

    if (keyCode==DOWN)
    {
      upY=upY+1;
      topleftY=topleftY+1;
      toprightY=toprightY+1;
    }

    if (keyCode==UP)
    {
      downY=downY-1;
      bottomleftY=bottomleftY-1;
      bottomrightY=bottomrightY-1;
    }

    for (int i=0; i<Count; i++)
    {
      for (int j=0; j<Count; j++)
      {
        if (i==j)
        {
          break;
        }

        if (dist(Balls[i].x, Balls[i].y, Balls[j].x, Balls[j].y)<(Balls[i].w+Balls[j].w)/2|dist(Balls[i].x, Balls[i].y, Balls[j].x, Balls[j].y)<(Balls[i].h+Balls[j].h)/2)
        {
          {
            Balls[i].directionX=Balls[i].directionX*-1;

            Balls[i].directionY=Balls[i].directionY*-1;


            Balls[j].directionX=Balls[j].directionX*-1;

            Balls[j].directionY=Balls[j].directionY*-1;


            //Balls[i].speedX=0;
            // Balls[i].speedY=0;
            //Balls[j].speedX=0;
            // Balls[j].speedY=0;
          }
        }
      }
    }
  }
  


  strokeWeight(2);
  stroke(255,255,255);
  line(toprightX, toprightY, bottomrightX, bottomrightY);
  
  line(toprightX, toprightY, topleftX, topleftY);
  line(bottomleftX, bottomleftY, bottomrightX, bottomrightY);
  line(bottomleftX, bottomleftY, topleftX, topleftY);
}