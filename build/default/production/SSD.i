# 1 "SSD.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "SSD.c" 2








# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 9 "SSD.c" 2

# 1 "./Utils.h" 1
# 10 "SSD.c" 2

# 1 "./DIO.h" 1
# 78 "./DIO.h"
void DIO_voidInitPort(uint8 Port, uint8 Dir);






void DIO_voidWritePortValue(uint8 Port, uint8 value);





uint8 DIO_U8ReadPortValue(uint8 Port);







void DIO_voidInitPin(uint8 pin_num, uint8 Dir);






void DIO_voidWritePinValue(uint8 pin_num, uint8 value);





uint8 DIO_U8ReadPinValue(uint8 pin_num);
# 11 "SSD.c" 2

# 1 "./DIO_local.h" 1
# 12 "SSD.c" 2

# 1 "./SSD.h" 1
# 21 "./SSD.h"
void SSD_Init(void);






void SSD_Display(uint8 display_no, uint8 number);





void SSD_OFF(void);
# 13 "SSD.c" 2


void SSD_Init(void) {
    DIO_voidInitPort(3, 0);
    DIO_voidInitPin(4, 0);
    DIO_voidInitPin(5, 0);
}

void SSD_Display(uint8 display_no, uint8 number) {
    switch (display_no) {
        case 0:
            DIO_voidWritePinValue(4, 1);
            DIO_voidWritePinValue(5, 0);
            switch (number) {
                case 0:
                    DIO_voidWritePortValue(3, 0x3F);
                    break;
                case 1:
                    DIO_voidWritePortValue(3, 0x06);
                    break;
                case 2:
                    DIO_voidWritePortValue(3, 0x5B);
                    break;
                case 3:
                    DIO_voidWritePortValue(3, 0x4F);
                    break;
                case 4:
                    DIO_voidWritePortValue(3, 0x66);
                    break;
                case 5:
                    DIO_voidWritePortValue(3, 0x6D);
                    break;
                case 6:
                    DIO_voidWritePortValue(3, 0x7D);
                    break;
                case 7:
                    DIO_voidWritePortValue(3, 0x07);
                    break;
                case 8:
                    DIO_voidWritePortValue(3, 0x7F);
                    break;
                case 9:
                    DIO_voidWritePortValue(3, 0x6F);
                    break;
            }
            break;
        case 1:
            DIO_voidWritePinValue(5, 1);
            DIO_voidWritePinValue(4, 0);
            switch (number) {
                case 0:
                    DIO_voidWritePortValue(3, 0x3F);
                    break;
                case 1:
                    DIO_voidWritePortValue(3, 0x06);
                    break;
                case 2:
                    DIO_voidWritePortValue(3, 0x5B);
                    break;
                case 3:
                    DIO_voidWritePortValue(3, 0x4F);
                    break;
                case 4:
                    DIO_voidWritePortValue(3, 0x66);
                    break;
                case 5:
                    DIO_voidWritePortValue(3, 0x6D);
                    break;
                case 6:
                    DIO_voidWritePortValue(3, 0x7D);
                    break;
                case 7:
                    DIO_voidWritePortValue(3, 0x07);
                    break;
                case 8:
                    DIO_voidWritePortValue(3, 0x7F);
                    break;
                case 9:
                    DIO_voidWritePortValue(3, 0x6F);
                    break;
            }
            break;
    }
}

void SSD_OFF(void) {
    DIO_voidWritePinValue(4, 0);
    DIO_voidWritePinValue(5, 0);
    DIO_voidWritePortValue(3, 0x00);
}
