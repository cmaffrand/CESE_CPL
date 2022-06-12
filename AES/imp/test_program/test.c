#include "xparameters.h"
#include "xil_printf.h"
#include "xil_types.h"
#include "xstatus.h"
#include "axi_aes_encoder.h"
#include "axi_aes_decoder.h"
#include "xil_io.h"
#include <stdio.h>
#include "test.h"

//====================================================

int main(void)
{
  XStatus enc_status, dec_status;
  u32 key_127_96, key_95_64, key_63_32, key_31_0;
  u32 encoder_input_127_96, encoder_input_95_64, encoder_input_63_32, encoder_input_31_0;
  u32 encoded_127_96, encoded_95_64, encoded_63_32, encoded_31_0;
  u32 decoded_127_96, decoded_95_64, decoded_63_32, decoded_31_0;
  int i = 0;
  u32 TEST_DATA[] = {INPUT_DATA_0_127_96, INPUT_DATA_0_95_64, INPUT_DATA_0_63_32, INPUT_DATA_0_31_0,INPUT_KEY_0_127_96, INPUT_KEY_0_95_64, INPUT_KEY_0_63_32, INPUT_KEY_0_31_0,OUTPUT_DATA_0_127_96, OUTPUT_DATA_0_95_64, OUTPUT_DATA_0_63_32, OUTPUT_DATA_0_31_0,INPUT_DATA_1_127_96, INPUT_DATA_1_95_64, INPUT_DATA_1_63_32, INPUT_DATA_1_31_0,INPUT_KEY_1_127_96, INPUT_KEY_1_95_64, INPUT_KEY_1_63_32, INPUT_KEY_1_31_0,OUTPUT_DATA_1_127_96, OUTPUT_DATA_1_95_64, OUTPUT_DATA_1_63_32, OUTPUT_DATA_1_31_0,INPUT_DATA_2_127_96, INPUT_DATA_2_95_64, INPUT_DATA_2_63_32, INPUT_DATA_2_31_0,INPUT_KEY_2_127_96, INPUT_KEY_2_95_64, INPUT_KEY_2_63_32, INPUT_KEY_2_31_0,OUTPUT_DATA_2_127_96, OUTPUT_DATA_2_95_64, OUTPUT_DATA_2_63_32, OUTPUT_DATA_2_31_0,INPUT_DATA_3_127_96, INPUT_DATA_3_95_64, INPUT_DATA_3_63_32, INPUT_DATA_3_31_0,INPUT_KEY_3_127_96, INPUT_KEY_3_95_64, INPUT_KEY_3_63_32, INPUT_KEY_3_31_0,OUTPUT_DATA_3_127_96, OUTPUT_DATA_3_95_64, OUTPUT_DATA_3_63_32, OUTPUT_DATA_3_31_0,INPUT_DATA_4_127_96, INPUT_DATA_4_95_64, INPUT_DATA_4_63_32, INPUT_DATA_4_31_0,INPUT_KEY_4_127_96, INPUT_KEY_4_95_64, INPUT_KEY_4_63_32, INPUT_KEY_4_31_0,OUTPUT_DATA_4_127_96, OUTPUT_DATA_4_95_64, OUTPUT_DATA_4_63_32, OUTPUT_DATA_4_31_0,INPUT_DATA_5_127_96, INPUT_DATA_5_95_64, INPUT_DATA_5_63_32, INPUT_DATA_5_31_0,INPUT_KEY_5_127_96, INPUT_KEY_5_95_64, INPUT_KEY_5_63_32, INPUT_KEY_5_31_0,OUTPUT_DATA_5_127_96, OUTPUT_DATA_5_95_64, OUTPUT_DATA_5_63_32, OUTPUT_DATA_5_31_0,INPUT_DATA_6_127_96, INPUT_DATA_6_95_64, INPUT_DATA_6_63_32, INPUT_DATA_6_31_0,INPUT_KEY_6_127_96, INPUT_KEY_6_95_64, INPUT_KEY_6_63_32, INPUT_KEY_6_31_0,OUTPUT_DATA_6_127_96, OUTPUT_DATA_6_95_64, OUTPUT_DATA_6_63_32, OUTPUT_DATA_6_31_0};


  xil_printf("-- Start of the Program --\r\n");

  xil_printf("-- Start Encoder Selftest --\r\n");
  enc_status = AXI_AES_ENCODER_Reg_SelfTest(ENCODER_BASE);
  xil_printf("-- Encoder Selftest Finished --\r\n");

  xil_printf("-- Start Decoder Selftest --\r\n");
  dec_status = AXI_AES_DECODER_Reg_SelfTest(DECODER_BASE);
  xil_printf("-- Finish Decoder Selftest --\r\n");

  while (1)
  { 
    if (i == 0)
    {
      xil_printf("-- Encoder/Decoder Test Start --\r\n");
    }
    else if (i == 7)
    {
      xil_printf("-- Encoder/Decoder Test Ended Succesfully --\r\n");
      return 0;
    }
    encoder_input_127_96  = TEST_DATA[i*12+0];
    encoder_input_95_64   = TEST_DATA[i*12+1];
    encoder_input_63_32   = TEST_DATA[i*12+2];
    encoder_input_31_0    = TEST_DATA[i*12+3];
    key_127_96            = TEST_DATA[i*12+4];
    key_95_64             = TEST_DATA[i*12+5];
    key_63_32             = TEST_DATA[i*12+6];
    key_31_0              = TEST_DATA[i*12+7];

    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_READY_REG, 0);
    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_KEY_127_96_REG, key_127_96);
    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_KEY_95_64_REG, key_95_64);
    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_KEY_63_32_REG, key_63_32);
    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_KEY_31_0_REG, key_31_0);
    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_INPUT_127_96_REG, encoder_input_127_96);
    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_INPUT_95_64_REG, encoder_input_95_64);
    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_INPUT_63_32_REG, encoder_input_63_32);
    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_INPUT_31_0_REG, encoder_input_31_0);
    xil_printf("-- Encoder Configured --\r\n");
    xil_printf("-- Key = %08X%08X%08X%08X --\r\n", key_127_96, key_95_64, key_63_32, key_31_0);
    xil_printf("-- Input = %08X%08X%08X%08X --\r\n", encoder_input_127_96, encoder_input_95_64, encoder_input_63_32, encoder_input_31_0);
    AXI_AES_ENCODER_mWriteReg(ENCODER_BASE, ENCODER_READY_REG, 1);

    while (!AXI_AES_ENCODER_mReadReg(ENCODER_BASE, ENCODER_VALID_REG))
      ;
    encoded_127_96 = AXI_AES_ENCODER_mReadReg(ENCODER_BASE, ENCODER_OUTPUT_127_96_REG);
    encoded_95_64 = AXI_AES_ENCODER_mReadReg(ENCODER_BASE, ENCODER_OUTPUT_95_64_REG);
    encoded_63_32 = AXI_AES_ENCODER_mReadReg(ENCODER_BASE, ENCODER_OUTPUT_63_32_REG);
    encoded_31_0 = AXI_AES_ENCODER_mReadReg(ENCODER_BASE, ENCODER_OUTPUT_31_0_REG);

    xil_printf("-- Encoded = %08X%08X%08X%08X --\r\n", encoded_127_96, encoded_95_64, encoded_63_32, encoded_31_0);

    if (encoded_127_96 != TEST_DATA[i*12+8] || encoded_95_64 != TEST_DATA[i*12+9] || encoded_63_32 != TEST_DATA[i*12+10] || encoded_31_0 != TEST_DATA[i*12+11])
    {
      xil_printf("-- Encoder Test %d Failed --\r\n",i);
      return -1;
    }
    else
      xil_printf("-- Encoder Test %d Passed --\r\n",i);

    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_READY_REG, 0);
    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_KEY_127_96_REG, key_127_96);
    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_KEY_95_64_REG, key_95_64);
    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_KEY_63_32_REG, key_63_32);
    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_KEY_31_0_REG, key_31_0);
    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_INPUT_127_96_REG, encoded_127_96);
    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_INPUT_95_64_REG, encoded_95_64);
    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_INPUT_63_32_REG, encoded_63_32);
    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_INPUT_31_0_REG, encoded_31_0);
    xil_printf("-- Decoder Configured --\r\n");
    xil_printf("-- Key = %08X%08X%08X%08X --\r\n", key_127_96, key_95_64, key_63_32, key_31_0);
    xil_printf("-- Input = %08X%08X%08X%08X --\r\n", encoded_127_96, encoded_95_64, encoded_63_32, encoded_31_0);
    AXI_AES_DECODER_mWriteReg(DECODER_BASE, DECODER_READY_REG, 1);

    while (!AXI_AES_DECODER_mReadReg(DECODER_BASE, DECODER_VALID_REG))
      ;
    decoded_127_96 = AXI_AES_DECODER_mReadReg(DECODER_BASE, DECODER_OUTPUT_127_96_REG);
    decoded_95_64 = AXI_AES_DECODER_mReadReg(DECODER_BASE, DECODER_OUTPUT_95_64_REG);
    decoded_63_32 = AXI_AES_DECODER_mReadReg(DECODER_BASE, DECODER_OUTPUT_63_32_REG);
    decoded_31_0 = AXI_AES_DECODER_mReadReg(DECODER_BASE, DECODER_OUTPUT_31_0_REG);

    xil_printf("-- Decoded = %08X%08X%08X%08X --\r\n", decoded_127_96, decoded_95_64, decoded_63_32, decoded_31_0);

    if (decoded_127_96 != TEST_DATA[i*12] || decoded_95_64 != TEST_DATA[i*12+1] || decoded_63_32 != TEST_DATA[i*12+2] || decoded_31_0 != TEST_DATA[i*12+3])
    {
      xil_printf("-- Decoder Test %d Failed --\r\n",i);
      return -1;
    }
    else
      xil_printf("-- Decoder Test %d Passed --\r\n",i);

    i++;
  }
}
