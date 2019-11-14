/**
 * Universidad de Buenos Aires
 * 
 * Facultad de Arquitectura, Diseño y Urbanismo
 * Carrera: Diseño de Imagen y Sonido
 * Asignatura: Proyecto Audio Visual 4
 * Trabajo Final 
 *
 * Malena Schvartz
 * Noviembre 2019
 */


//Colonia stemphylium;
//Colonia phialophora;
//Colonia arborenens;
//Colonia cladosporum;
//Colonia eurotium;
//Colonia phoma;
//
//Colonia aspergillus;
//Colonia flavus;
//Colonia niger;
//
//Colonia penicillium;
//Colonia penicillium_violeta;
//Colonia penicillium_rojo;
//ColoniaPasiva[] coloniasPasivas = new ColoniaPasiva[ coloniasCantidad ];
//ColoniaAgresiva[] coloniasAgresivas = new ColoniaAgresiva[ coloniasCantidad ];

color fondo = color( 0 );
int particulasCantidad = 0;
int coloniasCantidad = 13;
Colonia[] colonias = new Colonia[ coloniasCantidad ];


int[] placa;
int cantidadPixeles;

PVector centro;
PVector puntero;
int paso = 10;
int mira = 10;
int direction = 1;
int desplazarX = 0;
int desplazarY = 0;
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
  size( 700, 700 );

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

  // id, nombre, color1, color2, cambio_color, difusión horizontal, difusión vertical  
  colonias[0]  = new Colonia(  0, "bleaching",           color( 0,   0,   0   ), color( 0,   0,   0   ), 70, 2,  1 );

  colonias[1]  = new Colonia(  1, "stemphylium",         color( 255, 0,   0   ), color( 255, 255, 0   ), 70, 2,  3 );
  colonias[2]  = new Colonia(  2, "phialophora",         color( 0,   255,   0 ), color( 0,   255, 255 ), 70, 1,  1 );
  colonias[3]  = new Colonia(  3, "arborenens",          color( 0,   0,   255 ), color( 255, 0,   255 ), 40, 1,  1 );

  colonias[4]  = new Colonia(  4, "cladosporum",         color( 255, 255, 0   ), color( 0,   0,   255 ), 40, 1,  1 );
  colonias[5]  = new Colonia(  5, "eurotium",            color( 255,   0, 255 ), color( 0,   255, 0   ), 40, 1,  1 );
  colonias[6]  = new Colonia(  6, "phoma",               color( 0,   255, 255 ), color( 255,   0, 0   ), 40, 1,  1 );

  colonias[7]  = new Colonia(  7, "aspergillus",         color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  colonias[8]  = new Colonia(  8, "flavus",              color( 0,   255, 0   ), color( 0,   255, 0   ), 40, 1,  1 );
  colonias[9]  = new Colonia(  9, "niger",               color( 255, 0,   255 ), color( 255, 0,   255 ), 40, 1,  1 );

  colonias[10] = new Colonia( 10, "penicillium",         color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  colonias[11] = new Colonia( 11, "penicillium_rojo",    color( 0,   0,   255 ), color( 0,   0,   255 ), 40, 1,  1 );
  colonias[12] = new Colonia( 12, "penicillium_violeta", color( 0,   255 ,0   ), color( 0,   255 ,0   ), 40, 1,  1 );

}


void draw() {

  //fill( 255 );
  //rect(  0, 0, diametro, diametro);
  fill( fondo );
  stroke( 12);
  ellipse(centro.x, centro.y, diametro, diametro);
  stroke( 255);
  // ellipse( puntero.x, puntero.y, 5, 5);
  
  line( puntero.x-mira, puntero.y, puntero.x+mira, puntero.y);
  line( puntero.x, puntero.y-mira, puntero.x, puntero.y+mira);

  loadPixels();
  for( int i = 0; i < coloniasCantidad; ++i ) {
    colonias[i].update() ;
  }
  updatePixels();
  if(keyPressed == true) {
    puntero();
  }
  float disX = radio - puntero.x;
  float disY = radio - puntero.y;
  float limite = pow( disX, 2 ) + pow( disY, 2 );
  dentro = limite <= pow( (radio), 2 );
  if( !dentro ) puntero = new PVector( reserva.x, reserva.y );
  reserva = new PVector( puntero.x, puntero.y );

  //fill( 0, 55);
  //ellipse(centro.x, centro.y, diametro, diametro);

}

void keyPressed() {

  //reset
  if (key == '0'){
    //loadPixels();
    for(int i=0; i < coloniasCantidad; i++) {
      colonias[i].muere() ;
    }
    //updatePixels();
  }

  if (key == '1'){
    colonias[1].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '2'){
    colonias[2].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '3'){
    colonias[3].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '4'){
    colonias[4].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '5'){
    colonias[5].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '6'){
    colonias[6].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '7'){
    colonias[7].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '8'){
    colonias[8].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '9'){
    colonias[9].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 'q'){
    colonias[10].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 'w'){
    colonias[11].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 'e'){
    colonias[12].deploy( int( puntero.x ), int( puntero.y ) );
  }
}

void puntero() {
  if(key == CODED) {
    if( keyCode == LEFT ) {
      desplazarX = -1;
    }
    if( keyCode == RIGHT ) {
      desplazarX = 1;
    }

    if( keyCode == UP ) {
      desplazarY = -1;
    }
    if( keyCode ==  DOWN ) {
      desplazarY = 1;
    }
  }
  puntero.y += desplazarY * paso;
  puntero.x += desplazarX * paso;
  desplazarX = 0;
  desplazarY = 0;
}

