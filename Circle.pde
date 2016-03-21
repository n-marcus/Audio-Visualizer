class Circle {
  float size_decay, power, linecolor, index, actual_size;
  float xstart, ystart, xend, yend;
  int x;


  //here we draw the inner circle in the middle of the screen

  Circle() {
  }

  void update(float rotate) {
    radius_inner = init_size;
    colorMode(HSB, 100);
    size_decay = circle_size_decay / 1000;


    // this blob of code makes the circle bounce to the beat in the middle
    if (beat.isKick()) { 
      rotate = rotate + 200;

      nucleus_alpha = 100;
      nucleus_color = random(50) + 50;  //Hue of circle is random. Could make this more applicable
    }

    nucleus_alpha *= 0.9; //the circle always shrinks

    fill(nucleus_color, nucleus_color, nucleus_color, nucleus_alpha);
    ellipse(width/2, height/2, variable_radius_inner * 2, variable_radius_inner * 2 ); //drawing the 'nucleus'

    //here we start the fft processesss
    for (int i=0; i< (numPoints); i++) {

      power = fft.getBand(i) * (gain /100);//fft'ing our sound
      power = (log(power)/ log(10) * 0.66) ; //compressing the incoming sound


      if (rotatespeed < 20) { 
        linecolor = (power * 100);//calculating beautiful colors
      } else { 
        index = i ;
        linecolor = ((index / numPoints) * 2000);// this makes the color's when rotationspeed > 20
      } 


      x = int(sqrt(i * 1000 )+ rotate); // this is where the magic happens, this makes sure the frequency axis is algorithmic instead of linear. The last number added is the amount the whole spectrum shifts over the circle
      // we only draw when we need to draw: 
      if (power > 0) {
        if (variable_circle_size) {
          variable_radius_inner = (radius_inner * (power * 2)) + init_size + 100; //making a variable size of the inner circle if statement for on/off switching
        } else if ( beat_circle_size && beat.isKick()) { //this pulsates the circle
          beat_circle_size_float = radius_inner + pulse_size;
        } else {
          variable_radius_inner = radius_inner; //making sure it is always the right radius thing
        }

        if (beat_circle_size && beat_circle_size_float > radius_inner) {
          variable_radius_inner = beat_circle_size_float;
          beat_circle_size_float -= size_decay;
        }

        //creating all the floats needed for one for operation, not sure if my cpu likes this, will ask Marc
        xstart = (variable_radius_inner*sin(angle_inner*x) + (width/2));
        ystart = (variable_radius_inner*cos(angle_inner*x) + (height/2));
        xend = (((radius_outer * power /2) + variable_radius_inner) *sin(angle_outer*x) + (width/2) );
        yend = (((radius_outer * power /2) + variable_radius_inner) *cos(angle_outer*x) + (height/2) );
        // defining the right colours associated with the power of the current frequency in the for-loop
        stroke(linecolor, 80, 80);
        fill(linecolor, 80, 80);
        line( xstart, ystart, xend, yend );

        //an if statement to handle complex_lines TRUE or FALSE, true draws lines between each following point in the x - axis, off only draws when frequencies are actually next to each other.
        if ( complex_lines == false && i > lasti_circle) {
          line(lastx_circle, lasty_circle, xend, yend);
        } else { 
          if (complex_lines) {
            line(lastx_circle, lasty_circle, xend, yend);
          }
        }
        // this is where the little balls on top gets made
        noStroke();
        if (rotatespeed < 20) { 
          actual_size = linecolor * (dot_size * 2 / 100);
        } else {
          actual_size = (power * 100) * (dot_size * 2 / 100);
        }
        ellipse(xend, yend, actual_size, actual_size);

        //declaring data for next iteration, this is needed to draw the (complex) lines
        lastx_circle = xend;
        lasty_circle = yend;
        lasti_circle = i;
      }  
    } //end of if statement

    stroke(master * 1000, master * 100, master * 500);
  }
}

