int mouse = 2;
void setup() {
  size(1500,750);  
  colorMode(HSB,1);
}

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

float power(float a, float b, int i, boolean mode) {return multcomp(a,b,a,b,i,mode);}
void draw() {
loadPixels();
  float w=1.5;
  float l=1.5;
  int maxIter=50;
  int esc=4;
  for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
          int currIter=0;
          float za,zb,ca,cb=0;
          if(x>=height){
              ca = map(x,width/2,width,-w,w);
              cb = map(y,0,height,-l,l);
              za= 0;
              zb=0;
          }
          else{
              za = map(x,0,width/2,-w,w);
              zb = map(y,0,height,-l,l);
              ca=  map(mouseX,width/2,width,-w,w);
              cb= map(mouseY,0,height,-l,l);
          }
          float tmp = 0;
              while(currIter < maxIter  &&    sqrt(za*za+zb*zb) <= esc){
                    tmp = power(za,zb,mouse,true) + ca;
                    zb = power(za,zb,mouse,false) + cb;  
                    za = tmp;
                    currIter++;
              }  
              if(currIter == maxIter){//IN SET
                    pixels[x+y*width]=color(0);
              }
              else{//blew up
                    float h=float(currIter)/maxIter;
                    h=map(currIter,0,maxIter,0,.8);
                    pixels[x+y*width]=color(h,255,255);
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
  if (mouse <5) mouse++;
  else mouse =2;
}
