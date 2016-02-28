class Circle3 {
  int  r = 200;
  float rad = 70;

  Circle3() {
  }

  void update()
  { 
    float t = map(mouseX, 0, width, 0, 1);
    fill(#1A1F18, 20);
    noStroke();
    noFill();
    fill(-1, 10);
    if (beat.isOnset()) rad = rad*0.9;
    else rad = init_size;
    r = int(init_size);
    //ellipse(0, 0, 2*rad, 2*rad);
    stroke(master * 1400);
    int bsize = input.bufferSize();
    for (int i = 0; i < bsize - 1; i+=5)
    {
      float power = input.left.get(i);
      power = (log(power)/ log(10) * 0.66) ;
      float x = (r)*cos(i*2*PI/bsize) + width /2;
      float y = (r)*sin(i*2*PI/bsize) + height/2;
      float x2 = (r + power)*cos(i*2*PI/bsize) + width /2;
      float y2 = (r + power)*sin(i*2*PI/bsize) + height/2;
      //line(x, y, x2, y2);
    }
    beginShape();
    colorMode(HSB,140);
    fill(master * coloroffset,80,80);
    //stroke(-1, 50);
    for (int i = 0; i < bsize; i+=10)
    {
      float power = input.left.get(i) * (gain /100);;
      power = (log(power)/ log(10) * 0.66) ;
      float x2 = (r + (input.left.get(i)*2000) * (gain /100 ))*cos(i*2*PI/bsize) +width/2;
      float y2 = (r + (input.left.get(i)*2000) * (gain /100 ))*sin(i*2*PI/bsize) +height/2;
      pushStyle();
      stroke(abs(power *140), 80,80);
      //println("POWER * 100 " + power * 200);
      vertex(x2, y2);
      
      
      stroke(-1);
      strokeWeight(2);
      popStyle();
    }

    endShape();
    
    for (int i = 0; i < bsize; i+=10)
    {
      float power = input.left.get(i) * (gain /100);;
      power = (log(power)/ log(10) * 0.66) ;
      if (i == 10) {
        //println(power);
      }
      float x2 = (r + (input.left.get(i)*2000) * (gain /100 ))*cos(i*2*PI/bsize) +width/2;
      float y2 = (r + (input.left.get(i)*2000) * (gain /100 ))*sin(i*2*PI/bsize) +height/2;
       noStroke();
       //stroke(abs(power *140), 80,80);
       fill(abs(power * 70) + coloroffset, 80, 80);
      ellipse(x2,y2, dot_size, dot_size);
    }
    // if (flag)
    // showMeta();
  }
}

