abstract class Piece {
  int x;
  int y;
  boolean col;
  Board b;
  
  public Piece(int x,int y, boolean col,Board b){
    this.x = x;
    this.y = y;
    this.col = col;
    this.b = b;
    this.b.taken[this.x][this.y] = this;
    
  }
 
  abstract boolean canMove(int x1,int y1);
  
  abstract void makeMove (int x1,int y1);
   
  abstract void draw();

  abstract String toString();
  
}
