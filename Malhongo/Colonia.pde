class Colonia{
  int id;
  String nombre;
  boolean viva = false;
  boolean muriendo = false;

  int particleCount = 50000;
  ArrayList<Particle> particles = new ArrayList<Particle>();
  int vivas;
  int horizontal = 1;
  int verical = 1;

  int X;
  int Y;
  PVector origen = new PVector( X, Y );
 
  color col;
  color col2;
  int cambio_color;
  color reserva;
  color reserva2;
  int anillos = 3;
  float grosor  = .25;

  int nacimiento;
  int espectativa = 10000;

  int cambio = 0;

  boolean agresiva = false;
 
  Colonia( int i, String n, color c, color c2, int cc, int a, float g, int h, int v, int e, boolean o ) {
    id = i;
    nombre = n;
    col = c;
    col2 = c2;
    reserva = c;
    reserva2 = c2;
    cambio_color = cc;
    anillos = a;
    grosor  = g;
    horizontal = h;
    verical = v;
    espectativa = 1000 * e;
    agresiva = o;
  }

  void init() {
    for( int i = 0; i < particleCount; i++ ) {
      particles.add( new Particle( this ) );
    }
    viva = true;
  }

  void deploy( int x, int y ) {
    if(!viva){
      nacimiento = millis();
      init();
      int X = x;
      int Y = y;
      origen = new PVector( X , Y );
      placa[ X + Y * width ] = id;
      println( "Inocular " + id + ": " + nombre );
    }else{
      println( "Ya vive " + id + ": " + nombre );
      col  = color( 255,150 ); 
      col2  = color( 255,150 ); 
      cambio = millis();
    }
  }

  void update() {
    if( viva && millis() - nacimiento >= espectativa * 2 ){
      muriendo = true;
    }
    if( cambio > 0 && millis() - cambio >= 500 ){
      col  = reserva; 
      col2  = reserva2; 
    }
    if( viva ){

      for( int i = 0; i < particles.size(); i++ ){
        Particle part = particles.get(i);
        color coloc  = col; 
        //spread
        if( i % 10 == 0 ) coloc = col2; 
        for( int e = 1; e <= anillos * 2; e++ ) {
          float anillo = cambio_color * grosor * e;
          if( part.lejania() > cambio_color + anillo ){
            coloc = col2;
            if( i % 10 == 0 ) coloc = col; 
            if( e % 2 == 0 ){
              coloc = col;
              if( i % 10 == 0 ) coloc = col2; 
            }
          }
        }

        //if( part.lejania() > cambio_color * 1.25 ){
        //  coloc = col;
        //  //spread
        //  if( i % 5 == 0 ){
        //     coloc = col2;
        //  }
        //  if( part.lejania() > cambio_color * 1.5 ){
        //    coloc = col;
        //    //spread
        //    if( i % 5 == 0 ){
        //       coloc = col2;
        //    }
        //  }
        //}
        part.update();
        if ( part.stuck && !part.muerta){
          pixels[
             part.y * width + part.x
          ] = color( coloc );
          vivas++;
        }

        if ( part.muerta ){
          vivas--;
        }
      } 

      if( muriendo && vivas < 0){
        muere();
      }
    } 
  }

  void muere() {
    if( viva ){
      println( "Muere " + id + ": " + nombre );
      muriendo = false;
      viva = false;
      // Borra centro
      placa[ int(origen.x) + int(origen.y) * width ] = -1;
      for ( int i = particles.size() - 1; i >= 0; i-- ) {
           Particle part = particles.get(i);
           part.muere();
           particles.remove(i);
      }
    }
  }

}

//class ColoniaAgresiva extends Colonia{
//
//  ColoniaAgresiva ( int i, String n, color c, color c2, int cc, int h, int v ) {
//    super( i, n, c, c2, cc, h, v );
//    ParticleAgresiva[] particles = new ParticleAgresiva[ particleCount ];
//  }
//
//  void deploy( int x, int y ) {
//    print("Inoculo Agresiva: " + id + "\n");
//    int X = x;
//    int Y = y;
//    placa[ X + Y * width ] = id;
//  }
//
//  void init() {
//    for( int i = 0; i < particleCount; i++ ) {
//      particles[i] = new ParticleAgresiva( this );
//    }
//  }
//
//}
//
//class ColoniaPasiva extends Colonia{
//  int particleCount = 100000;
//  ParticlePasiva[] particles = new ParticlePasiva[ particleCount ];
// 
//  ColoniaPasiva ( int i, String n,color c, color c2, int cc, int h, int v ) {
//    super( i, n, c, c2, cc, h, v );
//  }
//
//  void deploy( int x, int y ) {
//    print("Inoculo pasiva: " + id + "\n");
//    int X = x;
//    int Y = y;
//    placa[ X + Y * width ] = id;
//  }
//
//
//}
