/** @file DIO.c
 *  @brief General purpose digital input/output driver.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#include "Utils.h"
#include "Std_Types.h"
#include "DIO_local.h"
#include "DIO.h"


void DIO_voidInitPort(uint8 Port, uint8 Dir) {
    switch (Port) {
        case 0:
            if (Dir == Input) {
                SETPORT(TRISA);
            }
            if (Dir == Output) {
                CLRPORT(TRISA);
            }
            break;
        case 1:
            if (Dir == Input) {
                SETPORT(TRISB);
            }
            if (Dir == Output) {
                CLRPORT(TRISB);
            }
            break;
        case 2:
            if (Dir == Input) {
                SETPORT(TRISC);
            }
            if (Dir == Output) {
                CLRPORT(TRISC);
            }
            break;
        case 3:
            if (Dir == Input) {
                SETPORT(TRISD);
            }
            if (Dir == Output) {
                CLRPORT(TRISD);
            }
            break;
        case 4:
            if (Dir == Input) {
                SETPORT(TRISE);
            }
            if (Dir == Output) {
                CLRPORT(TRISE);
            }
            break;
    }
}


void DIO_voidWritePortValue(uint8 Port, uint8 value) {
    switch (Port) {
        case 0:
            PORTA = value;
            break;
        case 1:
            PORTB = value;
            break;
        case 2:
            PORTC = value;
            break;
        case 3:
            PORTD = value;
            break;
        case 4:
            PORTE = value;
            break;
    }
}


uint8 DIO_U8ReadPortValue(uint8 Port) {
    uint8 port;
    switch (Port) {
        case 0:
            port = GETPORT(PORTA);
            break;
        case 1:
            port = GETPORT(PORTB);
            break;
        case 2:
            port = GETPORT(PORTC);
            break;
        case 3:
            port = GETPORT(PORTD);
            break;
        case 4:
            port = GETPORT(PORTE);
            break;
    }
    return port;
}


void DIO_voidInitPin(uint8 pin_num, uint8 Dir) {
    switch (Dir) {
        case Input:
            if ((pin_num >= pin_A0)&&(pin_num < pin_B0)) {
                SETBIT(TRISA, pin_num % 8);
            }
            if ((pin_num >= pin_B0)&&(pin_num < pin_C0)) {
                SETBIT(TRISB, pin_num % 8);
            }
            if ((pin_num >= pin_C0)&&(pin_num < pin_D0)) {
                SETBIT(TRISC, pin_num % 8);
            }
            if ((pin_num >= pin_D0)&&(pin_num < pin_E0)) {
                SETBIT(TRISD, pin_num % 8);
            }
            if ((pin_num >= pin_E0)&&(pin_num <= pin_E2)) {
                SETBIT(TRISE, pin_num % 8);
            }
            break;
        case Output:
            if ((pin_num >= pin_A0)&&(pin_num < pin_B0)) {
                CLRBIT(TRISA, pin_num % 8);
            }
            if ((pin_num >= pin_B0)&&(pin_num < pin_C0)) {
                CLRBIT(TRISB, pin_num % 8);
            }
            if ((pin_num >= pin_C0)&&(pin_num < pin_D0)) {
                CLRBIT(TRISC, pin_num % 8);
            }
            if ((pin_num >= pin_D0)&&(pin_num < pin_E0)) {
                CLRBIT(TRISD, pin_num % 8);
            }
            if ((pin_num >= pin_E0)&&(pin_num <= pin_E2)) {
                CLRBIT(TRISE, pin_num % 8);
            }
            break;
    }

}


void DIO_voidWritePinValue(uint8 pin_num, uint8 value) {
    if ((pin_num >= pin_A0)&&(pin_num < pin_B0)) {
        ASSIGNBIT(PORTA, pin_num % 8, value);
    }
    if ((pin_num >= pin_B0)&&(pin_num < pin_C0)) {
        ASSIGNBIT(PORTB, pin_num % 8, value);
    }
    if ((pin_num >= pin_C0)&&(pin_num < pin_D0)) {
        ASSIGNBIT(PORTC, pin_num % 8, value);
    }
    if ((pin_num >= pin_D0)&&(pin_num < pin_E0)) {
        ASSIGNBIT(PORTD, pin_num % 8, value);
    }
    if ((pin_num >= pin_E0)&&(pin_num <= pin_E2)) {
        ASSIGNBIT(PORTE, pin_num % 8, value);
    }
}


uint8 DIO_U8ReadPinValue(uint8 pin_num) {
    uint8 pin;
    if ((pin_num >= pin_A0)&&(pin_num < pin_B0)) {
        pin = (GETBIT(PORTA, pin_num % 8));
    }
    if ((pin_num >= pin_B0)&&(pin_num < pin_C0)) {
        pin = (GETBIT(PORTB, pin_num % 8));
    }
    if ((pin_num >= pin_C0)&&(pin_num < pin_D0)) {
        pin = (GETBIT(PORTC, pin_num % 8));
    }
    if ((pin_num >= pin_D0)&&(pin_num < pin_E0)) {
        pin = (GETBIT(PORTD, pin_num % 8));
    }
    if ((pin_num >= pin_E0)&&(pin_num <= pin_E2)) {
        pin = (GETBIT(PORTE, pin_num % 8));
    }
    return pin;
}



