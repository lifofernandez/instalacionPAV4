class Colonia{
  int id;
  int particleCount = 100000;
  Particle[] particles = new Particle[ particleCount ];

  // color col = color(
  //   random(255),
  //   random(255),
  //   random(255)
  // );
  color col;
 
  int X;
  int Y;

  Colonia( int i, color c ) {
    id = i;
    col = c;
    init();
    //deploy();
  }

  void init() {
    for( int i = 0; i < particleCount; i++ ) {
      particles[i] = new Particle( this );
    }
  }
  void deploy( int x, int y ) {
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

        //stroke(col);
	//noFill();
        //ellipse(
	//  particles[i].y,
	//  particles[i].x,
	//  15,
	//  15
	//);

      }
    } 
  }

}
