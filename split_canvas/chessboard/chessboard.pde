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
  part=part+1;
}

void mouseDragged() 
{
  if(part==0){
    part=1;
  }
  part=part-1;
}
float power(float a, float b, int i, boolean mode) {return multcomp(a,b,a,b,i,mode);}
float multcomp(float a, float b, float x, float y, int i, boolean mode){ //true for real, false for imaginary
   if(i==0)return 1; 
   if (i==1){
     if (mode) return x;
     else return y;
    }
    float xtmp= a*x - b*y;
    y= b*x + a*y;
    x=xtmp;
    return multcomp(a,b,x,y,i-1,mode);
}


int Julia_f(int x, int y){
  int iter=0;
  float pull=s/part;
  float idk=pull;
  float za = map(x,j*width/part,(j+1)*width/part,-pull,pull);
  float zb = map(y,i*height/part,(i+1)*height/part,-pull,pull);
  float ca=  map(mouseX,j*width/part,(j+1)*width/part,-pull,pull);
  float cb= map(mouseY,i*height/part,(i+1)*height/part,-pull,pull);
  while(iter < max &&    za*za+zb*zb <= 4){
    float tmp = power(za,zb,2,true) + ca;
    zb = power(za,zb,2,false) + cb;  
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
    //stroke(1,0);
    //lines(part);
}
void lines(int p){
  int i=1;
  while(i<p){
   line(i*width/p,0,i*width/p,height);
   line(0, i*height/p, width, i*height/p);
   i++;
  }
}

  
