# AES IP

This IP provides a VHDL development for an AES Encryptor/Decryptor.

## Description

This IP Core is developed following the NIST.FIPS.197 standard and tested using the vectors test provided on it.

## Architecture

Encrypter and Decrypter are developed using the architecture provided in the AES standard.

## AES Encrypt IP Architecture

![alt text](https://github.com/cmaffrand/CESE_CPL/blob/main/AES/docs/img/aes_enc_arch.png)

## AES Decrypt IP Architecture

![alt text](https://github.com/cmaffrand/CESE_CPL/blob/main/AES/docs/img/aes_dec_arch.png)

## Testing

### AES Encryption Test

* Test Vectors Used:

  Data input signals:

  x"6a84867cd77e12ad07ea1be895c53fa3"
  x"6bc1bee22e409f96e93d7e117393172a"  
  x"ae2d8a571e03ac9c9eb76fac45af8e51"  
  x"30c81c46a35ce411e5fbc1191a0a52ef"  
  x"f69f2445df4f9b17ad2b417be66c3710"  
  x"00112233445566778899aabbccddeeff"  
  x"00000000000000000000000000000000"

  Key input signals:

  x"00000000000000000000000000000000"
  x"2b7e151628aed2a6abf7158809cf4f3c"
  x"2b7e151628aed2a6abf7158809cf4f3c"
  x"2b7e151628aed2a6abf7158809cf4f3c"
  x"2b7e151628aed2a6abf7158809cf4f3c"
  x"000102030405060708090a0b0c0d0e0f"
  x"febd9a24d8b65c1c787d50a4ed3619a9"

  Cypher output signals:

  x"732281c0a0aab8f7a54a0c67a0c45ecf"
  x"3ad77bb40d7a3660a89ecaf32466ef97"
  x"f5d3d58503b9699de785895a96fdbaaf"
  x"43b1cd7f598ece23881b00e3ed030688"
  x"7b0c785e27e8ad3f8223207104725dd4"
  x"69c4e0d86a7b0430d8cdb78070b4c55a"
  x"f4a70d8af877f9b02b4c40df57d45b17"
  
AES Encryption Test Capture:

![alt text](https://github.com/cmaffrand/CESE_CPL/blob/main/AES/docs/img/aes_enc_capture.png)

### AES Decryption Test

Test Vectors Used:

  Data input signals:

  x"732281c0a0aab8f7a54a0c67a0c45ecf"
  x"3ad77bb40d7a3660a89ecaf32466ef97"
  x"f5d3d58503b9699de785895a96fdbaaf"
  x"43b1cd7f598ece23881b00e3ed030688"
  x"7b0c785e27e8ad3f8223207104725dd4"
  x"69c4e0d86a7b0430d8cdb78070b4c55a"
  x"f4a70d8af877f9b02b4c40df57d45b17"

  Key input signals:

  x"00000000000000000000000000000000"
  x"2b7e151628aed2a6abf7158809cf4f3c"
  x"2b7e151628aed2a6abf7158809cf4f3c"
  x"2b7e151628aed2a6abf7158809cf4f3c"
  x"2b7e151628aed2a6abf7158809cf4f3c"
  x"000102030405060708090a0b0c0d0e0f"
  x"febd9a24d8b65c1c787d50a4ed3619a9"

  Cypher output signals:

  x"6a84867cd77e12ad07ea1be895c53fa3"
  x"6bc1bee22e409f96e93d7e117393172a"  
  x"ae2d8a571e03ac9c9eb76fac45af8e51"  
  x"30c81c46a35ce411e5fbc1191a0a52ef"  
  x"f69f2445df4f9b17ad2b417be66c3710"  
  x"00112233445566778899aabbccddeeff"  
  x"00000000000000000000000000000000"

AES Decryption Test Capture:

![alt text](https://github.com/cmaffrand/CESE_CPL/blob/main/AES/docs/img/aes_dec_capture.png)

## Dependencies

The IP is coded in VHDL using the following libraries.

* library ieee;
* use ieee.std_logic_1164.all;
* use ieee.numeric_std.all;

The IP was tested using:

* [GHDL](https://github.com/ghdl/ghdlhttps://github.com/ghdl/ghdl)
* [GTKWave](https://github.com/gtkwave/gtkwave)

The IP was implemented on ZedBoard using:

* [Vivado 2018.3](https://www.xilinx.com/support/installer/installer-info-2018-3.html)

## Usage

* Folder src contains AES VHDL code
* Folder docs contain information used in development.
* Folder constraint contains the implementation on the Board file.
* Folder imp contains the implementation HDL files for ZedBoard.
* Folder sim contains VHDL testbenchs for the IP and GHDL and GTKWave scripts.

## Authors

Contributor's names and contact info:

Eng. Carlos Maffrand  [@cmaffrand](https://www.linkedin.com/in/carlos-maffrand-3ab3b340/)

## Version History

* 0.1
    * Initial Release

## Roadmap

- [x] AES Encrypter chypher
- [x] AES Decrypter chypher
- [x] FPGA Implementation
- - [x] ZedBoard (ILA and VIO)
- [ ] AES Key width
- - [x] 128 Bits
- - [ ] 192 Bits
- - [ ] 256 Bits
- [ ] AES Modes
- - [x] ECB
- - [ ] CBC
- - [ ] CFB
- - [ ] OFB
- - [ ] CTR

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.