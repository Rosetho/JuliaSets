int mouse = 0;
int maxIter=65;
float l=1.5;
float w=1.5;
void mouseClicked() {
  if (mouse == 0) mouse = 1;
  else mouse = 0;
}
int Julia_f(int x, int y){
  int iter=0;
  float za = map(x,0,width,-w,w);
  float zb = map(y,0,height,-l,l);
  float ca=  map(mouseX,0,width,-w,w);
  float cb= map(mouseY,0,height,-l,l);
  while(iter < maxIter &&    za*za+zb*zb <= 4){
    float tmp = za*za-zb*zb+ca;
    zb = 2*za*zb + cb;
    za = tmp;
    iter++;
  }
  if(iter == maxIter) return maxIter;
  else return iter;
}
void setup() {
    size(1000,700);  
    colorMode(HSB,1);
} //<>//
void draw() {
    loadPixels();
    int esc=4;
    for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
        if(Julia_f(x,y) == maxIter){//IN SET
          if(mouse==0){
            pixels[x+y*width]=color(0);
          }
        }
        else{//blew up
          float h=float(Julia_f(x,y))/maxIter; 
          pixels[x+y*width]=color(h,255,255);
        }
      } 
    }
    updatePixels();
}
