#include "xparameters.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_types.h"

#define SW_CHANNEL 1
#define BTN_CHANNEL 2
#define LED_CHANNEL 1

//====================================================

int main (void)
{
	XGpio_Config *cfg_ptr;
    XGpio dip, led;
	int dip_check, psb_check;
	u32 count;

    xil_printf("-- Start of the Program --\r\n");

    XGpio_Initialize(&dip, XPAR_AXI_GPIO_0_BASEADDR);
	XGpio_SetDataDirection(&dip, SW_CHANNEL, 0xffffffff);
	XGpio_SetDataDirection(&dip, BTN_CHANNEL, 0xffffffff);

	cfg_ptr = XGpio_LookupConfig(XPAR_AXI_GPIO_1_BASEADDR);
	XGpio_CfgInitialize(&led, cfg_ptr, cfg_ptr->BaseAddress);
	XGpio_SetDataDirection(&led, LED_CHANNEL, 0);

	count = 32;

	while (1)
	{

	  dip_check = XGpio_DiscreteRead(&dip, SW_CHANNEL);
	  xil_printf("DIP Switch Status %x\r", dip_check);

	  psb_check = XGpio_DiscreteRead(&dip, BTN_CHANNEL);
	  xil_printf("Buttons Status %x\r", psb_check);

	  XGpio_DiscreteWrite(&led, LED_CHANNEL, count);
	  xil_printf("Output to Leds %x\r", count);
	  count = XGpio_DiscreteRead(&led, LED_CHANNEL) + 1;

	  sleep(2);
	}

}