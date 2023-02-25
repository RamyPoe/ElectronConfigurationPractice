public class Atom {

  // Holds the electrons
  public Shell shell;
  
  // Atom fields
  public int atomicNumber;
  private int[] neutrons = new int[]{0, 2, 4, 5, 6, 6, 7, 8, 10, 10, 12, 12, 14, 14, 16, 16, 18, 22, 20, 20, 24, 22, 28, 28, 30, 30, 32, 31, 35, 30, 39, 41, 42, 45, 45, 48, 48, 50, 50, 51, 52, 54, 55, 57, 58, 60, 61, 64, 66, 69, 71, 76, 74, 77, 78, 81, 82, 82, 82, 84, 84, 88, 89, 93, 94, 97, 98, 99, 100, 103, 104, 106, 108, 110, 111, 114, 115, 117, 118, 121, 123, 125, 126, 125, 125, 136};
  
  // Constructor
  public Atom(int atomNumber) {
    
    // Save field
    this.atomicNumber = atomNumber;
    
    // Create shell to hold electrons
    shell = new Shell();
    
  }
  
  
  
}
