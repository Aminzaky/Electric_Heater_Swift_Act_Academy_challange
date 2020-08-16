# 1 "DO.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "DO.c" 2








# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 9 "DO.c" 2

# 1 "./Utils.h" 1
# 10 "DO.c" 2

# 1 "./DIO.h" 1
# 78 "./DIO.h"
void DIO_voidInitPort(uint8 Port, uint8 Dir);






void DIO_voidWritePortValue(uint8 Port, uint8 value);





uint8 DIO_U8ReadPortValue(uint8 Port);







void DIO_voidInitPin(uint8 pin_num, uint8 Dir);






void DIO_voidWritePinValue(uint8 pin_num, uint8 value);





uint8 DIO_U8ReadPinValue(uint8 pin_num);
# 11 "DO.c" 2

# 1 "./DO.h" 1
# 28 "./DO.h"
void DO_Init(void);






void DO_SetState(uint8 device ,uint8 state);
# 12 "DO.c" 2

# 1 "./DIO_local.h" 1
# 13 "DO.c" 2



void DO_Init(void) {
    DIO_voidInitPin(11, 0);
    DIO_voidInitPin(21, 0);
    DIO_voidInitPin(18, 0);
    (*((uint8*)(0x86))&=0x0F);
}


void DO_SetState(uint8 device, uint8 state) {
    DIO_voidWritePinValue(device, state);
}
