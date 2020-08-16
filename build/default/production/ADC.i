# 1 "ADC.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "ADC.c" 2








# 1 "./Utils.h" 1
# 9 "ADC.c" 2

# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 10 "ADC.c" 2

# 1 "./DIO_local.h" 1
# 11 "ADC.c" 2

# 1 "./ADC_local.h" 1
# 12 "ADC.c" 2

# 1 "./ADC.h" 1
# 22 "./ADC.h"
void ADC_Init(void);





uint16 ADC_Read(uint8 channel);
# 13 "ADC.c" 2



void ADC_Init(void) {


    (*((uint8*)(0x1E))&=0x00);
    (*((uint8*)(0x9E))&=0x00);

    ((*((uint8*)(0x1F))) |= (1 << (6)));
    ((*((uint8*)(0x1F))) |= (1 << (7)));
    ((*((uint8*)(0x9F))) |= (1 << (6)));

    (*((uint8*)(0x9F)) &= ~(1 << 3));
    (*((uint8*)(0x9F)) &= ~(1 << 2));
    (*((uint8*)(0x9F)) &= ~(1 << 1));
    (*((uint8*)(0x9F)) &= ~(1 << 0));

    ((*((uint8*)(0x9F))) |= (1 << (7)));
}


uint16 ADC_Read(uint8 channel) {

    uint8 A = (*((uint8*)(0x85))&0xFF);
    uint8 E = (*((uint8*)(0x89))&0xFF);
    uint16 ADC_result = 0;

    (*((uint8*)(0x85))=((0xFF) | (*((uint8*)(0x85))&0x00)));
    (*((uint8*)(0x89))=((0xFF) | (*((uint8*)(0x89))&0x00)));


    (*((uint8*)(0x1E))&=0x00);
    (*((uint8*)(0x9E))&=0x00);

    switch (channel) {
        case 0:
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (3))))|(0 << 3)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (4))))|(0 << 4)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (5))))|(0 << 5)));
            break;
        case 1:
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (3))))|(1 << 3)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (4))))|(0 << 4)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (5))))|(0 << 5)));
            break;
        case 2:
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (3))))|(0 << 3)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (4))))|(1 << 4)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (5))))|(0 << 5)));
            break;
        case 3:
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (3))))|(1 << 3)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (4))))|(1 << 4)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (5))))|(0 << 5)));
            break;
        case 4:
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (3))))|(0 << 3)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (4))))|(0 << 4)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (5))))|(1 << 5)));
            break;
        case 5:
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (3))))|(1 << 3)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (4))))|(0 << 4)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (5))))|(1 << 5)));
            break;
        case 6:
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (3))))|(0 << 3)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (4))))|(1 << 4)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (5))))|(1 << 5)));
            break;
        case 7:
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (3))))|(1 << 3)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (4))))|(1 << 4)));
            ((*((uint8*)(0x1F))) = (((*((uint8*)(0x1F))) & ( ~(1 << (5))))|(1 << 5)));
            break;
    }


    ((*((uint8*)(0x1F))) |= (1 << (0)));
    ((*((uint8*)(0x1F))) |= (1 << (2)));


    while (((*((uint8*)(0x1F)) >> 2) & (1)) == 1);

    ADC_result = (*((uint8*)(0x9E))&0xFF) + (*((uint8*)(0x1E))&0xFF)*256;

    (*((uint8*)(0x85))=((A) | (*((uint8*)(0x85))&0x00)));
    (*((uint8*)(0x89))=((E) | (*((uint8*)(0x89))&0x00)));


    (*((uint8*)(0x1F)) &= ~(1 << 0));

    return ADC_result;
}
