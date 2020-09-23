import processing.serial.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Serial myPort;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  video.start();
  printArray(Serial.list());
  
  myPort = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  scale(2);
  opencv.loadImage(video);
  
  image(video, 0, 0);
  
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  
  if(faces.length == 0) {
    myPort.write('a');
  }
  
  else {
    myPort.write('b');
  }
  for(int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}
