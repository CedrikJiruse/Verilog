#include <msp430.h> 

#define WDTHOLD (0x0080)
#define WDTPW (0x5A00)

int main(void)
{
    volatile unsigned delayCount;

	WDTCTL = WDTPW + WDTHOLD;	// stop watchdog timer

	P1DIR |= 0x41; // P1.0, P1.6 = OUTPUT

	P2DIR |= 0xFF; // P2 = OUTPUT
	P2OUT &= ~0xFF; // P2 = clear

	P1OUT &= ~0x41; // P1.0, P1.6 = clear
	while (1) {
        P1OUT |= 0x40; // P1.6 = toggle
        for (delayCount = 0; delayCount < 50000; delayCount++) {
        }
        P1OUT &= ~0x40; // P1.6 = toggle

        P1OUT |= 0x01; // P1.0 = toggle
        for (delayCount = 0; delayCount < 50000; delayCount++) {
        }
        P1OUT &= ~0x01; // P1.0 = toggle
	}
}
