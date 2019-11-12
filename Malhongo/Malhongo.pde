/**
 * Instalación: Proyecto Audio Visual 4
 * Malena Schvartz
 */

int particulasCantidad = 0;

Colonia stemphylium;
Colonia phialophora;
Colonia arborenens;
Colonia cladosporum;
Colonia eurotium;
Colonia phoma;

Colonia aspergillus;
Colonia flavus;
Colonia niger;

Colonia penicillium;
Colonia penicillium_violeta;
Colonia penicillium_rojo;

//ColoniaPasiva[] coloniasPasivas = new ColoniaPasiva[ coloniasCantidad ];
//ColoniaAgresiva[] coloniasAgresivas = new ColoniaAgresiva[ coloniasCantidad ];

int[] placa;
int cantidadPixeles;

PVector centro;
PVector puntero;
int paso = 10;
int direction = 1;
int desplazarX = 0;
int desplazarY = 0;

PVector mira;
float mira_angulo;
float mira_magnitud;
float limite;
boolean dentro = true;
float disX;
float disY;
PVector reserva;
PVector proyeccion;

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

  cantidadPixeles = width * height;
  placa = new int[ cantidadPixeles ];
  for(int i=0; i < cantidadPixeles; i++) {
    placa[i] = -1 ;
  }

  // id, color1, color2, cambio_color, horizontal, vertical  
  stemphylium         = new Colonia( 1,  color( 255, 0,   0   ), color( 0,   255, 0   ), 70, -1,  2 );
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

  //println(particulasCantidad);

  fill(255);
  ellipse(centro.x, centro.y, diametro, diametro);

  ellipse( puntero.x, puntero.y, 5, 5);

  
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


  if(keyPressed == true) {
    mira();
  }
  float disX = radio - puntero.x;
  float disY = radio - puntero.y;
  float limite = pow( disX, 2 ) + pow( disY, 2 );
  dentro = limite <= pow( (radio), 2 );
  if( !dentro ) puntero = new PVector(reserva.x,reserva.y);
  reserva = new PVector( puntero.x, puntero.y );


  //mira_angulo =  atan( mira.x / mira.y );
  //mira_magnitud = sqrt( pow( mira.x, 2 ) + pow( mira.y, 2 ) );
  //proyeccion = new PVector(
  //  ( radio ) * sin( mira_angulo ),
  //  ( radio ) * cos( mira_angulo )
  //);
  //fill(255,0,0);

  //ellipse( proyeccion.x + centro.x, proyeccion.y +centro.y , 10, 10);


}

void keyPressed() {



  //reset
  //if (key == '0'){
  //  for(int i=0; i < cantidadPixeles; i++) {
  //    placa[i] = -1 ;
  //    //pixels[
  //    // particles[i].y * width + particles[i].x
  //    //] = color( 255 );
  //  }
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


  //distancia = sqrt(
  //   pow( centro.x - puntero.x, 2) + pow( centro.y - puntero.y, 2)
  //);

 

  if(key == CODED) {
    if( keyCode == LEFT ) {
      //if ( r > -radio+paso ) r -= paso;
      //r -= paso;
      //if ( r < -radio ) r = radio;
      desplazarX = -1;
    }
    if( keyCode == RIGHT ) {
      //if ( r < radio - paso ) r += paso;
      //r += paso;
      //if ( r > radio ) r = -radio;
      desplazarX = 1;
    }

    if( keyCode == UP ) {
        //angulo += .5 ;;
        desplazarY = -1;
    }
    if( keyCode ==  DOWN ) {
        //angulo -= .5 ; 
        desplazarY = 1;
    }
  
  }
  puntero.y += desplazarY * paso;
  puntero.x += desplazarX * paso;

  desplazarX = 0;
  desplazarY = 0;
}

