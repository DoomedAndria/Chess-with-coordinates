class Pawn extends Piece{
  int x;
  int y;
  boolean col;               //true == white  false == black
  Board b;
  PImage wPawn = loadImage("https://upload.wikimedia.org/wikipedia/commons/0/04/Chess_plt60.png","png");
  PImage bPawn = loadImage("https://upload.wikimedia.org/wikipedia/commons/c/cd/Chess_pdt60.png","png");
  
  public Pawn(int x,int y, boolean col,Board b){
    super(x,y,col,b);
    this.x = x;
    this.y = y;
    this.col = col;
    this.b = b;
  }
  
  
  
  boolean canMove(int x1,int y1){
    
    if(this.x == x1 &&(this.col && (this.y+1 == y1 || this.y==1 &&y1 == 3 && b.taken[x1][2]==null) ||       //is pawn possible move?(including two square move at the begining)
                      !this.col && (this.y-1 == y1 || this.y == 6 && y1 == 4 && b.taken[x1][5]==null) )){               
      
      if(b.taken[x1][y1] == null)                                            // place free?
        return true;
        
      else{
        new UiBooster().showInfoDialog("the square you are trying to move on is occupied");
        return false;
      }
      
    }
    
    else if((this.x+1==x1 || this.x-1==x1)  &&                                  //kill move?
    (this.y+1==y1 && this.col || this.y-1==y1 && !this.col)&& b.taken[x1][y1]!=null){                  
      
      if(b.taken[x1][y1].col != this.col)                                      // is enemy?
        return true;
      
      else{
        new UiBooster().showInfoDialog("you can't kill your piece");
        return false;
      }
    }
   
    else{
      new UiBooster().showInfoDialog("invalid pawn move");
      return false;
    }
   
  }
  
  void makeMove (int x1,int y1){
    
    this.b.taken[x1][y1] = new Pawn(x1,y1,this.col,this.b);   
 
    this.b.taken[this.x][this.y] = null;

  }
  
  void draw(){
    if(this.col)
      image(wPawn,100 + this.x*100,100+(7-this.y)*100,100,100);
    else
      image(bPawn,100 + this.x*100,100+(7-this.y)*100,100,100);
  }
  
  String toString(){
    if(this.col)
      return "wPawn";
    return "bPawn";
  }
}
