public class OrbitalDiagram {
  
  // Each block controls two electrons
  public ElectronBlockButton[] electronBlocks;
  
  // The current atom
  Atom atom;
  
  // Previous click state
  private boolean mouseDown;
  
  // Draw constants
  int sw = 650; int sh = 45; int gapX = ElectronBlockButton.w + 15; int gapY = 35 + 15;
  
  // Constructor
  public OrbitalDiagram(Atom atom) {
  
    // Save fields
    this.atom = atom;
    
    // Create array
    electronBlocks = new ElectronBlockButton[43];
    
    
    // Load array with buttons
    
    /* 1s */
    electronBlocks[0] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*0, "1s", 1);
    
    /* 2s */
    electronBlocks[1] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*1, "2s", 1);

    /* 2p */
    electronBlocks[2] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*2, "2p", 1);
    electronBlocks[3] = new ElectronBlockButton(sw + gapX*1, 820-sh - gapY*2, "2p", 3);
    electronBlocks[4] = new ElectronBlockButton(sw + gapX*2, 820-sh - gapY*2, "2p", 5);

    /* 3s */
    electronBlocks[5] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*3, "3s", 1);

    /* 3p */
    electronBlocks[6] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*4, "3p", 1);
    electronBlocks[7] = new ElectronBlockButton(sw + gapX*1, 820-sh - gapY*4, "3p", 3);
    electronBlocks[8] = new ElectronBlockButton(sw + gapX*2, 820-sh - gapY*4, "3p", 5);

    /* 4s */
    electronBlocks[9] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*5, "4s", 1);

    /* 3d */
    electronBlocks[10] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*6, "3d", 1);
    electronBlocks[11] = new ElectronBlockButton(sw + gapX*1, 820-sh - gapY*6, "3d", 3);
    electronBlocks[12] = new ElectronBlockButton(sw + gapX*2, 820-sh - gapY*6, "3d", 5);
    electronBlocks[13] = new ElectronBlockButton(sw + gapX*3, 820-sh - gapY*6, "3d", 7);
    electronBlocks[14] = new ElectronBlockButton(sw + gapX*4, 820-sh - gapY*6, "3d", 9);

    /* 4p */
    electronBlocks[15] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*7, "4p", 1);
    electronBlocks[16] = new ElectronBlockButton(sw + gapX*1, 820-sh - gapY*7, "4p", 3);
    electronBlocks[17] = new ElectronBlockButton(sw + gapX*2, 820-sh - gapY*7, "4p", 5);

    /* 5s */
    electronBlocks[18] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*8, "5s", 1);

    /* 4d */
    electronBlocks[19] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*9, "4d", 1);
    electronBlocks[20] = new ElectronBlockButton(sw + gapX*1, 820-sh - gapY*9, "4d", 3);
    electronBlocks[21] = new ElectronBlockButton(sw + gapX*2, 820-sh - gapY*9, "4d", 5);
    electronBlocks[22] = new ElectronBlockButton(sw + gapX*3, 820-sh - gapY*9, "4d", 7);
    electronBlocks[23] = new ElectronBlockButton(sw + gapX*4, 820-sh - gapY*9, "4d", 9);

    /* 5p */
    electronBlocks[24] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*10, "5p", 1);
    electronBlocks[25] = new ElectronBlockButton(sw + gapX*1, 820-sh - gapY*10, "5p", 3);
    electronBlocks[26] = new ElectronBlockButton(sw + gapX*2, 820-sh - gapY*10, "5p", 5);

    /* 6s */
    electronBlocks[27] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*11, "6s", 1);
    
    /* 4f */
    electronBlocks[28] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*12, "4f", 1);
    electronBlocks[29] = new ElectronBlockButton(sw + gapX*1, 820-sh - gapY*12, "4f", 3);
    electronBlocks[30] = new ElectronBlockButton(sw + gapX*2, 820-sh - gapY*12, "4f", 5);
    electronBlocks[31] = new ElectronBlockButton(sw + gapX*3, 820-sh - gapY*12, "4f", 7);
    electronBlocks[32] = new ElectronBlockButton(sw + gapX*4, 820-sh - gapY*12, "4f", 9);
    electronBlocks[33] = new ElectronBlockButton(sw + gapX*5, 820-sh - gapY*12, "4f", 11);
    electronBlocks[34] = new ElectronBlockButton(sw + gapX*6, 820-sh - gapY*12, "4f", 13);
    
    /* 5d */
    electronBlocks[35] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*13, "5d", 1);
    electronBlocks[36] = new ElectronBlockButton(sw + gapX*1, 820-sh - gapY*13, "5d", 3);
    electronBlocks[37] = new ElectronBlockButton(sw + gapX*2, 820-sh - gapY*13, "5d", 5);
    electronBlocks[38] = new ElectronBlockButton(sw + gapX*3, 820-sh - gapY*13, "5d", 7);
    electronBlocks[39] = new ElectronBlockButton(sw + gapX*4, 820-sh - gapY*13, "5d", 9);

    /* 6p */
    electronBlocks[40] = new ElectronBlockButton(sw + gapX*0, 820-sh - gapY*14, "6p", 1);
    electronBlocks[41] = new ElectronBlockButton(sw + gapX*1, 820-sh - gapY*14, "6p", 3);
    electronBlocks[42] = new ElectronBlockButton(sw + gapX*2, 820-sh - gapY*14, "6p", 5);
    


  }
  
  // Check for clicks and draw button
  public void display(Atom atom) {
    
    // For writing labels
    textAlign(RIGHT, BOTTOM);
    strokeWeight(3);
    fill(0);
    textSize(30);
    
    // Adjust for scale
    //int n_gapY = (int) (gapY*curScale);
    int n_gapY = gapY;

    text("1s", (sw - 20), 820-sh - n_gapY*0);
    text("2s", (sw - 20), 820-sh - n_gapY*1);
    text("2p", (sw - 20), 820-sh - n_gapY*2);
    text("3s", (sw - 20), 820-sh - n_gapY*3);
    text("3p", (sw - 20), 820-sh - n_gapY*4);
    text("4s", (sw - 20), 820-sh - n_gapY*5);
    text("3d", (sw - 20), 820-sh - n_gapY*6);
    text("4p", (sw - 20), 820-sh - n_gapY*7);
    text("5s", (sw - 20), 820-sh - n_gapY*8);
    text("4d", (sw - 20), 820-sh - n_gapY*9);
    text("5p", (sw - 20), 820-sh - n_gapY*10);
    text("6s", (sw - 20), 820-sh - n_gapY*11);
    text("4f", (sw - 20), 820-sh - n_gapY*12);
    text("5d", (sw - 20), 820-sh - n_gapY*13);
    text("6p", (sw - 20), 820-sh - n_gapY*14);
    
    

    
    // For each button
    for (int i = 0; i < electronBlocks.length; i++) {
      if (electronBlocks[i] == null) { continue; }
      
      // Draw
      electronBlocks[i].display(atom);
      
      // Check for click
      if (!mouseDown && mousePressed && mouseInRect(electronBlocks[i].x, electronBlocks[i].y-40, ElectronBlockButton.w, 40)) {
        
        electronBlocks[i].clickCycle(atom);
        
      
      }
    
    }
    
    mouseDown = mousePressed;
  
  }

}

class ElectronBlockButton {
  
  // Constants
  public static final int w = 45;  
  
  // Position
  public int x, y;
  
  // The electrons its responsible for
  int i;
  String configPrefix;
  int state = 0;
  
  // Constructor
  public ElectronBlockButton(int x, int y, String configPrefix, int i) {
    
    this.x = x;
    this.y = y;
    this.configPrefix = configPrefix;
    this.i = i;
  
  }
  
  // Draw to screen
  public void display(Atom a) {
  
    // Get state from the electrons
    if (a.shell.isElectron(configPrefix + i)) {
      if (a.shell.isElectron(configPrefix + (i+1))) {
        state = 2;
      } else {
        state = 1;
      }
    } else {
      state = 0;
    }
    
    // Draw horizontal underline
    strokeWeight(3);
    stroke(0);
    line(x, y, x+w, y);
    
    // Depending on how many electrons
    imageMode(CORNERS);
    if (state >= 1) {
      image(UarrowImg, x+5, y-5, x+20, y-35);
    }
    if (state == 2) {
      image(DarrowImg, x+25, y-5, x+40, y-35);
    }
    
  }
  
  // It has been clicked, cycle
  public void clickCycle(Atom atom) {
  
    if (state == 0) {
      state++;
      atom.shell.setElectron(configPrefix + i, true);
    } else if (state == 1) {
      state++;
      atom.shell.setElectron(configPrefix + (i+1), true);
    } else if (state == 2) {
      state = 0;
      atom.shell.setElectron(configPrefix + i, false);
      atom.shell.setElectron(configPrefix + (i+1), false);
    }
  
  }
  

}
