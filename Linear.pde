class Line {
  
  Line() { 
  }
  
  void update() { 
    colorMode(HSB, 100);
    stroke(100, 100, 100);

    for (int i = 0; i < fft.specSize (); i++)
    {
      float power = fft.getBand(i) * (gain / 100);
      power = (log(power)/ log(10)) * (3./4.);
      float linecolor = (power*100);
      float startingpointx = 10;
      if (i != 0) {
        startingpointx = (sqrt(i*(3.5 * width))) + startingpointx;
      }
      float endpointx = startingpointx;
      float destination =  (((height/4) * 3) - (power * 200));

      if (power > 0) {
        stroke( linecolor, 80, 80);    
        line(startingpointx, (height/4) * 3, endpointx, destination );
        stroke(linecolor, linecolor, linecolor, linecolor);

        if ( complex_lines == false && i > lasti_linear) {
          line(lastx_linear, lasty_linear, endpointx, destination);
        } else { 
          if (complex_lines) {
            line(lastx_linear, lasty_linear, endpointx, destination);
          }
        }
        noStroke();
        fill(linecolor, 80, 80 );
        ellipse(endpointx, destination, power * dot_size, power* dot_size );


        if (destination > 0) {
          lastx_linear = endpointx;
          lasty_linear = destination;
          lasti_linear = i;
        }
      }// end of if != 0 statement
      //ellipse(endpointx, destination , 1 ,1 );
    }
  } // end of if statement

}
