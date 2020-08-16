# 1 "TEMP.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "TEMP.c" 2








# 1 "./Utils.h" 1
# 9 "TEMP.c" 2

# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 10 "TEMP.c" 2

# 1 "./TEMP.h" 1
# 22 "./TEMP.h"
void UPDATE_TEMP(void);
# 11 "TEMP.c" 2

# 1 "./ADC.h" 1
# 22 "./ADC.h"
void ADC_Init(void);





uint16 ADC_Read(uint8 channel);
# 12 "TEMP.c" 2


uint8 temp;


void UPDATE_TEMP(void) {
    uint16 val=0;
    val=ADC_Read(2);
    temp=(uint8)(val*(500.0/1024.0));
}
