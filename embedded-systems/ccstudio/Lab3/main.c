#include <msp430.h>
//Toggles Green LED when switch is pressed. Uses debounce.

// declare functions
void initialiseSwitch(void);
unsigned char readSwitchPin(void);
void delay(int ms);
int readSwDB(void);

int main(void)
{
  unsigned char lastRead = 1; // assume switch is un-pressed at startup
  unsigned char val; // the value read

  WDTCTL = WDTPW + WDTHOLD; // Stop WDT

  P1OUT = 0x00; //
  P2OUT = 0x00; //
  P1DIR = 0xff; //
  P2DIR = 0xff; //make all pins output and set low also sets green led pin to 

  // write
  initialiseSwitch(); //set up switch for reading with pullup resistors

  while (1) {
    val = readSwitchPin(); //read switch
    if (val != lastRead) { //check if it has changed

      delay(20); //wait for 20ms
      val = readSwitchPin(); //read switch

      if (val != lastRead) { //check switch again to make sure it has really changed
        lastRead = val; //update lastRead

        if (val == 0) {// is switch down

          P1OUT ^= 0X40; //toggle Green LED i.e. 
        } //BIT6 (01000000 BIN)
      }
    }
  }
}