/**
 * Simulate: Diffusion-Limited Aggregation 
 */

int coloniasCantidad = 10;
Colonia[] colonias = new Colonia[ coloniasCantidad ];
int[] placa;

PVector centro;
PVector puntero;
int paso = 10;
int direction = 1;
float distancia = 0;
int diametro;
int radio;

float r = 50;
int numPoints= 20;
float a = TWO_PI / ( float )numPoints;
float angulo = 0;

void setup() {
  size( 700, 700, P2D );
  background(0);
  diametro = height;
  radio = diametro / 2;
  centro = new PVector( width / 2 , height / 2 );

  puntero = new PVector( centro.x, centro.y );

  int cantidadPixeles = width * height;
  cantidadPixeles = width * height;

  // create an array that
  // stores the position of our particles
  placa = new int[ cantidadPixeles ];
  for(int i=0; i < cantidadPixeles; i++) {
    placa[i] = -1 ;
  }

  colonias[0] = new Colonia( 0, color( 255,0,0) );
  colonias[1] = new Colonia( 1, color( 0,255,0) );
  colonias[2] = new Colonia( 2, color( 0,0,255) );
  colonias[3] = new Colonia( 3, color( 0,255,255) );
  colonias[4] = new Colonia( 4, color( 255,0,255) );
  colonias[5] = new Colonia( 5, color( 255,255,0) );

  colonias[6] = new Colonia( 6, color( 255,155,55) );
  colonias[7] = new Colonia( 7, color( 55,255,155) );
  colonias[8] = new Colonia( 8, color( 155,55,255) );
  colonias[9] = new Colonia( 9, color( 0,0,0) );
}


void draw() {

  ellipse(centro.x, centro.y, diametro, diametro);

  if(keyPressed == true) {
    mira();
  }
  
  loadPixels();
  for(int i=0; i < coloniasCantidad; i++) {
    colonias[i].update();
  }
  updatePixels();
  puntero.x = centro.x + r * sin( a * angulo );
  puntero.y = centro.y + r * cos( a * angulo );
  ellipse(puntero.x, puntero.y,5,5);
}

void keyPressed() {
  //int keyIndex = -1;
  //if (key >= 'A' && key <= 'Z') {
  //  keyIndex = key - 'A';
  //} else if (key >= 'a' && key <= 'z') {
  //  keyIndex = key - 'a';
  //}
  //if (keyIndex != -1) {
  //  colonias[keyIndex % coloniasCantidad ].deploy();
  //  print( keyIndex );
  //}

  if (key == '0'){
    colonias[ 0 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '1'){
    colonias[ 1 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '2'){
    colonias[ 2 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '3'){
    colonias[ 3 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '4'){
    colonias[ 4 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '5'){
    colonias[ 5 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '6'){
    colonias[ 6 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '7'){
    colonias[ 7 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '8'){
    colonias[ 8 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '9'){
    colonias[ 9 ].deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }

}
void mira() {

  if(key == CODED) {
    if( keyCode == LEFT ) {
      if ( r > -radio+paso ) r -= paso;
    }
    if( keyCode == RIGHT ) {
      if ( r < radio - paso ) r += paso;
    }

    if( keyCode == UP ) {
        angulo += 1 ; 
    }
    if( keyCode ==  DOWN ) {
        angulo -= 1 ; 
    }
  
  }
}

