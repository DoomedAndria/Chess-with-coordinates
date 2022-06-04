import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.model.options.*;
import uibooster.utils.*;

Board board = new Board(100, 100);

Piece pb1 = new Pawn(1,6,false,board);
Piece pb2 = new Pawn(2,6,false,board);
Piece pb3 = new Pawn(3,6,false,board);
Piece pb4 = new Pawn(4,6,false,board);    //black pawn
Piece pb5 = new Pawn(5,6,false,board);
Piece pb6 = new Pawn(6,6,false,board);
Piece pb7 = new Pawn(7,6,false,board);
Piece pb8 = new Pawn(0,6,false,board);

Piece pw1 = new Pawn(1,1,true,board);
Piece pw2 = new Pawn(2,1,true,board);
Piece pw3 = new Pawn(3,1,true,board);
Piece pw4 = new Pawn(4,1,true,board);    //white pawn
Piece pw5 = new Pawn(5,1,true,board);
Piece pw6 = new Pawn(6,1,true,board);
Piece pw7 = new Pawn(7,1,true,board);
Piece pw8 = new Pawn(0,1,true,board);

Piece kw = new King(4,0,true,board);    //kings
Piece kb = new King(4,7,false,board);

Piece qw = new Queen(3,0,true,board);    //queens
Piece qb = new Queen(3,7,false,board);

Piece rb1 = new Rook(0,7,false,board);
Piece rb2 = new Rook(7,7,false,board);
Piece rw1 = new Rook(0,0,true,board);    //rooks
Piece rw2 = new Rook(7,0,true,board);

Piece bb1 = new Bishop(2,7,false,board);
Piece bb2 = new Bishop(5,7,false,board);    //bishops
Piece bw1 = new Bishop(2,0,true,board);
Piece bw2 = new Bishop(5,0,true,board);

Piece kb1 = new Knight(1,7,false,board);
Piece kb2 = new Knight(6,7,false,board);    //knights
Piece kw1 = new Knight(1,0,true,board);
Piece kw2 = new Knight(6,0,true,board);


boolean gameStarted = false;
boolean wTurn = false;

String move;  // input coordinates



String whosTurn() {
  if (wTurn)
    return "white";
  return "black";
}

void setup() {
  size(1000, 1000);
}

void draw() {
  background(#5A5A59);
  board.draw();
  drawPieces(board);


  if (gameStarted)
    input();

  background(#5A5A59);
  board.draw();
  drawPieces(board);

  wTurn = !wTurn;
  gameStarted = true;
}

void input() {
  move = new UiBooster().showTextInputDialog("enter two coordinates separated by space. \n for example: A2 A3 \n"+whosTurn()+"'s turn");

  if (move.length() ==5 && move.charAt(2)==' ' &&
    move.charAt(0) >= 'A' && move.charAt(0) <= 'H' && move.charAt(3) >= 'A' & move.charAt(3) <= 'H' &&      // input validation
    move.charAt(1) >= '1' && move.charAt(1) <= '8' && move.charAt(4) >= '1' & move.charAt(4) <= '8') {

    int x = int(move.charAt(0) - 'A');
    int y = int(move.charAt(1) - '1');                                    //giving chess coordinates coresponding matrix coordinates
    int x1 = int(move.charAt(3) - 'A');
    int y1 = int(move.charAt(4) - '1');

    if (board.taken[x][y] != null) {                                                      //are first coordinates pointing a piece?

      if (board.taken[x][y].col == wTurn) {                           //is player trying to move enemys piece?

        if (board.taken[x][y].canMove(x1, y1)) {                            //is this move valid for particular piece?
          board.taken[x][y].makeMove(x1, y1);
        } else
          input();
      } else {
        new UiBooster().showInfoDialog(whosTurn()+"'s turn now");
        input();
      }
    } else {
      new UiBooster().showInfoDialog("square you are trying to access is empty");
      input();
    }
  } else {
    new UiBooster().showInfoDialog("input is not valid \n please enter chess coordinates separated by space");
    input();
  }
}

public static void drawPieces(Board b) {
  for (int i = 0; i < b.taken.length; i++) {
    for (int j = 0; j < b.taken[0].length; j++) {
      if (b.taken[i][j] != null)
        b.taken[i][j].draw();
    }
  }
}
