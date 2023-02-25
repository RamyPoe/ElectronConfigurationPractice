public class Button {
  
  // Position
  private int x, y, w, h;
  private String text;
  
  // Click check
  private boolean mouseDown = false;
  
  // Drawing
  color c1, c2;
  
  // Constructor
  public Button(String text, int x, int y, int w, int h, color c1, color c2) {
    
    // Save fields
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    
    this.c1 = c1;
    this.c2 = c2;
  
  }
  
  // For drawing
  public void display() {
    
    // Upper-left
    rectMode(CORNER);
    stroke(0);
    strokeWeight(2);
    
    if (hover()) {
      fill(c1);
    } else {
      fill(c2);
    }
    
    rect(x, y, w, h);
    textAlign(CENTER, CENTER);
    
    fill(255);
    textSize(20);
    text(text, x+w/2, (y+h/2)*0.99);
    
  }
  
  public boolean clicked() {
    boolean ans = hover() && !mouseDown && mousePressed;
    mouseDown = mousePressed; 
    return ans;
  }
  
  private boolean hover() {
    
    return mouseInRect(x, y, w, h);
  
  }

}
