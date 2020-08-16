# 1 "I2C.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "I2C.c" 2








# 1 "./Utils.h" 1
# 9 "I2C.c" 2

# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 10 "I2C.c" 2

# 1 "./DIO_local.h" 1
# 11 "I2C.c" 2

# 1 "./I2C_local.h" 1
# 12 "I2C.c" 2

# 1 "./I2C_config.h" 1
# 13 "I2C.c" 2

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
# 14 "I2C.c" 2



void I2C_Master_Init(void) {


    ((*((uint8*)(0x87))) |= (1 << (3)));
    ((*((uint8*)(0x87))) |= (1 << (4)));

    ((*((uint8*)(0x94))) |= (1 << (7)));

    ((*((uint8*)(0x14))) |= (1 << (5)));
    ((*((uint8*)(0x14))) |= (1 << (3)));
    (*((uint8*)(0x14)) &= ~(1 << 2));
    (*((uint8*)(0x14)) &= ~(1 << 1));
    (*((uint8*)(0x14)) &= ~(1 << 0));
    (*((uint8*)(0x91))&=0x00);

    (*((uint8*)(0x93))=((((8 * 1000000) / (4 * 100000)) - 1) | (*((uint8*)(0x93))&0x00)));

}


void I2C_Master_Start(void) {

    I2C_Master_Wait();

    ((*((uint8*)(0x91))) |= (1 << (0)));
}


void I2C_Master_RepeatedStart() {
    I2C_Master_Wait();

    ((*((uint8*)(0x91))) |= (1 << (1)));
}


void I2C_Master_Wait(void) {


    while (((*((uint8*)(0x94)) >> 2) & (1)) || ((*((uint8*)(0x91)) >> 0) & (1)) || ((*((uint8*)(0x91)) >> 1) & (1)) || ((*((uint8*)(0x91)) >> 2) & (1)) || ((*((uint8*)(0x91)) >> 3) & (1)) || ((*((uint8*)(0x91)) >> 4) & (1)));
}


uint8 I2C_Master_Write(uint8 data) {

    I2C_Master_Wait();

    (*((uint8*)(0x13))=((data) | (*((uint8*)(0x13))&0x00)));
    while (((*((uint8*)(0x0C)) >> 3) & (1)) == 0);
    (*((uint8*)(0x0C)) &= ~(1 << 3));

    return (((*((uint8*)(0x91)) >> 6) & (1)));
}


void I2C_Master_Stop() {

    I2C_Master_Wait();

    ((*((uint8*)(0x91))) |= (1 << (2)));


}


uint8 I2C_Master_Read(void) {

    int buffer = 0;
    I2C_Master_Wait();

    ((*((uint8*)(0x91))) |= (1 << (3)));

    while (((*((uint8*)(0x0C)) >> 3) & (1)) == 0);
    (*((uint8*)(0x0C)) &= ~(1 << 3));

    I2C_Master_Wait();

    buffer = (*((uint8*)(0x13))&0xFF);

    return (buffer);
}


void I2C_Ack(void) {


    (*((uint8*)(0x91)) &= ~(1 << 5));
    I2C_Master_Wait();

    ((*((uint8*)(0x91))) |= (1 << (4)));


}


void I2C_Nack(void) {

    ((*((uint8*)(0x91))) |= (1 << (5)));
    I2C_Master_Wait();

    ((*((uint8*)(0x91))) |= (1 << (4)));

}
