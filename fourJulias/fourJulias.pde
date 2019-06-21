float mouse=0;
int ss = 700;
int half = ss/2;
void setup() { 
  size(700,700);  
  pixelDensity(1);
  colorMode(HSB,1);
}
void draw() {
  loadPixels();
  float w=1.5;
  float l=1.5;
  int maxIter=70;
  int esc=4;
  for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
          int currIter=0;
          float za,zb=0;
          int lefta,leftb,righta,rightb=0;
          //q2
          if(x<half && y<half){
              lefta=leftb = 0;
              righta =rightb=half;
          }
          //q1
          else if (x>=half && y<half){
            lefta=half;
            righta =ss;
            leftb = 0;
            rightb=half;
          }
          //q3
          else if(x<half && y>=half){
            lefta=0;
            righta =half;
            leftb = half;
            rightb=ss;
          }
          
          else if(x>=half && y>=half){
            lefta=leftb = half;
            righta =rightb=ss;
          }
          
          else{
            lefta=leftb = 0; 
            righta =rightb=0;
          }
              za = map(x,lefta,righta,-w,w);
              zb = map(y,leftb,rightb,-l,l);
              float ca=  map(mouseX,0,width,-w,w);
              float cb= map(mouseY,0,height,-l,l);
              float tmp = 0;
              while(currIter < maxIter  &&    za*za+zb*zb <= esc){

                        if(x<half && y<half){
                            tmp = za*za-zb*zb+ca;
                            zb = 2*za*zb + cb;
                        }
                        
                        else if (x>=half && y<half){
                         tmp = za*za*za - za*zb*zb-2*za*zb*zb + ca;//3rd
                          zb = 2*za*za*zb +za*za*zb-zb*zb*zb + cb;//3rd
                        }
          
                        else if(x<half && y>=half){
                         tmp = za*za*za*za + zb*zb*zb*zb - 6*za*za*zb*zb + ca;//4th
                         zb = 4*za*za*za*zb - 4*za*zb*zb*zb + cb;//4th
                        }
                        
                        else if(x>=half && y>=half){
                          tmp = za*za*za*za*za - 10*za*za*za*zb*zb + 5*za*zb*zb*zb*zb + ca;
                          zb = 5*za*za*za*za*zb - 10*za*za*zb*zb*zb + zb*zb*zb*zb*zb + cb;
                        }
                        else{
                          tmp = 0;
                          zb = 0;
                        }
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
    updatePixels();
    stroke(.2,10);
    line(350, 0, 350, 700);
    line(0, 350, 700, 350);
}
void mouseClicked() {
  if (mouse == 0) mouse = 1;
  else mouse = 0;
}
  
  
