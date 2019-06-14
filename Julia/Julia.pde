float a=0;
float b = .1;
float l=1.5;
float w=1.5;
void setup() {
size(1000,840);  
colorMode(HSB,1);
//background(0);
}
void draw() {
    loadPixels();

  int maxIter=100;
  int esc=4;
 a=a-.1;
 //b=b+1;
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      float z_re = map(x,0,width,-w,w);
      float z_im = map(y,0,height,-l,l);
      int currIter=0;


      float phi = (.5+sqrt(5)/2);
      float c_re=map(mouseX,0,width,-w,w);
      //cos(a)*exp(b*a);
      //map(mouseX,0,width,-1.75,1.75);
      float c_im=map(mouseY,0,height,-l,l);
      //sin(a)*exp(b*a);
      //map(mouseY,0,height,-1.25,1.25);
     //cos(a*1.1);cos(a*.1);
      
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
        float h=sqrt(float(currIter)/maxIter);
         
         pixels[x+y*width]=color(h,255,255);
      }
    
    }
  }
//

  updatePixels();
}
