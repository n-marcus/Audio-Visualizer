void oscEvent(OscMessage theOscMessage) 
{  
  // get the first value as an integer
  float value = theOscMessage.get(0).floatValue();
  String name = theOscMessage.addrPattern();


  //ALL THE INCOMING INTEGERS AND FLOATS:::

  if (name.equals("/dot_size")) {
    println("setting dot_size from " + name + " to: " + value);
    dot_size = value;
  }else

  if (name.equals("/gain")) {
    println("setting gain from " + name + " to: " + value);
    gain = value;
  }else

  if (name.equals("/init_size")) {
    println("setting init_size from " + name + " to: " + value);
    init_size = value;
  }else

  if (name.equals("/rotatespeed")) {
    println("setting rotate_speed from " + name + " to: " + value);
    rotatespeed = value;
  }else

  if (name.equals("/alpha")) {
    println("setting alpha from " + name + " to: " + value);
    alpha = value;
  }else

  if (name.equals("/radius_inner")) {
    println("setting radius_inner from " + name + " to: " + value);
    radius_inner = value;
  }else

  if (name.equals("/stroke_weight")) {
    println("setting stroke_weight from " + name + " to: " + value);
    stroke_weight = value;
  }else

  if (name.equals("/circle_size_decay")) {
    println("setting circle_size_decay from " + name + " to: " + value);
    circle_size_decay = value;
  }else

  if (name.equals("/pulse_size")) {
    println("setting pulse_size from " + name + " to: " + value);
    pulse_size = value;
  }else

  if (name.equals("/coloroffset")) {
    println("setting coloroffset from " + name + " to: " + value);
    coloroffset = int(value);
  }else

  // ALL INCOMING BOOLEANS
  if (name.equals("/linear")) {
    println("setting linear from " + name + " to: " + value);
    if (value == 1) {
      linear = true;
    } else {
      linear = false;
    }
  }else

  if (name.equals("/circlebo")) {
    println("setting circlebo from " + name + " to: " + value);
    if (value == 1) {
      circlebo = true;
    } else {
      circlebo = false;
    }
  }else

  if (name.equals("/line3dbo")) {
    println("setting line3dbo from " + name + " to: " + value);
    if (value == 1) {
      line3dbo = true;
    } else {
      line3dbo = false;
    }
  }else

  if (name.equals("/circle2bo")) {
    println("setting circle2bo from " + name + " to: " + value);
    if (value == 1) {
      circle2bo = true;
    } else {
      circle2bo = false;
    }
  }else

  if (name.equals("/circle3bo")) {
    println("setting circle3bo from " + name + " to: " + value);
    if (value == 1) {
      circle3bo = true;
    } else {
      circle3bo = false;
    }
  }else

  if (name.equals("/background_flash")) {
    println("setting circle3bo from " + name + " to: " + value);
    if (value == 1) {
      background_flash = true;
    } else {
      background_flash = false;
    }
  }else

  if (name.equals("/beat_circle_size")) {
    println("setting circle3bo from " + name + " to: " + value);
    if (value == 1) {
      beat_circle_size = true;
    } else {
      beat_circle_size = false;
    }
  }else

  if (name.equals("/variable_circle_size")) {
    println("setting circle3bo from " + name + " to: " + value);
    if (value == 1) {
      variable_circle_size = true;
    } else {
      variable_circle_size = false;
    }
  }




}

