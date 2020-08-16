# 1 "SWITCH.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "SWITCH.c" 2








# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 9 "SWITCH.c" 2

# 1 "./Utils.h" 1
# 10 "SWITCH.c" 2

# 1 "./DIO.h" 1
# 78 "./DIO.h"
void DIO_voidInitPort(uint8 Port, uint8 Dir);






void DIO_voidWritePortValue(uint8 Port, uint8 value);





uint8 DIO_U8ReadPortValue(uint8 Port);







void DIO_voidInitPin(uint8 pin_num, uint8 Dir);






void DIO_voidWritePinValue(uint8 pin_num, uint8 value);





uint8 DIO_U8ReadPinValue(uint8 pin_num);
# 11 "SWITCH.c" 2

# 1 "./DIO_local.h" 1
# 12 "SWITCH.c" 2

# 1 "./SWITCH.h" 1
# 26 "./SWITCH.h"
void sw_int();





void sw_voidtask(void);
# 13 "SWITCH.c" 2

# 1 "./SWITCH_config.h" 1
# 14 "SWITCH.c" 2


uint8 UPstate = 0;
uint8 UPpushed_flag = 0;
uint8 DOWNstate = 0;
uint8 DOWNpushed_flag = 0;
uint8 ON_OFFstate = 0;
uint8 ON_OFFpushed_flag = 0;
uint8 SWcounter = 0;


void sw_int(void) {
    DIO_voidInitPin(10, 1);
    DIO_voidInitPin(8, 1);
    DIO_voidInitPin(9, 1);
}


void sw_voidtask(void) {

    switch (UPstate) {
        case 0:
            if (DIO_U8ReadPinValue(10) == 0) {
                UPstate = 1;
            }
            break;

        case 1:
            if (DIO_U8ReadPinValue(10) == 0) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                UPstate = 2;
            }
            break;
        case 2:
            UPpushed_flag = 1;
            if (DIO_U8ReadPinValue(10) == 1) {
                UPstate = 3;
            }
            break;
        case 3:
            if (DIO_U8ReadPinValue(10) == 1) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                UPstate = 0;
            }
            break;

    }
    switch (DOWNstate) {
        case 0:
            if (DIO_U8ReadPinValue(8) == 0) {
                DOWNstate = 1;
            }
            break;

        case 1:
            if (DIO_U8ReadPinValue(8) == 0) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                DOWNstate = 2;
            }
            break;
        case 2:
            DOWNpushed_flag = 1;
            if (DIO_U8ReadPinValue(8) == 1) {
                DOWNstate = 3;
            }
            break;
        case 3:
            if (DIO_U8ReadPinValue(8) == 1) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                DOWNstate = 0;
            }
            break;

    }
    switch (ON_OFFstate) {
        case 0:
            if (DIO_U8ReadPinValue(9) == 0) {
                ON_OFFstate = 1;
            }
            break;

        case 1:
            if (DIO_U8ReadPinValue(9) == 0) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                ON_OFFstate = 2;
            }
            break;
        case 2:
            ON_OFFpushed_flag = 1;
            if (DIO_U8ReadPinValue(9) == 1) {
                ON_OFFstate = 3;
            }
            break;
        case 3:
            if (DIO_U8ReadPinValue(9) == 1) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                ON_OFFstate = 0;
            }
            break;

    }


}
