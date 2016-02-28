import oscP5.*;
import netP5.*;
import controlP5.*;
import themidibus.*;


OscP5 oscP5;
NetAddress myRemoteLocation;
ControlP5 cp5;
UI ui;
MidiBus myBus;

boolean linear = false, waveform = false, circlebo = false, complex_lines, variable_circle_size, line3dbo, beat_circle_size, background_flash, circle2bo, circle3bo;

void setup() {
  size(400, 500);
  background(0);

  oscP5 = new OscP5(this, 5000);
  // set the remote location to be the localhost on port 5001
  myRemoteLocation = new NetAddress("127.0.0.1", 5001);

  cp5 = new ControlP5(this);
  ui = new UI();
  ui.init();
  cp5.printControllerMap();

  MidiBus.list(); 
  myBus = new MidiBus(this, 1, "LPD8");
}


void draw() {
  background(0);
  text("THIS CONTROLS THE MAIN SKETCH", 40, 50);
}

void controlEvent(ControlEvent theEvent) {
  println("SENDING "+ theEvent.getController().getName() + " value = " + theEvent.getController().getValue());
  String slash = "/" + theEvent.getController().getName();
  OscMessage myMessage = new OscMessage(slash);
  myMessage.add(theEvent.getController().getValue());

  //TO THE STARS, AND BEYOND!!!

  oscP5.send(myMessage, myRemoteLocation);
}

