// Static textures
private PImage UarrowImg;
private PImage DarrowImg;
private PImage tableImg;

// Scale for resizing window
double curScale = 1.0;
int trans_x = 0;

// For drawing orbits and what not
Atom atom;
BohrModel bohrModel;
OrbitalDiagram orbitalDiagram;
Answers answers;

// Buttons
Button backBtn;
Button checkBtn;
Button viewBtn;
String checkStatus = "Unchecked";

// In menu
boolean inMenu = true;


// Setup
void setup() {
  
  // Load assets
  UarrowImg = loadImage("assets/arrowU.png");
  DarrowImg = loadImage("assets/arrowD.png");
  tableImg  = loadImage("assets/table.png" );
  
  
  //frame.setVisible(true);  
  
  size(1100, 820);
  
  
  surface.setResizable(true);

  // For drawing shells + electrons
  bohrModel = new BohrModel(270, height/2+50);
  
  // Mock atom for testing
  atom = new Atom(1);
  
  // To allow user to add electrons
  orbitalDiagram = new OrbitalDiagram(atom);
  
  // To verify the response
  answers = new Answers();
  
  // Create UI Buttons
  backBtn = new Button("BACK", 20, 20, 100, 50, color(200, 80, 80), color(200, 30, 30));
  checkBtn = new Button("CHECK", 150, 20, 100, 50, color(80, 200, 80), color(30, 200, 30));
  viewBtn = new Button("VIEW", 20, 80, 230, 50, color(10, 148, 255), color(0, 142, 244));
}

// Program Loop
void draw() {
  
  // Reset scale
  curScale = Math.min(width/1100.0, height/820.0);
  scale((float)curScale);
  if (curScale == height/820.0) {
    trans_x = (int) (width/2 - (curScale*1100.0)/2.0);
    //trans_x = 100;
    translate(trans_x, 0);
  } else {
    trans_x = 0;
  }
  
  // Reset screen
  background(200);
  
  // Draw menu if in menu
  if (inMenu) { mainMenuDraw(); return; }
  
  // Draw shells + electrons
  bohrModel.display(atom);
  
  // For user input
  orbitalDiagram.display(atom);
  
  // Buttons
  backBtn.display();
  if (backBtn.clicked()) {
    inMenu = true;
  }
  
  checkBtn.display();
  if (checkBtn.clicked()) {
    boolean good = answers.checkAnswer(atom);
    if (good) {
      checkStatus = "CORRECT!      :)";
    } else {
      checkStatus = "WRONG      >:|";
    }
  }
  
  viewBtn.display();
  if (viewBtn.clicked()) {
    atom.shell.setArray(
      answers.getAnswerFor(atom.atomicNumber)
    );
  }
  
  textAlign(LEFT, TOP);
  textSize(40);
  fill(0);
  text(checkStatus, 280, 20);
  
}

// Debug
public void keyPressed() {
  println(Arrays.deepToString(atom.shell.shells)); 
}

// Main menu screen
public void mainMenuDraw() {
  
  // Draw the pTable
  int th = 200;
  image(tableImg, 50, th);
  
  // Store atomic number
  int aN = -1;
  
  // Grid
  int sx = 50+51; int sy = th+54;
  for (int j = 0; j < 7; j++) {
    for (int i = 0; i < 18; i++) {
      
      if (mousePressed && mouseInRect(sx+i*(44+8), sy+j*(44+7), 44, 44)) {
        
        if (j == 0) {
          if (i==0)  {aN = 1;}
          if (i==17) {aN = 2;}
        }
        
        if (j == 1 || j == 2) {
          if (i <= 1) {aN = 3+(8*(j-1))+i;}
          else if (i >= 12) { aN = (8*(j-1))+i-7;}
        }
        
        if (j == 3 || j == 4) {
          aN = 19 + 18*(j-3) + i;
        }
        
        if (j == 5) {
          if (i <= 2) { aN = 55+i; }
          else { aN = 69+i; }
        }
        
        if (j == 6) {
          if (i >= 2 && i <= 15) { aN = 55+i; }
        }
        
        if (aN == -1) {
          return;
        }
        
        println(aN);
        atom = new Atom(aN);
        inMenu=false;
        
        checkStatus = "Unchecked";
        orbitalDiagram = new OrbitalDiagram(atom);
      
      }
      
    }
    
  
  }

}

public boolean mouseInRect(int x, int y, int w, int h) {
  
  return mouseX-trans_x*curScale > x*curScale && mouseX-trans_x*curScale < (x+w)*curScale && mouseY > y*curScale && mouseY < (y+h)*curScale;
  
}
