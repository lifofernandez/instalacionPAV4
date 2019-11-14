class Colonia{
 
  int id;
  String nombre;
  boolean viva = false;
  int particleCount = 50000;
 
  ArrayList<Particle> particles = new ArrayList<Particle>();
  int horizontal = 1;
  int verical = 1;
 
  color col;
  color col2;
  int cambio_color;
  
  int X;
  int Y;
  PVector origen = new PVector( X, Y );

  int nacimiento;
 
  Colonia( int i, String n, color c, color c2, int cc, int h, int v ) {
    id = i;
    nombre = n;
    col = c;
    col2 = c2;
    cambio_color = cc;
    horizontal = h;
    verical = v;
  }

  void init() {
    nacimiento = millis();
    for( int i = 0; i < particleCount; i++ ) {
      particles.add( new Particle( this ) );
    }
  }

  void deploy( int x, int y ) {
    init();
    if(!viva){
      viva = true;
      int X = x;
      int Y = y;
      origen = new PVector(X,Y);
      placa[ X + Y * width ] = id;
      println( "Inocular " + id + ": " + nombre );
    } else {
      println( "Mato " + id + ": " + nombre );
      muere();
    }
  }

  void update() {

     //if( millis() - nacimiento >= 3000){
     // muere();
     //}

    if( viva ){
      for( int i = 0; i < particles.size(); i++ ) {
        Particle part = particles.get(i);
        color coloc  = col; 
        //spread
        if( i % 10 == 0 ) coloc = col2; 
        if( part.lejos() ){
          coloc = col2;
          //spread
          if( i % 5 == 0 ){
             coloc = col;
          }
        }
        part.update();
        if ( part.stuck ){
          pixels[
             part.y * width + part.x
          ] = color( coloc );
        }
      } 
    } 
  }

  void muere() {
    if( viva ){
      viva = false;

      int ultima_muerte = millis();
      // Borra centro
      placa[ int(origen.x) + int(origen.y) * width ] = -1;
      for ( int i = particles.size() - 1; i >= 0; i-- ) {
        //if( millis() - ultima_muerte >= 100){
           ultima_muerte = millis();
           //println(ultima_muerte - nacimiento);
           Particle part = particles.get(i);
           part.muere();
           particles.remove(i);
        //}
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
