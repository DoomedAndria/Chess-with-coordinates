class Board {
  
  int x;
  int y;
  int Length = 800;
  int len = Length/8;
  
  Piece[][] taken = new Piece[8][8];
  
  
  public Board(int x , int y){
    this.x = x;
    this.y = y;
    
    
    
  }
  
  String toString(){
    String ret = "";
    for(int i = 7; i >= 0; i--){
      for(int j = 0; j < this.taken[0].length; j++){
        if(this.taken[j][i]==null)
          ret+=" null ";
        else
          ret+=" "+this.taken[j][i].toString() +" ";
      }
      ret +="\n";
    }
    return ret;
  }
  
  public void draw(){
    strokeWeight(3);
    for(int i = 0;i<8;i++){
      
      //generating text
      textSize(80);
      fill(0);
      text(8-i+"", 25,175+i*100); 
      text(8-i+"", 925,175+i*100);
      text(char(65+i), 125+i*100,75);
      text(char(65+i), 125+i*100,975);
    
      //generating rows for board
      for(int j = 0;j<8;j++){
        if((i+j)%2==0){
          fill(#FAE495);
        }
        else{
          fill(#FC4FFA);
        }
        square(x+j*len,y+i*len,len);
      }
    }
      
  }
  
}
