class Line3d {

  Line3d() {
  }

  void update() { 
    lights();
    colorMode(HSB, 100);
    stroke(100, 100, 100);
    camera(mouseX, height/2, (height/2) / tan(PI/6) + 1000, mouseX + (width/4), height - (height/4) + (mouseY - 100), 0, 0, 1, 0);

    for (int i = 0; i < fft.specSize (); i++)
    {
      pushMatrix();
      rotateX(radians(-20));
      float power = fft.getBand(i) * (gain / 100);
      power = (log(power)/ log(10)) * (2./3.);
      float linecolor = (power*100);
      float z = (power * 1000) + 100;
      float startingpointx = 10;
      if (i != 0) {
        startingpointx = int(sqrt(i * 10000 ));
        //startingpointx = (sqrt(i*(5 * width))) + startingpointx;
      }
      float endpointx = startingpointx;
      float endpointy = (((height/4) * 3) - (power * 200));

      if (power > 0) {
        translate(200, 0, z);
        stroke( linecolor, 80, 80);    
        line(startingpointx, (height/4) * 3, endpointx, endpointy );
        stroke(linecolor, linecolor, linecolor, linecolor);

        if ( complex_lines == false && i > lasti_linear) {
          line(lastx_linear, lasty_linear, endpointx, endpointy);
        } else { 
          if (complex_lines) {
            line(lastx_linear, lasty_linear, endpointx, endpointy);
          }
        }
        noStroke();
        fill(linecolor, 80, 80 );
        ellipse(endpointx, endpointy, dot_size, dot_size);
        pushMatrix();
        translate(endpointx, endpointy, z);
        sphereDetail(int(power * 50));
        sphere(power * dot_size);
        popMatrix();

        if (endpointy > 0) {
          lastx_linear = endpointx;
          lasty_linear = endpointy;
          lasti_linear = i;
        }
      }// end of if != 0 statement
      popMatrix();
    }
  }
}

