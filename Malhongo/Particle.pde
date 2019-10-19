
class Particle{
  int x, y;
  int cid;
  Colonia col;
  boolean stuck = false;

  Particle( Colonia c ) {
    col = c;
    cid = col.id;
    reset();
  }

  void reset() {
    // keep choosing random spots
    // until an empty one is found
    do {
      x = floor(random(width));
      y = floor(random(height));
    } while ( (placa[y * width + x] == cid));
  }

  void update() {
    // move around
    if (!stuck) {
      x += round( random( -col.horizontal, col.horizontal) );
      y += round( random( -col.verical, col.verical ) );
      
      if (
	x < 0 ||
        y < 0 ||
        x >= width ||
	y >= height 
	|| ocupado()
      ) {
         reset();
         return; 
      }

      if (
	!alone()
      ) {
        stuck = true;
        placa[y * width + x] = cid;        
      }
    }
  }

  // returns true if no neighboring pixels
  boolean alone() {
    int currentx = x;
    int currenty = y;

    float dis = sqrt(
     pow( currentx - centro.x, 2) + pow( currenty - centro.y, 2)
    );

    // get positions
    int leftx   = currentx - 1;
    int rightx  = currentx + 1;
    int topy    = currenty - 1;
    int bottomy = currenty + 1;

    //if (
    //  currentx <= 0 || currentx >= width || 
    //  leftx <= 0    || leftx >= width || 
    //  rightx <= 0   || rightx >= width || 
    //  currenty <= 0 || currenty >= height || 
    //  topy <= 0     || topy >= height || 
    //  bottomy <= 0  || bottomy >= height
    //) return true;
    if (
      leftx <= 0    || leftx >= width || 
      rightx <= 0   || rightx >= width || 
      topy <= 0     || topy >= height || 
      bottomy <= 0  || bottomy >= height
    ) return true;

    if (
      dis >= radio - paso
    ) return true;

    // pre multiply the ys
    currenty *= width;
    bottomy  *= width;
    topy     *= width;
    
    // N, W, E, S
    if (
      ( placa[ currentx + topy ]    == cid ) || 
      ( placa[ leftx + currenty ]   == cid ) ||
      ( placa[ rightx + currenty ]  == cid ) ||
      ( placa[ currentx + bottomy ] == cid )
    ) return false;
    
    // NW, NE, SW, SE
    if (
      ( placa[ leftx + topy ]     == cid ) || 
      ( placa[ leftx + bottomy ]  == cid ) ||
      ( placa[ rightx + topy ]    == cid ) ||
      ( placa[ rightx + bottomy ] == cid )
    ) return false;
    
    return true;
  }  

  boolean ocupado() {
    int currentx = x;
    int currenty = y;
    currenty *= width;
    if (
      placa[ currenty + currentx ] >= 0 
    ) return true;

    return false;
  }  

}

class ParticleAgresiva extends Particle{
  ParticleAgresiva( ColoniaAgresiva c ) {
    super( c );
  }

  boolean ocupado() {
    int currentx = x;
    int currenty = y;
    currenty *= width;
    if (
      placa[ currenty + currentx ] >= 3
    ) return true;

    return false;
  }  
}


class ParticlePasiva extends Particle{
  ParticlePasiva( Colonia c ) {
    super( c );
  }
}
