
#ifndef _FILTER_KERNEL_H_
#define _FILTER_KERNEL_H_

__global__ void SobelFilter(unsigned char* g_DataIn, unsigned char* g_DataOut, int width, int height)
{
   __shared__ unsigned char sharedMem[BLOCK_HEIGHT * BLOCK_WIDTH];

   int x = blockIdx.x * TILE_WIDTH + threadIdx.x ;//- FILTER_RADIUS;
   int y = blockIdx.y * TILE_HEIGHT + threadIdx.y ;//- FILTER_RADIUS;


   int index = y * (width) + x;

   // STUDENT:  Check 1


   if (x >= width || y >= height)
      return;

   // STUDENT: Check 2

   if( x < FILTER_RADIUS || y < FILTER_RADIUS) {
       g_DataOut[index] = g_DataIn[index];
       return;
    }

   if ((x > width - FILTER_RADIUS - 1)&&(x <width)) {
       g_DataOut[index] = g_DataIn[index];
       return;
    }

    if ((y > height - FILTER_RADIUS - 1)&&(y < height)) {
       g_DataOut[index] = g_DataIn[index];
       return;
    }


   int sharedIndex = threadIdx.y * blockDim.y + threadIdx.x;
   sharedMem[sharedIndex] = g_DataIn[index];
   __syncthreads();


   //STUDENT: Make sure only the thread ids should write the sum of the neighbors.
   const float SobelMatrix[9] = {-1,0,1,-2,0,2,-1,0,1};
   float sumX = 0, sumY=0;

   // Adding the code that performs Sobel filter operation
   
   float pixelIndex = 0.0;
   for(int destY = -FILTER_RADIUS; destY <= FILTER_RADIUS; destY++) {
      for(int destX = -FILTER_RADIUS; destX <= FILTER_RADIUS; destX++) {
             pixelIndex = (float)(g_DataIn[y*width + x +  (destY * width + destX)]);
             sumX += pixelIndex * SobelMatrix[(destY + FILTER_RADIUS) * FILTER_DIAMETER + (destX+FILTER_RADIUS)];
             sumY += pixelIndex * SobelMatrix[(destX + FILTER_RADIUS) * FILTER_DIAMETER + (destY+FILTER_RADIUS)];
	}
   }

   // computing the g_DataOut
   g_DataOut[index] = abs(sumX) + abs(sumY) > EDGE_VALUE_THRESHOLD ? 255 : 0;
}

__global__ void AverageFilter(unsigned char* g_DataIn, unsigned char* g_DataOut, int width, int height)
{
    __shared__ unsigned char sharedMem[BLOCK_HEIGHT*BLOCK_WIDTH];

   int x = blockIdx.x * TILE_WIDTH + threadIdx.x ;//- FILTER_RADIUS;
   int y = blockIdx.y * TILE_HEIGHT + threadIdx.y ;//- FILTER_RADIUS;

   // Get the Global index into the original image
          int index = y * (width) + x;
	  
	  const float SobelMatrix[9] = {1,1,1,1,1,1,1,1,1};
          float sumX = 0;

 if (x >= width || y >= height)
      return;

   // STUDENT: Check 2
   // Handle the border cases of the global image
   if( x < FILTER_RADIUS || y < FILTER_RADIUS) {
       g_DataOut[index] = g_DataIn[index];
       return;
   }

   if ((x > width - FILTER_RADIUS - 1)&&(x <width)) {
       g_DataOut[index] = g_DataIn[index];
       return;
   }

   if ((y > height - FILTER_RADIUS - 1)&&(y < height)) {
       g_DataOut[index] = g_DataIn[index];
       return;
   }

               
    // STUDENT: write code for Average Filter : use Sobel as base code
    for(int dy = -FILTER_RADIUS; dy <= FILTER_RADIUS; dy++) {
        for(int dx = -FILTER_RADIUS; dx <= FILTER_RADIUS; dx++) {
             float Pixel = (float)(g_DataIn[y*width + x +  (dy * width + dx)]);
             sumX += Pixel * SobelMatrix[(dy + FILTER_RADIUS) * FILTER_DIAMETER + (dx+FILTER_RADIUS)];
        }
    }

    g_DataOut[index] = (sumX)/FILTER_AREA ;

}



__global__ void HighBoostFilter(unsigned char* g_DataIn, unsigned char* g_DataOut, int width, int height)
{
  __shared__ unsigned char sharedMem[BLOCK_HEIGHT*BLOCK_WIDTH];

  int x = blockIdx.x * TILE_WIDTH + threadIdx.x ;//- FILTER_RADIUS;
  int y = blockIdx.y * TILE_HEIGHT + threadIdx.y ;//- FILTER_RADIUS;

  // Get the Global index into the original image
  int index = y * (width) + x;
  const float SobelMatrix[9] = {1,1,1,1,1,1,1,1,1};
  float sumX = 0, sumY = 0, Pixel = 0 ;

 if (x >= width || y >= height)
      return;

   // STUDENT: Check 2
   // Handle the border cases of the global image
   if( x < FILTER_RADIUS || y < FILTER_RADIUS) {
       g_DataOut[index] = g_DataIn[index];
       return;
    }

   if ((x > width - FILTER_RADIUS - 1)&&(x <width)) {
       g_DataOut[index] = g_DataIn[index];
       return;
    }

    if ((y > height - FILTER_RADIUS - 1)&&(y < height)) {
       g_DataOut[index] = g_DataIn[index];
       return;
    }

    int sharedIndex = threadIdx.y * blockDim.y + threadIdx.x;
    sharedMem[sharedIndex] = g_DataIn[index];
    __syncthreads();


    // STUDENT: write code for High Boost Filter : use Sobel as base code
    for(int dy = -FILTER_RADIUS; dy <= FILTER_RADIUS; dy++) {
        for(int dx = -FILTER_RADIUS; dx <= FILTER_RADIUS; dx++) {
            Pixel = (float)(g_DataIn[y*width + x +  (dy * width + dx)]);
            sumX += Pixel * SobelMatrix[(dy + FILTER_RADIUS) * FILTER_DIAMETER + (dx+FILTER_RADIUS)];
 
        }
    }

    g_DataOut[index] = CLAMP_8bit((int)(Pixel + HIGH_BOOST_FACTOR * (unsigned char)(Pixel - sumX / FILTER_AREA)));

}


#endif // _FILTER_KERNEL_H_


