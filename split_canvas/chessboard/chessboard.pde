float w=1.25;
float l=1.25;
int max=70;
int part=40;
int i=0;
int j=0;
void setup() { 
  size(800,800);  
  pixelDensity(1);
  colorMode(HSB,1);
}

int Julia_f(int x, int y){
  int iter=0;
  float za = map(x,j*width/part,(j+1)*width/part,-w,w);
  float zb = map(y,i*height/part,(i+1)*height/part,-l,l);
  float ca=  map(mouseX,j*width/part,(j+1)*width/part,-w/part,w/part);
  float cb= map(mouseY,i*height/part,(i+1)*height/part,-l/part,l/part);
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
  i=0;
  j=0;
  while(i<part){
    while(j<part){
      for(int y = i*height/part; y < (i+1)*height/part; y++){
          for(int x = j*width/part; x < (j+1)*width/part; x++){
               if(Julia_f(x,y) == max)   pixels[x+y*width]=color(0);
               else                    pixels[x+y*width]=color(float(Julia_f(x,y))/max,255,255);
          }
      }
      j++;
    }
    j=0;i++;
  }
    updatePixels();
    stroke(1,0);
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

  
