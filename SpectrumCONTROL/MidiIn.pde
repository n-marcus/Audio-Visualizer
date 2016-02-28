

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  println(cp5.controller("circlebo").getValue());

  if (number == 1 && channel == 1) {
    cp5.getController("linear").setValue(value);
    //print("linear = " + linear);
  }
  if (number == 2 && channel == 1) {
    cp5.getController("circlebo").setValue(value);
  }
  if (number == 3 && channel == 1) {
    cp5.getController("line3dbo").setValue(value);
  }
  if (number == 4 && channel == 1) {
    cp5.getController("circle2bo").setValue(value);
  }

  if (number == 5 && channel == 1) {
    cp5.getController("circle3bo").setValue(value);
  }

  if (number == 6 && channel == 1) {
    cp5.getController("background_flash").setValue(value);
  }

  if (number == 8 && channel == 1) {
    cp5.getController("beat_circle_size").setValue(value);
  }

  if (number == 9 && channel == 1) {
    cp5.getController("variable_circle_size").setValue(value);
  }

  //mapping the dials...
  if (number == 10) {
    cp5.getController("gain").setValue(map(value, 0, 127, 0, 400));
  }

  if (number == 11) {
    cp5.getController("alpha").setValue(map(value, 0, 127, 0, 200));
  }

  if (number == 12) {
    cp5.getController("stroke_weight").setValue(pow(value, 1.5) * 1);
  }


  if (number == 13) {
    cp5.getController("init_size").setValue(map(value, 0, 127, 0, 200));
  }


  if (number == 14) {
    cp5.getController("pulse_size").setValue(map(value, 0, 127, 0, 200));
  }

  if (number == 15) {
    cp5.getController("circle_size_decay").setValue(map(value, 0, 127, 200, 0));
  }

  if (number == 16) {
    cp5.getController("dot_size").setValue(map(value, 0, 127, 0, 200));
  }

  if (number == 17) {
    cp5.getController("rotatespeed").setValue(map(value, 0, 127, 0, 200));
    cp5.getController("coloroffset").setValue(map(value, 0, 127, 100, 1300));
  }
}

