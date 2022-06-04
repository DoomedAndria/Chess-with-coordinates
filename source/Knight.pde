class Knight extends Piece{
  int x;
  int y;
  boolean col;               //true == white  false == black
  Board b;
  PImage wKnight = loadImage("https://upload.wikimedia.org/wikipedia/commons/2/28/Chess_nlt60.png","png");
  PImage bKnight = loadImage("https://upload.wikimedia.org/wikipedia/commons/f/f1/Chess_ndt60.png","png");
  
  public Knight(int x,int y, boolean col,Board b){
    super(x,y,col,b);
    this.x = x;
    this.y = y;
    this.col = col;
    this.b = b;
  }
  
  boolean canMove(int x1,int y1){
    if((x1-this.x == 1 || x1-this.x == -1) && (y1 - this.y == 2 || y1 - this.y == -2) ||
    (x1-this.x == 2 || x1-this.x == -2) && (y1 - this.y == 1 || y1 - this.y == -1)){
      if(b.taken[x1][y1] == null || b.taken[x1][y1].col != this.col)
        return true;
      else{
        new UiBooster().showInfoDialog("the square you are trying to move on is occupied");
        return false;
      }
      
    }
    else{
      new UiBooster().showInfoDialog("invalid knight move");
      return false;
    }
  }
  
  void makeMove (int x1,int y1){
    
    this.b.taken[x1][y1] = new Knight(x1,y1,this.col,this.b);   
 
    this.b.taken[this.x][this.y] = null;

  }
  
  void draw(){
    if(this.col)
      image(wKnight,100 + this.x*100,100+(7-this.y)*100,100,100);
    else
      image(bKnight,100 + this.x*100,100+(7-this.y)*100,100,100);
  }
  
  String toString(){
    if(this.col)
      return "wKnight";
    return "bKnight";
  }
}
