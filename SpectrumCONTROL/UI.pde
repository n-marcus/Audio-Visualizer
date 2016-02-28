class UI {

  void UI() {
  }

  void init() {


    cp5.addToggle("linear")
      .setPosition(40, 100)
        .setSize(50, 20)
          .setValue(false)
            .setMode(ControlP5.SWITCH)
              ;

    cp5.addToggle("circlebo")
      .setPosition(95, 100)
        .setSize(50, 20)
          .setValue(false)
            .setMode(ControlP5.SWITCH)
              ;

    cp5.addToggle("line3dbo")
      .setPosition(150, 100)
        .setSize(50, 20)
          .setValue(false)
            .setMode(ControlP5.SWITCH)
              ;

    cp5.addToggle("circle2bo")
      .setPosition(205, 100)
        .setSize(50, 20)
          .setValue(true)
            .setMode(ControlP5.SWITCH)
              ;

    cp5.addToggle("circle3bo")
      .setPosition(260, 100)
        .setSize(50, 20)
          .setValue(true)
            .setMode(ControlP5.SWITCH)
              ;

    cp5.addToggle("complex_lines")
      .setPosition(40, 150)
        .setSize(50, 20)
          .setValue(true)
            .setMode(ControlP5.SWITCH)
              ;

    cp5.addToggle("variable_circle_size")
      .setPosition(110, 150 )
        .setSize(50, 20)
          .setValue(false  )
            .setMode(ControlP5.SWITCH)
              ;
    cp5.addToggle("beat_circle_size")
      .setPosition(180, 150 )
        .setSize(50, 20)
          .setValue(false  )
            .setMode(ControlP5.SWITCH)
              ;
    cp5.addToggle("background_flash")
      .setPosition(250, 150 )
        .setSize(50, 20)
          .setValue(false  )
            .setMode(ControlP5.SWITCH)
              ;


    //END OF TOGGLES


    cp5.addSlider("dot_size")
      .setPosition(50, 200)
        .setRange(0, 200)
          .setValue(5)
            ;
    cp5.addSlider("gain")
      .setPosition(50, 220)
        .setRange(0, 400)
          .setValue(100);

    cp5.addSlider("init_size")
      .setPosition(50, 240)
        .setRange(0, 200)
          .setValue(100);  

    cp5.addSlider("rotatespeed")
      .setPosition(50, 260)
        .setRange(0, 200)
          .setValue(0);

    cp5.addSlider("alpha")
      .setPosition(50, 280)
        .setRange(0, 200)
          .setValue(25);

    cp5.addSlider("radius_inner")
      .setPosition(50, 300)
        .setRange(0, 600)
          .setValue(height / 4);

    cp5.addSlider("stroke_weight")
      .setPosition(50, 320)
        .setRange(0, 1000)
          .setValue(1);

    cp5.addSlider("circle_size_decay")
      .setPosition(50, 340)
        .setRange(0, 200)
          .setValue(20);

    cp5.addSlider("pulse_size")
      .setPosition(50, 360)
        .setRange(0, 200)
          .setValue(100);


    cp5.addSlider("coloroffset")
      .setPosition(50, 380)
        .setRange(100, 5000)
          .setValue(100);
  }
}

