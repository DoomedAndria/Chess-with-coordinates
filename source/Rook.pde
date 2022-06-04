class Rook extends Piece{
  int x;
  int y;
  boolean col;               //true == white  false == black
  Board b;
  PImage wRook = loadImage("https://upload.wikimedia.org/wikipedia/commons/5/5c/Chess_rlt60.png","png");
  PImage bRook = loadImage("https://upload.wikimedia.org/wikipedia/commons/a/a0/Chess_rdt60.png","png");
  
  public Rook(int x,int y, boolean col,Board b){
    super(x,y,col,b);
    this.x = x;
    this.y = y;
    this.col = col;
    this.b = b;
  }
  
  boolean canMove(int x1,int y1){
    if(x1 == this.x || y1 == this.y){
      
      if(b.taken[x1][y1] == null || b.taken[x1][y1].col != this.col){
        
        for(int i = 1;i < Math.abs(x1-this.x) + Math.abs(y1-this.y);i++){
          
          if(y1 == this.y){
            int signX = (x1 - this.x)/Math.abs(x1-this.x);
            if(b.taken[this.x + signX*i][this.y ] != null){
              new UiBooster().showInfoDialog("you cant jump over a piece");
              return false;
            }
          }
          else{
            int signY = (y1 - this.y)/Math.abs(y1-this.y);
            if(b.taken[this.x][this.y + signY*i] != null){
              new UiBooster().showInfoDialog("you cant jump over a piece");
              return false;
            }
          }
        }
        return true;
      }
      else{
        new UiBooster().showInfoDialog("the square you are trying to move on is occupied");
        return false;
      }
    }
    else{
      new UiBooster().showInfoDialog("invalid Rook move");
      return false;
    }
  }
  
  void makeMove (int x1,int y1){
    
    this.b.taken[x1][y1] = new Rook(x1,y1,this.col,this.b);   
 
    this.b.taken[this.x][this.y] = null;

  }
  
  void draw(){
    if(this.col)
      image(wRook,100 + this.x*100,100+(7-this.y)*100,100,100);
    else
      image(bRook,100 + this.x*100,100+(7-this.y)*100,100,100);
  }
  
  String toString(){
    if(this.col)
      return "wRook";
    return "bRook";
  }
}
