class Bishop extends Piece{
  int x;
  int y;
  boolean col;               //true == white  false == black
  Board b;
  PImage wBishop = loadImage("https://upload.wikimedia.org/wikipedia/commons/9/9b/Chess_blt60.png","png");
  PImage bBishop = loadImage("https://upload.wikimedia.org/wikipedia/commons/8/81/Chess_bdt60.png","png");
  
  public Bishop(int x,int y, boolean col,Board b){
    super(x,y,col,b);
    this.x = x;
    this.y = y;
    this.col = col;
    this.b = b;
  }
  
  boolean canMove(int x1,int y1){
    if(Math.abs(x1 - this.x) == Math.abs(y1 - this.y)){
      
      if(b.taken[x1][y1] == null || b.taken[x1][y1].col != this.col){
        
        int signX = (x1-this.x)/Math.abs(x1-this.x);
        int signY = (y1-this.y)/Math.abs(y1-this.y);
      
        for(int i = 1;i < Math.abs(x1 - this.x);i++){
          if(b.taken[this.x + signX*i][this.y + signY*i] != null){
            new UiBooster().showInfoDialog("you cant jump over a piece");
            return false;
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
      new UiBooster().showInfoDialog("invalid bishop move");
      return false;
    }
  }
  
  void makeMove (int x1,int y1){
    
    this.b.taken[x1][y1] = new Bishop(x1,y1,this.col,this.b);   
 
    this.b.taken[this.x][this.y] = null;

  }
  
  void draw(){
    if(this.col)
      image(wBishop,100 + this.x*100,100+(7-this.y)*100,100,100);
    else
      image(bBishop,100 + this.x*100,100+(7-this.y)*100,100,100);
  }
  
  String toString(){
    if(this.col)
      return "wBishop";
    return "bBishop";
  }
}
