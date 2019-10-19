class Colonia{
  int id;
  int particleCount = 100000;
  Particle[] particles = new Particle[ particleCount ];
  int horizontal = 1;
  int verical = 1;


  // color col = color(
  //   random(255),
  //   random(255),
  //   random(255)
  // );
  color col;
 
  int X;
  int Y;

 Colonia( int i, color c, int h, int v ) {
    id = i;
    col = c;
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
    print("inoculo: " + id + "\n");
    int X = x;
    int Y = y;
    placa[ X + Y * width ] = id;
  }

  void update() {
    for(int i = 0; i<particleCount; i++) {
      particles[i].update();
      if ( particles[i].stuck ){
        pixels[
         particles[i].y * width + particles[i].x
        ] = color( col );

      }
    } 
  }

}

class ColoniaAgresiva extends Colonia{

  ColoniaAgresiva ( int i, color c, int h, int v ) {
    super( i , c, h, v );
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
 
  ColoniaPasiva ( int i, color c, int h, int v ) {
    super( i , c, h, v );
  }

  void deploy( int x, int y ) {
    print("Inoculo pasiva: " + id + "\n");
    int X = x;
    int Y = y;
    placa[ X + Y * width ] = id;
  }


}
