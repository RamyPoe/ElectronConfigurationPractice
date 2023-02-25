public class Shell {
  
  // Electron data structure
  public boolean[][] shells;
  
  // Constructor
  public Shell() {
    
    // 6 shells
    shells = new boolean[6][];
    
    // 2n^2
    for (int i = 0; i < 6; i++) {
      shells[i] = new boolean[ 2 * (i+1) * (i+1) ];
    }
    
  }

  // When revealing answer
  public void setArray(boolean[][] electrons) {
    
    // Clone the array
    boolean[][] newArr = new boolean[electrons.length][];
    for (int i = 0; i < electrons.length; i++) {
      newArr[i] = new boolean[electrons[i].length];
      for (int j = 0; j < electrons[i].length; j++) {
        newArr[i][j] = electrons[i][j];
      }
    }
    
    // Set cloned array
    this.shells = newArr;
  }

  // Changing electron state
  public void setElectron(String place, boolean set) {
    
    // Get the index from string
    int[] coord = parseElectronIndex(place);
    
    // Set the index
    shells[coord[0]][coord[1]] = set;
    
  }
  
  // Reading the existence of the electron
  public boolean isElectron(String place) {
    
    // Get the index from string
    int[] coord = parseElectronIndex(place);
    
    // Return
    return shells[coord[0]][coord[1]];
  
  }
  
  // Parse config to index
  private int[] parseElectronIndex(String place) {
    
    // Get Quantum numbers
    int qn = Character.getNumericValue(place.charAt(0));
    int ql;
    switch (place.charAt(1)) {
      case 's': ql = 0; break;
      case 'p': ql = 1; break;
      case 'd': ql = 2; break;
      case 'f': ql = 3; break;
      default: ql = 0;
    }
    int qm = Integer.parseInt(place.substring(2,place.length()));
    
    // Turn into index
    int i = 2 * ql * ql + qm - 1;
    
    // Return coordinate
    return new int[]{qn-1, i};
  }

}
