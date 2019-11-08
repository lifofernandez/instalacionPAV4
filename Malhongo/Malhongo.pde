/**
 * Simulate: Diffusion-Limited Aggregation 
 */

int coloniasCantidad = 3;

Colonia stemphylium         ;
Colonia phialophora         ;
Colonia arborenens          ;
Colonia cladosporum         ;
Colonia eurotium            ;
Colonia phoma               ;

Colonia aspergillus         ;
Colonia flavus              ;
Colonia niger               ;

Colonia penicillium         ;
Colonia penicillium_violeta ;
Colonia penicillium_rojo    ;

//ColoniaPasiva[] coloniasPasivas = new ColoniaPasiva[ coloniasCantidad ];
//ColoniaAgresiva[] coloniasAgresivas = new ColoniaAgresiva[ coloniasCantidad ];

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

  // id, color1, color2, cambio_color, horizontal, vertical  
  stemphylium         = new Colonia( 1,  color( 255, 0,   0   ), color( 0,   255, 0   ), 40, 1,  1 );
  phialophora         = new Colonia( 2,  color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  arborenens          = new Colonia( 3,  color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  cladosporum         = new Colonia( 4,  color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  eurotium            = new Colonia( 5,  color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  phoma               = new Colonia( 6,  color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
                                                                 
  aspergillus         = new Colonia( 7,  color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  flavus              = new Colonia( 8,  color( 0,   255, 0   ), color( 0,   255, 0   ), 40, 1,  1 );
  niger               = new Colonia( 9,  color( 255, 0,   255 ), color( 255, 0,   255 ), 40, 1,  1 );
                                                                 
  penicillium         = new Colonia( 10, color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  penicillium_rojo    = new Colonia( 11, color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  penicillium_violeta = new Colonia( 12, color( 0,   255 ,0   ), color( 0,   255 ,0   ), 40, 1,  1 );

}


void draw() {

  ellipse(centro.x, centro.y, diametro, diametro);

  if(keyPressed == true) {
    mira();
  }
  
  loadPixels();

  stemphylium.update();
  phialophora.update();
  arborenens.update();
  cladosporum.update();
  eurotium.update();
  phoma.update();

  aspergillus.update();
  flavus.update();
  niger.update();

  penicillium.update();
  penicillium_violeta.update();
  penicillium_rojo.update();


  updatePixels();
  puntero.x = centro.x + r * sin( a * angulo );
  puntero.y = centro.y + r * cos( a * angulo );
  ellipse( puntero.x, puntero.y, 5, 5);
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

  //if (key == '0'){
  //  //colonias[ 0 ].deploy(
  //  //  int( puntero.x ),
  //  //  int( puntero.y )
  //  //);
  //}

  if (key == '1'){
  stemphylium.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '2'){
  phialophora.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }

  if (key == '3'){
  arborenens.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '4'){
  cladosporum.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '5'){
  eurotium.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '6'){
  phoma.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '7'){
  aspergillus.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '8'){
    flavus.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == '9'){
  niger.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == 'q'){
  penicillium.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == 'w'){
  penicillium_rojo.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }
  if (key == 'e'){
  penicillium_violeta.deploy(
      int( puntero.x ),
      int( puntero.y )
    );
  }

}

void mira() {
  // CURSOR
  if (key == 'f'){
    r += paso;
    if ( r > radio ) r = -radio;
  }
  if (key == 't'){
      angulo += .5;
  }

  if(key == CODED) {
    if( keyCode == LEFT ) {
      //if ( r > -radio+paso ) r -= paso;
      r -= paso;
      if ( r < -radio ) r = radio;
    }
    if( keyCode == RIGHT ) {
      //if ( r < radio - paso ) r += paso;
      r += paso;
      if ( r > radio ) r = -radio;
    }

    if( keyCode == UP ) {
        angulo += .5 ;;
    }
    if( keyCode ==  DOWN ) {
        angulo -= .5 ; 
    }
  
  }
}

