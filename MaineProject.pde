PImage maine;
boolean modeSwitch = false;
String[] lines;
String[] populations;

void setup() {
  size(648, 820);
  maine = loadImage("maine.png");
  boolean modeSwitch = false;
  processFiles();
}

void draw() {
  float tempDist = 9999.0;
  String temp3 = "";

  if (modeSwitch == false) {
    background(maine);
    smooth();
    textSize(25);
    fill(0);
    textAlign(LEFT);
    text("Population of Maine by County", 5, 30);
    fill(0, 0, 255);
    noStroke();
    for (int i = 0; i < populations.length; i++) {
      String [] temp = split(populations[i], ';');
      int x = Integer.parseInt(temp[0]);
      int y = Integer.parseInt(temp[1]);
      ellipse(x, y, 20, 20);

      if (dist(x, y, mouseX, mouseY) < 5) {
        if (dist(x, y, mouseX, mouseY) < tempDist) {
          temp3 = temp[2];
          tempDist = dist(x, y, mouseX, mouseY);
        }
      }
    }  
    if (tempDist < 9999.0) {
      fill(0);
      textSize(30);
      textAlign(CENTER);
      text(temp3, 375, 750);
    }
  } else if (modeSwitch == true) {
    background(maine);
    smooth();
    fill(0);
    textSize(25);
    textAlign(LEFT);
    text("Top 20 Town's Average Internet Speed (Download)", 5, 30);
    fill(255, 0, 0);
    noStroke();
    for (int j = 0; j < lines.length; j++) {
      String [] temp2 = split(lines[j], ',');
      int x2 = Integer.parseInt(temp2[0]);
      int y2 = Integer.parseInt(temp2[1]);
      ellipse(x2, y2, 15, 15);

      if (dist(x2, y2, mouseX, mouseY) < 5) {
        if (dist(x2, y2, mouseX, mouseY) < tempDist) {
          temp3 = temp2[2];
          tempDist = dist(x2, y2, mouseX, mouseY);
        }
      }
    }    

    if (tempDist < 9999.0) {
      fill(0);
      textSize(30);
      textAlign(CENTER);
      text(temp3, 375, 750);
    }
  }
}

void keyPressed() {
  if (key == 'q' || key == 'Q') {
    modeSwitch = false;
  } else if (key == 'w' || key == 'W') {
    modeSwitch = true;
  }
}

void processFiles() {
  lines = loadStrings("pixelLocations.txt");
  populations = loadStrings("PopulationCounties.txt");
}

