

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;
import controlP5.*;
import processing.opengl.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
 

ControlP5 cp5;

Slider abc;
Circle circle;
Line line;
Line3d line3d; 

Minim minim;
AudioPlayer song;
AudioInput input;
FFT fft;
BeatDetect beat;
Spout spout;
UI ui;
Circle2 circle2;
Circle3 circle3;

float ring_difference = 100;
float angle_inner, radius_outer, angle_outer;
float radius_inner= 200;
int numPoints;
boolean linear = false, waveform = false, circlebo = true, complex_lines = false, variable_circle_size = false, line3dbo = false, beat_circle_size = false, background_flash = false, circle2bo = false, circle3bo = false, show_fps = false;
float dot_size;    
float lastx_linear = 0, lasty_linear = 0, lasti_linear = 0;
float lastx_circle = 0, lasty_circle = 0, lasti_circle = 0;
float master = 0;
float gain = 100;
float variable_radius_inner, init_size;
float rotate, rotatespeed = 0, alpha = 25;
float nucleus_alpha = 0, nucleus_color = 0, beat_circle_size_float;
float kickSize, snareSize, hatSize;
float stroke_weight = 1;
float circle_size_decay, pulse_size;
float multiplierx, multipliery;
int coloroffset;


void setup()
{
  smooth();
  noStroke();
 // frameRate(40);


  //layout stuff 
  size(displayWidth, displayHeight, OPENGL);

  oscP5 = new OscP5(this, 5001);

  colorMode(HSB);
  background(150, 80, 80);
  //
  //loading... stuff
  textAlign(CENTER);
  text("LOADING...", width/2, height/2);
  textAlign(LEFT);
  textureMode(NORMAL);

  //
  cp5 = new ControlP5(this);
  // always start Minim first!
  minim = new Minim(this);

  ui = new UI();
  //ui.init();
  input = minim.getLineIn(Minim.STEREO, 1024); 

  circle2 = new Circle2();
  circle3 = new Circle3();

  beat = new BeatDetect(input.bufferSize(), input.sampleRate());
  beat.setSensitivity(300);
  kickSize = snareSize = hatSize = 16;

  circle = new Circle();
  line = new Line();
  line3d = new Line3d();
  spout = new Spout();
  spout.initSender("Spout Processing", width, height);

  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024

  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(input.bufferSize(), input.sampleRate());
  println(fft.specSize());
  numPoints = fft.specSize();


  angle_inner=TWO_PI/(float)numPoints;

  radius_outer= radius_inner + ring_difference;
  angle_outer=TWO_PI/(float)numPoints;
}

void draw() {



  if (frameCount % 40 == 0) {
    print("fps: ");
    println(frameRate);
  }

  beat.detect(input.mix);
  noStroke();

  if (beat.isSnare() && background_flash) {
    background(random(255), random(255), 60); //creating a flashing backgruond on each detected snare hit
  }


  if (show_fps) {
    colorMode(RGB, 60);
    fill(0);
    fill((frameRate - 60), frameRate, 40);
    text(int(frameRate) + " fps", 0, 10);
  }
  /*textSize(50);
   textMode(CENTER);
   text("DEMO MODE", 150, 150);
   text("DEMO MODE", 250, 350);
   text("DEMO MODE", 550, 150);
   text("NOT FOR COMMERCIAL USE", 0/2, height/2);
   */

  fft.forward(input.mix); 
  numPoints = fft.specSize();
  colorMode(RGB, 255);


  //println(rotate);
  if (rotate < 1000) {
    rotate = rotate + rotatespeed;
  } else {
    rotate = 0;
  }
  if (line3dbo == false) {
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  }
  fill(0, 0, 0, alpha);
  rect(- width * 2, -height * 2, width * 10, height * 10);// THIS IS THE BACKGROUND
  fill(255);

  master = input.mix.level();
  //println("master : " , master);


  strokeWeight(stroke_weight);
  if (stroke_weight == 0 ) {
    noStroke();
  }


  if (circlebo == true) {
    circle.update(rotate);
  } 

  if (line3dbo) {
    line3d.update();
  } else {
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  }
  //rect(width/2, height/2, 100, 100);
  if (linear) {
    line.update();
  }

  if (circle2bo) {
    circle2.update(gain);
  }    

  if (circle3bo) {
    circle3.update();
  }
  //Beat detector shizzle:
  kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);

  if (beat.isKick()) {
    strokeWeight(stroke_weight + 100);
  }
  // </beat_detector_shizzle>

  //sending image to external application
  spout.sendTexture();
}





void exit() {
  // CLOSE THE SPOUT SENDER HERE
  spout.closeSender();
  input.close();                              //Always close Minim audio classes when you are finished with them
  minim.stop();                            //Always stop Minim before exiting
  super.stop();                            //This closes the sketch
  super.exit();
} 

