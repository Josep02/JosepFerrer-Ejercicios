/**
* Sudoku.
* En aquesta activitat anem a intentar fer un programa que ens mostre un Sudoku.
*
* @author: Josep Ferrer Bañuls
* @since: 19-02-2022
*/

// Variables globals
int level;
int [][] sudokuArray = new int [9][9];
PImage bg;
PFont font1;
PFont font2; 
PFont font3;

// Setup
void setup () {
  size (640, 480);
  level = 0;
  
  bg = loadImage ("/media/bg1.jpg");
  
  font1 = createFont ("/media/nuku1.ttf", 65);
  font2 = createFont ("/media/nuku1.ttf", 30);
  font3 = createFont ("/media/pixel.ttf",25);
}

// Draw
void draw () {
  switch (level) {                                 //Switch per a triar entre els diferents nivels que hi han
   case 0: clear();
           pantallaPrincipal();
           break;
   case 1: clear ();
           nivellFacil();
           textFont(font3);
           omplirSudoku();
           break;
   case 2: clear ();
           nivellNormal();
           textFont(font3);
           omplirSudoku();
           break;
   case 3: clear ();
           nivellDificil();
           textFont(font3);
           omplirSudoku();
           break;
  }
}

/**
* Funcio per a mostrar la pantalla principal on els troben els nivells a triar
*/
void pantallaPrincipal () {
  background(bg);
  strokeWeight (1);
  fill (0);
  seleccionarNivell();
  textFont (font1);
  text ("SUDOKU", 220,70);
  textFont (font3);
  fill (255);
  text("Josep Ferrer Banuls",400,460);
}

/**
* Funcio per al nivell facil del programa
*/
void nivellFacil () {
  fill(255);
  background(100,150,200);
  sudokuTable();
  botoExit();
  fill (255);
  textFont (font1);
  text ("FACIL", 255, 60);
  println ("Et trobes en el primer nivell");
}

/**
* Funcio per al nivell normal del programa
*/
void nivellNormal () {
  fill(255);
  background(150,150,200);
  sudokuTable();
  botoExit();
  fill (255);
  textFont (font1);
  text ("NORMAL", 240, 60);
  println ("Et trobes en el segon nivell");
}

/**
* Funcio per al nivell dificil del programa
*/
void nivellDificil () {
  fill(255);
  background(200,120,150);
  sudokuTable();
  botoExit();
  fill (255);
  textFont (font1);
  text ("DIFICIL", 230, 60);
  println ("Et trobes en el tercer nivell");
}

/**
* Funcio per a triar el nivell que volem mitjançant botons
*/
void seleccionarNivell () {
  textFont (font2);
  fill (255);
  rect (240,140,160,50);
  rect (240,200,160,50); 
  rect (240,260,160,50);
  fill (0);
  text ("FACIL",290,175);
  text ("NORMAL",278,235);
  text ("DIFICIL",280,295);
  
  if (mousePressed==true && mouseX>=240 && mouseX<=400 && mouseY>=140 && mouseY<=190) {
    level=1;
  }
  else if(mousePressed==true && mouseX>=240 && mouseX<=400 && mouseY>=200 && mouseY<=250) {
    level=2;
  }
  else if(mousePressed==true && mouseX>=240 && mouseX<=400 && mouseY>=260 && mouseY<=310) {
    level=3;
  }
  else 
  println("Selecciona un nivell per a començar");
}

/**
* Funcio per dibuixar el tauler del sudoku
*/
void sudokuTable () {
  strokeWeight (1);
  for (int i=0; i <9; i++){
    for (int j=0; j <9; j++)
    rect(40*i+70,40*j+80,40,40);
  }
  strokeWeight (3);
  line (70,200,430,200);    //Linies horitzontals
  line (70,320,430,320);    
  line (190,80,190,440);    //Linies verticals
  line (310,80,310,440);
  strokeWeight(5);
  line (70,80,430,80);      //Bordes
  line (70,440,430,440);
  line (70,80,70,440);
  line (430,80,430,440);
}

/**
* Funcio utilitzada per a emplenar el sudoku de forma aleatoria
*/
void omplirSudoku () {
  fill(0);
  for (int i=0; i <sudokuArray.length; i++){
    for (int j=0; j <sudokuArray.length; j++)
    text(sudokuArray[i][j]=(int)random(0,9), 40*i+88,40*j+110);
  }
}


/**
* Funcio per a crear un boto que ens permitix tornar a la pantalla principal 
*/
void botoExit () {
  rect (470,80,120,40);
  textFont (font2);
  fill(0);
  text("BACK",500,110);
 if(mousePressed==true && mouseX>=470 && mouseX<=590 && mouseY>=80 && mouseY<=120) {
   level=0;
 }
}
