#include <stdio.h>

// define bits
#define BIT0 0x01
#define BIT1 0x02
#define BIT2 0x04
#define BIT3 0x08
#define BIT4 0x10
#define BIT5 0x20
#define BIT6 0x40
#define BIT7 0x80

int main(void) {
  // declare variables
  unsigned char val, temp;
  char digit;

  printf("\nEnter 8-bit Number:\t");

  // input 8-bit binary number into val
  for (unsigned char i = 0x80; i != 0x00; i >>= 1) {
    scanf("%c", &digit);

    if (digit == '1') {
      val |= i;
    }
  }


  // Operation A
  // Clear bits 1 and 6

  temp = val;

  // clear bits
  temp &= ~(BIT1 + BIT6);

  // print temp after Op.A
  printf("\nOp.A 'Clear BIT1 and BIT6' = \t\t\t");
  for (unsigned char i = 0x80; i != 0x00; i >>= 1) {
    if (temp & i) {
      printf("1");
    }
    else {
      printf("0");
    }
  }


  // Operation B
  // Test if BIT2 is clear and BIT4 is set

  temp = val;

  // testing bits
  // if true then BIT is set, if false then BIT is clear

  // print temp after Op.B
  printf("\nOp.B 'Test if BIT2 is clear, BIT4 is set' = \t");
  for (unsigned char i = 0x80; i != 0x00; i >>= 1) {
    if (temp & i) {
      printf("1");
    }
    else {
      printf("0");
    }
  }

  if (temp & BIT2) {
    printf("\n\tBIT2 is not clear\n");
  }
  else {
    printf("\n\tBIT2 is clear\n");
  }

  if (temp & BIT4) {
    printf("\tBIT4 is set\n");
  }
  else {
    printf("\tBIT4 is not set\n");
  }

  // Operation C
  // Find the lowest bit that is set

  temp = val;

  // for loop, from right to left, to find lowest set bit
  // lowestBitSet stores the lowest set bit
  int lowestBitSet, bitSet;
  unsigned char i;
  for (lowestBitSet = -1, bitSet = 0, i = 0x01; (bitSet == 0) && (lowestBitSet <= 7); i <<= 1, lowestBitSet++) {
    if (temp & i) {
      bitSet = 1;
    }
  }

  // print temp after Op.C
  printf("Op.C 'Find lowest bit that is set' = \t\t");
  for (unsigned char i = 0x80; i != 0x00; i >>= 1) {
    if (temp & i) {
      printf("1");
    }
    else {
      printf("0");
    }
  }

  // print the lowest set bit
  if (lowestBitSet <= 7) {
    printf("\n\tLowest Set Bit = BIT%d\n\n", lowestBitSet);
  }
  else {
    printf("\n\tAll bits clear\n\n");
  }
}