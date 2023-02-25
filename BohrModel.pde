import java.util.*;

public class BohrModel {

  // Drawing
  private static final int r = 34;
  private final color nc = color(200, 30, 30);
  private float x, y;

  // Electron
  color ec = color(255, 205, 1);

  // Constructor
  public BohrModel(float x, float y) {

    this.x = x;
    this.y = y;
  }

  // Draw
  public void display(Atom atom) {

    // Label protons and neutrons
    textSize(30);
    fill(0);
    textAlign(LEFT, BOTTOM);
    text("p = " + atom.atomicNumber, 30, 820-50);
    text("n = " + atom.neutrons[atom.atomicNumber-1], 125, 820-50);
    
    // Nucleus
    ellipseMode(CENTER);
    fill(nc);
    noStroke();
    ellipse(x, y, r, r);

    // Rings
    stroke(0);
    strokeWeight(2);
    fill(255, 0);

    ellipse(x, y, r*3, r*3);
    ellipse(x, y, r*5, r*5);
    ellipse(x, y, r*7, r*7);
    ellipse(x, y, r*9, r*9);
    ellipse(x, y, r*11, r*11);
    ellipse(x, y, r*13, r*13);

    // Electrons
    fill(ec);
    noStroke();

    boolean[][] shells = atom.shell.shells;
    for (int i = 0; i < shells.length; i++) {
      
      int count = 0;
      for (int j = 0; j < shells[i].length; j++) {
        if (shells[i][j]) {
          count++;
        }
      }
      
      for (int j = 0; j < count; j++) {

        // Calculate positions including spinning
        int re = (i*2+3) * r;
        re/=2;
        double offset = 2 * Math.PI * j / count;
        int x = (int) (re * Math.cos(frameCount*0.015*Math.log(i+2.5) + offset));
        int y = (int) (re * Math.sin(frameCount*0.015*Math.log(i+2.5) + offset));

        //println(Arrays.toString(shells[2]));
        if (i%2 == 0) {
          ellipse(this.x + x, this.y + y, 15, 15);
        } else {
          ellipse(this.x + y, this.y + x, 15, 15);
        }
        
      }
    }
  }
}

class Electron {

  // Position
  int cx, cy, cr;

  // Drawing

  final int r = 5;
}
