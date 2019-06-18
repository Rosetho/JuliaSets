float l=1.5;
float w=1.5;
void setup() {
    size(1000,700);  
    colorMode(HSB,1);
} //<>//
void draw() {
    loadPixels();
    int maxIter=65;
    int esc=4;
    for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
        float z_re = map(x,0,width,-w,w);
        float z_im = map(y,0,height,-l,l);
        int currIter=0;
        float c_re=map(mouseX,0,width,-w,w);
        float c_im=map(mouseY,0,height,-l,l);
        while(currIter < maxIter  &&    z_re*z_re+z_im*z_im <= esc){
            float tmp = z_re*z_re - z_im*z_im  + c_re;
            z_im = 2*z_re*z_im + c_im;
            z_re = tmp;
            currIter++;
        }
        if(currIter == maxIter){//IN SET
          pixels[x+y*width]=color(0);
        }
        else{//blew up
          float h=sqrt(float(currIter)/maxIter); 
          pixels[x+y*width]=color(h,255,255);
        }
      } 
    }
    updatePixels();
}
