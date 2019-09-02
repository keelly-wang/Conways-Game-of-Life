int size = 400;
boolean[][] cellsNow = new boolean[size][size];
boolean[] tf = {true, false};
int alive;


void setup() {
  size(800, 800);
  for (int i = 1; i < size; i = i + 1) {
    line(i*width/size, 0, i*width/size, height);
    line(0, i*height/size, width, i*height/size);
  }
  for (int i = 0; i < cellsNow.length; i++) {
    for (int j = 0; j < cellsNow[0].length; j++) {
      cellsNow[i][j] = tf[int(random(2))];
    }
  }
  noStroke();
}

void draw() {
  background(0);
  println(alive);
  for (int i = 0; i < cellsNow.length; i++) {
    for (int j = 0; j < cellsNow[0].length; j++) {
      if (cellsNow[i][j]) {
        fill(255);
        rect(i*(width/size), j*(width/size), (width/size), (width/size));
      }
    }
  }
  cellsNow = generate(cellsNow);
}

boolean[][] generate(boolean[][] oldGen) {
  alive = 0;
  boolean[][] newGen = new boolean[size][size];
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      int count = 0;
      for (int a = -1; a < 2; a++) {
        for (int b = -1; b < 2; b++) {
          try {
            if (oldGen[i + a][j + b] && (b !=0 || a !=0)) {
              count++;
            }
          }
          catch( Exception e) {
          }
        }
      }
      if (count == 3) {
        newGen[i][j] = true;
        alive++;
      } else if (count == 2 && oldGen[i][j]) {
        newGen[i][j] = true;
        alive++;
      } else newGen[i][j] = false;
    }
  }
  return newGen;
}
