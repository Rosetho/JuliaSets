float s=1.2;
int max=70;
int part=1;
int i=0;
int j=0;

void setup(){ 
  size(800,800);  
  pixelDensity(1);
  colorMode(HSB,1);
}

void mouseWheel(MouseEvent event) {
  if (part<75) part=part+1;
}

void mouseDragged() 
{
  if(part==0){
    part=1;
  }
  part=part-1;
}

int Julia_f(int x, int y){
  int iter=0;
  float pull=s/part;

  float za = map(x,j*width/part,(j+1)*width/part,-s,s);
  float zb = map(y,i*height/part,(i+1)*height/part,-s,s);
  float ca=  map(mouseX,j*width/part,(j+1)*width/part,-pull,pull);
  float cb= map(mouseY,i*height/part,(i+1)*height/part,-pull,pull);
  while(iter < max &&    za*za+zb*zb <= 4){
    float tmp = za*za-zb*zb + ca;
    zb = 2*za*zb + cb;  
    za = tmp;
    iter++;
  }
  if(iter == max) return max;
  else return iter;
}

void draw() {
  //part=part+1;
  if(part==0){
    part=1;
  }
  loadPixels();
  i=0;
  j=0;
  while(i<part){
    while(j<part){
      for(int y = i*height/part; y < (i+1)*height/part; y++){
          for(int x = j*width/part; x < (j+1)*width/part; x++){
               if(Julia_f(x,y) == max)   pixels[x+y*width]=color(0);
               else                      pixels[x+y*width]=color(float(Julia_f(x,y))/max,255,255);
          }
      }
      j++;
    }
    j=0;i++;
  }
    updatePixels();
    text(part,10,15);
}


  
