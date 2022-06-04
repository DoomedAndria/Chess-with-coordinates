class King extends Piece{
  int x;
  int y;
  boolean col;               //true == white  false == black
  Board b;
  PImage wKing = loadImage("https://upload.wikimedia.org/wikipedia/commons/3/3b/Chess_klt60.png","png");
  PImage bKing = loadImage("https://upload.wikimedia.org/wikipedia/commons/e/e3/Chess_kdt60.png","png");
  
  public King(int x,int y, boolean col,Board b){
    super(x,y,col,b);
    this.x = x;
    this.y = y;
    this.col = col;
    this.b = b;
  }
  
  boolean canMove(int x1,int y1){
    if((x1 - this.x <= 1 && x1 - this.x >= -1)&&(y1 - this.y <= 1 && y1 - this.y >= -1)){
      
      if(b.taken[x1][y1] == null || b.taken[x1][y1].col != this.col)
        return true;
      else{
        new UiBooster().showInfoDialog("the square you are trying to move on is occupied");
        return false;
      }
      
    }
    else{
      new UiBooster().showInfoDialog("invalid king move");
      return false;
    }
  }
  
  void makeMove (int x1,int y1){
    
    this.b.taken[x1][y1] = new King(x1,y1,this.col,this.b);   
 
    this.b.taken[this.x][this.y] = null;

  }
  
  void draw(){
    if(this.col)
      image(wKing,100 + this.x*100,100+(7-this.y)*100,100,100);
    else
      image(bKing,100 + this.x*100,100+(7-this.y)*100,100,100);
  }
  
  String toString(){
    if(this.col)
      return "wKing";
    return "bKing";
  }
}
