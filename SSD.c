/** @file SSD.c
 *  @brief Drive two seven segments display and interface. 
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#include "Std_Types.h"
#include "Utils.h"
#include "DIO.h"
#include "DIO_local.h"
#include "SSD.h"

void SSD_Init(void) {
    DIO_voidInitPort(PORT_D, Output);
    DIO_voidInitPin(pin_A4, Output);
    DIO_voidInitPin(pin_A5, Output);
}

void SSD_Display(uint8 display_no, uint8 number) {
    switch (display_no) {
        case 0:
            DIO_voidWritePinValue(pin_A4, HIGH);
            DIO_voidWritePinValue(pin_A5, LOW);
            switch (number) {
                case 0:
                    DIO_voidWritePortValue(PORT_D, 0x3F);
                    break;
                case 1:
                    DIO_voidWritePortValue(PORT_D, 0x06);
                    break;
                case 2:
                    DIO_voidWritePortValue(PORT_D, 0x5B);
                    break;
                case 3:
                    DIO_voidWritePortValue(PORT_D, 0x4F);
                    break;
                case 4:
                    DIO_voidWritePortValue(PORT_D, 0x66);
                    break;
                case 5:
                    DIO_voidWritePortValue(PORT_D, 0x6D);
                    break;
                case 6:
                    DIO_voidWritePortValue(PORT_D, 0x7D);
                    break;
                case 7:
                    DIO_voidWritePortValue(PORT_D, 0x07);
                    break;
                case 8:
                    DIO_voidWritePortValue(PORT_D, 0x7F);
                    break;
                case 9:
                    DIO_voidWritePortValue(PORT_D, 0x6F);
                    break;
            }
            break;
        case 1:
            DIO_voidWritePinValue(pin_A5, HIGH);
            DIO_voidWritePinValue(pin_A4, LOW);
            switch (number) {
                case 0:
                    DIO_voidWritePortValue(PORT_D, 0x3F);
                    break;
                case 1:
                    DIO_voidWritePortValue(PORT_D, 0x06);
                    break;
                case 2:
                    DIO_voidWritePortValue(PORT_D, 0x5B);
                    break;
                case 3:
                    DIO_voidWritePortValue(PORT_D, 0x4F);
                    break;
                case 4:
                    DIO_voidWritePortValue(PORT_D, 0x66);
                    break;
                case 5:
                    DIO_voidWritePortValue(PORT_D, 0x6D);
                    break;
                case 6:
                    DIO_voidWritePortValue(PORT_D, 0x7D);
                    break;
                case 7:
                    DIO_voidWritePortValue(PORT_D, 0x07);
                    break;
                case 8:
                    DIO_voidWritePortValue(PORT_D, 0x7F);
                    break;
                case 9:
                    DIO_voidWritePortValue(PORT_D, 0x6F);
                    break;
            }
            break;
    }
}

void SSD_OFF(void) {
    DIO_voidWritePinValue(pin_A4, LOW);
    DIO_voidWritePinValue(pin_A5, LOW);
    DIO_voidWritePortValue(PORT_D, 0x00);
}
