class Colonia{
  int id;
  String nombre;
  boolean viva = false;
  int particleCount = 100000;
  Particle[] particles = new Particle[ particleCount ];
  int horizontal = 1;
  int verical = 1;


  color col;
  color col2;
  int cambio_color;
 
  int X;
  int Y;
  PVector origen = new PVector(X,Y);

 Colonia( int i, String n, color c, color c2, int cc, int h, int v ) {
    id = i;
    nombre = n;
    col = c;
    col2 = c2;
    cambio_color = cc;
    horizontal = h;
    verical = v;
    init();
    //deploy();
  }

  void init() {
    for( int i = 0; i < particleCount; i++ ) {
      particles[i] = new Particle( this );
    }
  }
  void deploy( int x, int y ) {
    viva = true;
    int X = x;
    int Y = y;
    origen = new PVector(X,Y);
    print("inoculo "+ nombre + ": " + id + "\n" + origen.x);
    placa[ X + Y * width ] = id;
  }

  void update() {
    if(viva){
     for(int i = 0; i<particleCount; i++) {
       color coloc  = col; 

       if( i > particleCount * 0.5 ) coloc = col2;

       if( !particles[i].cerca() ) coloc = col2;

       particles[i].update();
       if ( particles[i].stuck ){
         pixels[
          particles[i].y * width + particles[i].x
         ] = color( coloc );

       }
     } 
    } 
  }

  void muere() {
    viva = false;
    for(int i = 0; i<particleCount; i++) {
      particles[i].muere();
      pixels[
       particles[i].y * width + particles[i].x
      ] = color( 255 );
    } 
  }

}

class ColoniaAgresiva extends Colonia{

  ColoniaAgresiva ( int i, String n, color c, color c2, int cc, int h, int v ) {
    super( i, n, c, c2, cc, h, v );
    ParticleAgresiva[] particles = new ParticleAgresiva[ particleCount ];
  }

  void deploy( int x, int y ) {
    print("Inoculo Agresiva: " + id + "\n");
    int X = x;
    int Y = y;
    placa[ X + Y * width ] = id;
  }

  void init() {
    for( int i = 0; i < particleCount; i++ ) {
      particles[i] = new ParticleAgresiva( this );
    }
  }

}

class ColoniaPasiva extends Colonia{
  int particleCount = 100000;
  ParticlePasiva[] particles = new ParticlePasiva[ particleCount ];
 
  ColoniaPasiva ( int i, String n,color c, color c2, int cc, int h, int v ) {
    super( i, n, c, c2, cc, h, v );
  }

  void deploy( int x, int y ) {
    print("Inoculo pasiva: " + id + "\n");
    int X = x;
    int Y = y;
    placa[ X + Y * width ] = id;
  }


}
