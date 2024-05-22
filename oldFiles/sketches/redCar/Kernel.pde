public class Kernel {
  float[][] kernel;
  
  
  /**Constructor takes the kernel that will be applied to the image
  *This implementation only allows 3x3 kernels
  */
  public Kernel(float[][]init) {
  kernel = init;
  }

  /**If part of the kernel is off of the image, return black, Otherwise
  *Calculate the convolution of r/g/b separately, and return that color\
  *if the calculation for any of the r,g,b values is outside the range
  *     0-255, then clamp it to that range (< 0 becomes 0, >255 becomes 255)
  */
  color calcNewColor(PImage img, int x, int y) {
    int sum = 0;
    color[][] myColor = new color[3][3];
    for (int i = 0; i < 3; i++) {
      for (int n = 0; n < 3; n++) {
          myColor[i][n] = img.get(x,y);
      }
    }
    
   // int rSum = 0;
   // int gSum = 0;
   // int bSum = 0;
    
   // for (int i = 0; i < 3; i++) {
   //   for (int n = 0; n < 3; n++) {
   //       rSum += red( myColor[i][n]) * kernel[i][n];
   //       gSum += green( myColor[i][n]) * kernel[i][n];
   //       bSum += blue( myColor[i][n]) * kernel[i][n];
   //   }
   // }
    for (int i = 0; i < 3; i++) {
      for (int n = 0; n < 3; n++) {
      myColor[i][n] = myColor[i][n] * (int)kernel[i][n]; 
    }
   }
   
   for (int i = 0; i < 3; i++) {
      for (int n = 0; n < 3; n++) {
      sum += myColor[i][n];
    }
   }
   return sum;
  }


  /**Apply the kernel to the source,
  *and saves the data to the destination.*/
  void apply(PImage source, PImage destination) {
      for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
          destination.set(i,j,calcNewColor(source,i,j));
        }
      }

  }
}
