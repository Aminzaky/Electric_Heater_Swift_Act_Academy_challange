# 1 "TMR0.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "TMR0.c" 2
# 10 "TMR0.c"
# 1 "./Utils.h" 1
# 10 "TMR0.c" 2

# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 11 "TMR0.c" 2

# 1 "./TMR0_local.h" 1
# 12 "TMR0.c" 2

# 1 "./TMR0_config.h" 1
# 13 "TMR0.c" 2

# 1 "./TMR0.h" 1
# 19 "./TMR0.h"
void TMR_Init(void);





void TMR_Start(void);





uint8 TMR_CheckOverFlow(void);





void TMR0_vidSetCallBack(void (*CallBack)(void));





void __attribute__((picinterrupt(("")))) TMR_Update(void);
# 14 "TMR0.c" 2

# 1 "./SWITCH.h" 1
# 26 "./SWITCH.h"
void sw_int();





void sw_voidtask(void);
# 15 "TMR0.c" 2


void (*CallBack_ptr)(void);


void TMR_Init(void) {
    int prescale = 256.0;


    switch (prescale) {
        case 2:
            (*((uint8*)(0x81)) &= ~(1 << 0));
            (*((uint8*)(0x81)) &= ~(1 << 1));
            (*((uint8*)(0x81)) &= ~(1 << 2));
            (*((uint8*)(0x81)) &= ~(1 << 3));
            break;
        case 4:
            ((*((uint8*)(0x81))) |= (1 << (0)));
            (*((uint8*)(0x81)) &= ~(1 << 1));
            (*((uint8*)(0x81)) &= ~(1 << 2));
            (*((uint8*)(0x81)) &= ~(1 << 3));
            break;
        case 8:
            (*((uint8*)(0x81)) &= ~(1 << 0));
            ((*((uint8*)(0x81))) |= (1 << (1)));
            (*((uint8*)(0x81)) &= ~(1 << 2));
            (*((uint8*)(0x81)) &= ~(1 << 3));
            break;
        case 16:
            ((*((uint8*)(0x81))) |= (1 << (0)));
            ((*((uint8*)(0x81))) |= (1 << (1)));
            (*((uint8*)(0x81)) &= ~(1 << 2));
            (*((uint8*)(0x81)) &= ~(1 << 3));
            break;
        case 32:
            (*((uint8*)(0x81)) &= ~(1 << 0));
            (*((uint8*)(0x81)) &= ~(1 << 1));
            ((*((uint8*)(0x81))) |= (1 << (2)));
            (*((uint8*)(0x81)) &= ~(1 << 3));
            break;
        case 64:
            ((*((uint8*)(0x81))) |= (1 << (0)));
            (*((uint8*)(0x81)) &= ~(1 << 1));
            ((*((uint8*)(0x81))) |= (1 << (2)));
            (*((uint8*)(0x81)) &= ~(1 << 3));
            break;
        case 128:
            (*((uint8*)(0x81)) &= ~(1 << 0));
            ((*((uint8*)(0x81))) |= (1 << (1)));
            ((*((uint8*)(0x81))) |= (1 << (2)));
            (*((uint8*)(0x81)) &= ~(1 << 3));
            break;
        case 256:
            ((*((uint8*)(0x81))) |= (1 << (0)));
            ((*((uint8*)(0x81))) |= (1 << (1)));
            ((*((uint8*)(0x81))) |= (1 << (2)));
            (*((uint8*)(0x81)) &= ~(1 << 3));
            break;
    }
    (*((uint8*)(0x81)) &= ~(1 << 5));
    (*((uint8*)(0x81)) &= ~(1 << 4));
}


void TMR_Start(void) {


    ((*((uint8*)(0x0B))) |= (1 << (5)));

    ((*((uint8*)(0x0B))) |= (1 << (7)));

    ((*((uint8*)(0x0B))) |= (1 << (6)));

    (*((uint8*)(0x0B)) &= ~(1 << 2));

    (*((uint8*)(0x01))=(((uint8) ((256 + 2)-(((8.0 * 5.0) / (256.0))*250.0))) | (*((uint8*)(0x01))&0x00)));

}


void TMR0_vidSetCallBack(void (*CallBack)(void)) {
    CallBack_ptr = CallBack;
}


uint8 TMR_CheckOverFlow(void) {
    return ((*((uint8*)(0x0B)) >> 2) & (1));
}






void __attribute__((picinterrupt(("")))) TMR_Update(void) {


    (*((uint8*)(0x0B)) &= ~(1 << 2));

    (*((uint8*)(0x01))=(((uint8) ((256 + 2)-(((8.0 * 5.0) / (256.0))*250.0))) | (*((uint8*)(0x01))&0x00)));

    CallBack_ptr();


}
