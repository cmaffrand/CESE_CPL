#include "xparameters.h"
#include "xil_io.h"
#include "sum_ip.h"
 

//====================================================

int main (void) {

	int res;
	int opA = 1256;
	int opB = 800;

    xil_printf("-- Inicio del programa para validar el uso de IP cores propios --\r\n");
 
    SUM_IP_mWriteReg(XPAR_SUM_IP_S_AXI_BASEADDR, SUM_IP_S_AXI_SLV_REG0_OFFSET, opA);
    SUM_IP_mWriteReg(XPAR_SUM_IP_S_AXI_BASEADDR, SUM_IP_S_AXI_SLV_REG1_OFFSET, opB);
    res = SUM_IP_mReadReg(XPAR_SUM_IP_S_AXI_BASEADDR, SUM_IP_S_AXI_SLV_REG2_OFFSET);

    xil_printf("Cuenta: %d + %d = %d\r\n", opA, opB, res);

 
}
 
