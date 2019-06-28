int w=2;
int l=2;
int max=70;
int part=3;
void setup() { 
  size(500,500);  
  pixelDensity(1);
  colorMode(HSB,1);
}

int Julia_f(int x, int y){
  int iter=0;
  float za = map(x,0,width/part,-w,w);
  float zb = map(y,0,height/part,-l,l);
  float ca=  map(mouseX,0,width,-w,w);
  float cb= map(mouseY,0,height,-l,l);
  while(iter < max &&    za*za+zb*zb <= 4){
    float tmp = za*za-zb*zb+ca;
    zb = 2*za*zb + cb;
    za = tmp;
    iter++;
  }
  if(iter == max) return max;
  else return iter;
}

void draw() {
  loadPixels();

  for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
         if(y<height/part && x<width/part){
           if(Julia_f(x,y)==max){
              pixels[x+y*width]=color(0);
           }
           else{ 
             pixels[x+y*width]=color(float(Julia_f(x,y))/max,255,255);
           }
         }
      }
  }
    updatePixels();
    stroke(.2,10);
    lines(part);
}

void lines(int p){
  int i=1;
 while(i<p){
   line(i*width/p,0,i*width/p,height);
   line(0, i*height/p, width, i*height/p);
   i++;
 }
  
  
}

  
