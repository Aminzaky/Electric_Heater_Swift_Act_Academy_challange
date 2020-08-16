# 1 "EX_E2PROM.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "EX_E2PROM.c" 2








# 1 "./Utils.h" 1
# 9 "EX_E2PROM.c" 2

# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 10 "EX_E2PROM.c" 2

# 1 "./I2C.h" 1
# 21 "./I2C.h"
void I2C_Master_Init(void);





void I2C_Master_Start(void);





void I2C_Master_RepeatedStart(void);





void I2C_Master_Wait(void);





uint8 I2C_Master_Write(uint8 data);





void I2C_Master_Stop(void);





uint8 I2C_Master_Read(void);





void I2C_Ack(void);





void I2C_Nack(void);
# 11 "EX_E2PROM.c" 2

# 1 "./EX_E2PROM.h" 1
# 25 "./EX_E2PROM.h"
void EEPROM_Write(uint8 address, uint8 data);





uint8 EEPROM_Read(uint8 address);
# 12 "EX_E2PROM.c" 2



void EEPROM_Write(uint8 address, uint8 data) {
    I2C_Master_Start();
    while (I2C_Master_Write(0xA0)) {
        I2C_Master_RepeatedStart();
    }
    I2C_Master_Write(address);
    I2C_Master_Write(data);
    I2C_Master_Stop();
}


uint8 EEPROM_Read(uint8 address) {
    uint8 Data;
    I2C_Master_Start();
    while (I2C_Master_Write(0xA0)) {
        I2C_Master_RepeatedStart();
    }
    I2C_Master_Write(address);
    I2C_Master_Start();
    I2C_Master_Write(0xA1);
    Data = I2C_Master_Read();
    I2C_Nack();
    I2C_Master_Stop();
    return Data;
}
