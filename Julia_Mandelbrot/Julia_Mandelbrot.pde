int mouse = 0;
void setup() {
  size(1500,750);  
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
          float za,zb,ca,cb=0;
          // mandelbrot
          if(x>=height){
              ca = map(x,width/2,width,-w,w);
              cb = map(y,0,height,-l,l);
              za= 0;
              zb=0;
              float tmp = 0;
              while(currIter < maxIter  &&    za*za+zb*zb <= esc){
                    tmp = za*za-zb*zb+ca;
                    zb = 2*za*zb + cb;  
                    za = tmp;
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
          //julia
          else if (x<height){
              za = map(x,0,width/2,-w,w);
              zb = map(y,0,height,-l,l);
              ca=  map(mouseX,width/2,width,-w,w);
              cb= map(mouseY,0,height,-l,l);
              float tmp = 0;
              while(currIter < maxIter  &&    za*za+zb*zb <= esc){
                    tmp = za*za-zb*zb+ca;
                    zb = 2*za*zb + cb;  
                    za = tmp;
                    currIter++;
              }  
              if(currIter == maxIter){//IN SET
              if(mouse==0){
                    pixels[x+y*width]=color(0);
              }
              }
              else{//blew up
                    float h=float(currIter)/maxIter;
                    pixels[x+y*width]=color(h,255,255);
              }
          }
      }
  }
  updatePixels();
  stroke(.2,199);
  line(height, 0, height, width);
  line(3*width/4,0,3*width/4,height);
  line(width/2,height/2,width,height/2);
}

void mouseClicked() {
  if (mouse == 0) {
    mouse = 1;
  } else {
    mouse = 0;
  }
}
