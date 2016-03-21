class Circle2 {
  int  r = 200;
  float rad = 70;
  float real_volume;
  float volume;
  float kick_opac;
  Circle2() {
  }

  void update(float gain) {
    //blendMode(DIFFERENCE);
    float t = map(mouseX, 0, width, 0, 1);
    float size_decay = circle_size_decay / 500;
    if (beat.isKick()) {
      volume = real_volume + (pulse_size / 4);
    }
    if (volume > real_volume) {
      volume *= size_decay;
    }
    fill(#1A1F18, 20);
    noStroke();
    //rect(0, 0, width, height);
    //translate(width/2, height/2);
    noFill();
    fill(-1, 10);
    if (beat.isKick()) {
      rad = rad*0.9; 
      kick_opac = 255;
    } else 
    {
      rad = 70;
    }
    kick_opac *= 0.85;
    fill(255, 255, 255, kick_opac);
    ellipse(width/2, height/2, r * 2, r * 2);

    ellipse(width / 2, height / 2, 2*rad, 2*rad);
    stroke(-1, 50);
    int bsize = input.bufferSize();
    for (int i = 0; i < bsize - 1; i+=5)
    {
      float x = (r)*cos(i*2*PI/bsize) + (width / 2);
      float y = (r)*sin(i*2*PI/bsize) + (height / 2);
      float power = input.left.get(i);
      power = (log(power)/ log(10) * 0.66) * (gain * 100) * volume; 
      ;
      if (i == 100) {
        //println(power);
      }
      multiplierx = power + 2;
      multipliery = multiplierx;
      float x2 = (r + power)*cos(i*multiplierx*PI/bsize) + (width / 2);
      float y2 = (r + power)*sin(i*multipliery*PI/bsize) + (height /2);
      line(x, y, x2, y2);
    }
    beginShape();

    stroke(-1, 50);
    colorMode(RGB, 255);
    for (int i = 0; i < bsize; i+=30)
    {
      float power = fft.getBand(i);
      power = (log(power)/ log(10) * 0.66) * (gain * 100) * volume; 
      //println("THIS POWER: " + power);
      if (abs(power) > 0.1) {
      float x2 = (r + power)*cos(i*2*PI/bsize) + (width / 2);
      float y2 = (r + power)*sin(i*2*PI/bsize) + (height / 2);
      vertex(x2, y2);
      pushStyle();
      stroke(-1);
      strokeWeight(2);
      fill(255);
      stroke((255), 255, 255, 100);
      ellipse(x2, y2, 5, 5);
      popStyle();
      }
    }
    endShape();
    // if (flag)

    // showMeta();
    blendMode(BLEND);
  }
}

