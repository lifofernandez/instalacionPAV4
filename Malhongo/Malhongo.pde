/**
 * Universidad de Buenos Aires
 * 
 * Facultad de Arquitectura, Diseño y Urbanismo
 * Carrera: Diseño de Imagen y Sonido
 * Asignatura: Proyecto Audio Visual 4
 *
 * Trabajo Final 
 *
 * Malena Schvartz
 * Noviembre 2019
 * 
 * Desarrollo: Lisandro Fernández
 *
 * Basado en: Simulate: DIFFUSION-LIMITED AGGREGATION
 * Por: Casey Reas
 * En: Form+Code in Design, Art, and Architecture
 * http://formandcode.com/code-examples/simulate-dla
 *
 */

color fondo = color( 0 );

int coloniasCantidad = 13;
Colonia[] colonias = new Colonia[ coloniasCantidad ];

int[] placa;
int cantidadPixeles;

int diametro;
int radio;

PVector centro;
PVector puntero;
int paso = 10;
int mira = 10;
int desplazarX = 0;
int desplazarY = 0;
float posicion;
boolean dentro = true;
float disX;
float disY;
PVector reserva;

// ColoniaPasiva[] coloniasPasivas = new ColoniaPasiva[ coloniasCantidad ];
// ColoniaAgresiva[] coloniasAgresivas = new ColoniaAgresiva[ coloniasCantidad ];


void setup() {
  size( 700, 700 );
  background(fondo);

  diametro = height;
  radio = diametro / 2;
  centro = new PVector( width / 2 , height / 2 );

  puntero = new PVector( centro.x, centro.y );

  cantidadPixeles = width * height;
  placa = new int[ cantidadPixeles ];
  for(int i=0; i < cantidadPixeles; i++) {
    placa[i] = -1 ;
  }

  // id, nombre, color1, color2, cambio_color, anillos, grosor, difusión horizontal, difusión vertical, tiempo de vida, agresiva
  colonias[0]  = new Colonia(  0, "blanqueo",            color( fondo   ), color( fondo ), 70, 3, .20, 2,  1, 30, true );

  colonias[1]  = new Colonia(  1, "stemphylium",         color( 200, 174, 121 ), color( 61,  47,  54  ), 30,  4, 0.5, 1, 3, 80, false );
  colonias[2]  = new Colonia(  2, "phialophora",         color( 0,   255, 0   ), color( 255, 0,   0   ), 20,  4, 0.7, 1, 1, 50, true  );
  colonias[3]  = new Colonia(  3, "arborenens",          color( 157, 152, 149 ), color( 61,  47,  54  ), 60,  3, 1.5, 3, 1, 60, false );
  colonias[4]  = new Colonia(  4, "cladosporum",         color( 255, 255, 0   ), color( 0,   0,   255 ), 40,  4, 0.5, 1, -1, 30, false );
  colonias[5]  = new Colonia(  5, "ochra",               color( 255, 0,   255 ), color( 0,   255, 0   ), 40,  4, 0.5, 1, 1, 40, false );
  colonias[6]  = new Colonia(  6, "phoma",               color( 0,   255, 255 ), color( 255, 0,   0   ), 40,  4, 0.5, 1, 1, 50, false );
  colonias[7]  = new Colonia(  7, "aspergillus",         color( 208, 169, 83  ), color( 98,  52,  16  ), 40,  4, 0.5, 1, 1, 30, false );
  colonias[8]  = new Colonia(  8, "flavus",              color( 0,   255, 0   ), color( 0,   255, 0   ), 40,  4, 0.5, 1, 1, 30, false );
  colonias[9]  = new Colonia(  9, "niger",               color( 255, 0,   255 ), color( 255, 0,   255 ), 40,  4, 0.5, 1, 1, 30, false );
  colonias[10] = new Colonia( 10, "penicillium",         color( 0,   0,   255 ), color( 0,   0,   255 ), 40,  4, 0.5, 1, 1, 30, false );
  colonias[11] = new Colonia( 11, "penicillium_rojo",    color( 0,   0,   255 ), color( 0,   0,   255 ), 40,  4, 0.5, 1, 1, 30, false );
  colonias[12] = new Colonia( 12, "penicillium_violeta", color( 0,   255 ,0   ), color( 0,   255 ,0   ), 40,  4, 0.5, 1, 1, 30, false );

}


void draw() {
  background(fondo);

  fill( fondo );
  stroke( 12 );
  ellipse( centro.x, centro.y, diametro, diametro );


  loadPixels();
  for( int i = 0; i < coloniasCantidad; ++i ) {
    colonias[i].update() ;
  }
  updatePixels();
  if(keyPressed == true) {
    puntero();
  }
  posicion = pow( radio - puntero.y, 2 ) + pow( radio - puntero.x, 2 );
  dentro = posicion <= pow( (radio - mira ), 2 );
  if( !dentro ) puntero = new PVector( reserva.x, reserva.y );
  reserva = new PVector( puntero.x, puntero.y );

  stroke( 255 );
  line( puntero.x - mira, puntero.y, puntero.x + mira, puntero.y);
  line( puntero.x, puntero.y - mira, puntero.x, puntero.y + mira);

}

void keyPressed() {
  //reset
  if (key == 'z'){
    for(int i=0; i < coloniasCantidad; i++) {
      colonias[i].muere() ;
    }
  }
  if (key == 'a'){
    colonias[1].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 'f'){
    colonias[2].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 'w'){
    colonias[3].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 'n'){
    colonias[4].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 'e'){
    colonias[5].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '!'){
    colonias[6].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 'l'){
    colonias[7].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 'q'){
    colonias[8].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '.'){
    colonias[9].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == 't'){
    colonias[10].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '-'){
    colonias[11].deploy( int( puntero.x ), int( puntero.y ) );
  }
  if (key == '6'){
    colonias[12].deploy( int( puntero.x ), int( puntero.y ) );
  }
}

void puntero() {

    if( key == '5' ){
      desplazarX = -1;
    }
    if( key == '0' ){
      desplazarX = 1;
    }

    if( key == 'x' ){
      desplazarY = -1;
    }
    if( key ==  'c' ){
      desplazarY = 1;
    }
  
  puntero.y += desplazarY * paso;
  puntero.x += desplazarX * paso;
  desplazarX = 0;
  desplazarY = 0;
}
