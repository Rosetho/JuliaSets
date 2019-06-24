void setup() {
  size(1000,700);  
  colorMode(HSB,1);
}
void draw() {
  loadPixels();
  float w=1.5;
  float l=1.5;
  int maxIter=100;
  int esc=4;
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      int currIter=0;
      float c_re = map(x,0,width,-w,w-.5);
      float c_im = map(y,0,height,-l,l);
      float z_re=0;//map(mouseX,0,width,-w,w);
      float z_im=0;//map(mouseY,0,width,-w,w);
      while(currIter < maxIter  &&    z_re*z_re+z_im*z_im <= esc){
        float tmp = z_re*z_re - z_im*z_im + c_re;
        z_im = 2*z_re*z_im + c_im;
        z_re = tmp;
        currIter++;
      }
      if(currIter == maxIter){//IN SET
        pixels[x+y*width]=color(0);
      }
      else{//blew up
        float h=float(currIter)/maxIter;
        pixels[x+y*width]=color(h,255,255);
      }
    }
  }
  updatePixels();
}
