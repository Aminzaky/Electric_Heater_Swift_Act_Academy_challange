# 1 "DIO.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "DIO.c" 2








# 1 "./Utils.h" 1
# 9 "DIO.c" 2

# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 10 "DIO.c" 2

# 1 "./DIO_local.h" 1
# 11 "DIO.c" 2

# 1 "./DIO.h" 1
# 78 "./DIO.h"
void DIO_voidInitPort(uint8 Port, uint8 Dir);






void DIO_voidWritePortValue(uint8 Port, uint8 value);





uint8 DIO_U8ReadPortValue(uint8 Port);







void DIO_voidInitPin(uint8 pin_num, uint8 Dir);






void DIO_voidWritePinValue(uint8 pin_num, uint8 value);





uint8 DIO_U8ReadPinValue(uint8 pin_num);
# 12 "DIO.c" 2



void DIO_voidInitPort(uint8 Port, uint8 Dir) {
    switch (Port) {
        case 0:
            if (Dir == 1) {
                (*((uint8*)(0x85))|=0xFF);
            }
            if (Dir == 0) {
                (*((uint8*)(0x85))&=0x00);
            }
            break;
        case 1:
            if (Dir == 1) {
                (*((uint8*)(0x86))|=0xFF);
            }
            if (Dir == 0) {
                (*((uint8*)(0x86))&=0x00);
            }
            break;
        case 2:
            if (Dir == 1) {
                (*((uint8*)(0x87))|=0xFF);
            }
            if (Dir == 0) {
                (*((uint8*)(0x87))&=0x00);
            }
            break;
        case 3:
            if (Dir == 1) {
                (*((uint8*)(0x88))|=0xFF);
            }
            if (Dir == 0) {
                (*((uint8*)(0x88))&=0x00);
            }
            break;
        case 4:
            if (Dir == 1) {
                (*((uint8*)(0x89))|=0xFF);
            }
            if (Dir == 0) {
                (*((uint8*)(0x89))&=0x00);
            }
            break;
    }
}


void DIO_voidWritePortValue(uint8 Port, uint8 value) {
    switch (Port) {
        case 0:
            *((uint8*)(0x05)) = value;
            break;
        case 1:
            *((uint8*)(0x06)) = value;
            break;
        case 2:
            *((uint8*)(0x07)) = value;
            break;
        case 3:
            *((uint8*)(0x08)) = value;
            break;
        case 4:
            *((uint8*)(0x09)) = value;
            break;
    }
}


uint8 DIO_U8ReadPortValue(uint8 Port) {
    uint8 port;
    switch (Port) {
        case 0:
            port = (*((uint8*)(0x05))&0xFF);
            break;
        case 1:
            port = (*((uint8*)(0x06))&0xFF);
            break;
        case 2:
            port = (*((uint8*)(0x07))&0xFF);
            break;
        case 3:
            port = (*((uint8*)(0x08))&0xFF);
            break;
        case 4:
            port = (*((uint8*)(0x09))&0xFF);
            break;
    }
    return port;
}


void DIO_voidInitPin(uint8 pin_num, uint8 Dir) {
    switch (Dir) {
        case 1:
            if ((pin_num >= 0)&&(pin_num < 8)) {
                ((*((uint8*)(0x85))) |= (1 << (pin_num % 8)));
            }
            if ((pin_num >= 8)&&(pin_num < 16)) {
                ((*((uint8*)(0x86))) |= (1 << (pin_num % 8)));
            }
            if ((pin_num >= 16)&&(pin_num < 24)) {
                ((*((uint8*)(0x87))) |= (1 << (pin_num % 8)));
            }
            if ((pin_num >= 24)&&(pin_num < 32)) {
                ((*((uint8*)(0x88))) |= (1 << (pin_num % 8)));
            }
            if ((pin_num >= 32)&&(pin_num <= 34)) {
                ((*((uint8*)(0x89))) |= (1 << (pin_num % 8)));
            }
            break;
        case 0:
            if ((pin_num >= 0)&&(pin_num < 8)) {
                (*((uint8*)(0x85)) &= ~(1 << pin_num % 8));
            }
            if ((pin_num >= 8)&&(pin_num < 16)) {
                (*((uint8*)(0x86)) &= ~(1 << pin_num % 8));
            }
            if ((pin_num >= 16)&&(pin_num < 24)) {
                (*((uint8*)(0x87)) &= ~(1 << pin_num % 8));
            }
            if ((pin_num >= 24)&&(pin_num < 32)) {
                (*((uint8*)(0x88)) &= ~(1 << pin_num % 8));
            }
            if ((pin_num >= 32)&&(pin_num <= 34)) {
                (*((uint8*)(0x89)) &= ~(1 << pin_num % 8));
            }
            break;
    }

}


void DIO_voidWritePinValue(uint8 pin_num, uint8 value) {
    if ((pin_num >= 0)&&(pin_num < 8)) {
        ((*((uint8*)(0x05))) = (((*((uint8*)(0x05))) & ( ~(1 << (pin_num % 8))))|(value << pin_num % 8)));
    }
    if ((pin_num >= 8)&&(pin_num < 16)) {
        ((*((uint8*)(0x06))) = (((*((uint8*)(0x06))) & ( ~(1 << (pin_num % 8))))|(value << pin_num % 8)));
    }
    if ((pin_num >= 16)&&(pin_num < 24)) {
        ((*((uint8*)(0x07))) = (((*((uint8*)(0x07))) & ( ~(1 << (pin_num % 8))))|(value << pin_num % 8)));
    }
    if ((pin_num >= 24)&&(pin_num < 32)) {
        ((*((uint8*)(0x08))) = (((*((uint8*)(0x08))) & ( ~(1 << (pin_num % 8))))|(value << pin_num % 8)));
    }
    if ((pin_num >= 32)&&(pin_num <= 34)) {
        ((*((uint8*)(0x09))) = (((*((uint8*)(0x09))) & ( ~(1 << (pin_num % 8))))|(value << pin_num % 8)));
    }
}


uint8 DIO_U8ReadPinValue(uint8 pin_num) {
    uint8 pin;
    if ((pin_num >= 0)&&(pin_num < 8)) {
        pin = (((*((uint8*)(0x05)) >> pin_num % 8) & (1)));
    }
    if ((pin_num >= 8)&&(pin_num < 16)) {
        pin = (((*((uint8*)(0x06)) >> pin_num % 8) & (1)));
    }
    if ((pin_num >= 16)&&(pin_num < 24)) {
        pin = (((*((uint8*)(0x07)) >> pin_num % 8) & (1)));
    }
    if ((pin_num >= 24)&&(pin_num < 32)) {
        pin = (((*((uint8*)(0x08)) >> pin_num % 8) & (1)));
    }
    if ((pin_num >= 32)&&(pin_num <= 34)) {
        pin = (((*((uint8*)(0x09)) >> pin_num % 8) & (1)));
    }
    return pin;
}
