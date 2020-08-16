/** @file DO.c
 *  @brief file to map DIO with the pins which will be connected to the controller and will be controlled in the main function and scheduler. 
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#include "Std_Types.h"
#include "Utils.h"
#include "DIO.h"
#include "DO.h"
#include "DIO_local.h"


void DO_Init(void) {
    DIO_voidInitPin(HEATER_LED, Output);
    DIO_voidInitPin(HEATER, Output);
    DIO_voidInitPin(COOLER, Output);
    CLR_HIGH_NIPPLE(TRISB);
}


void DO_SetState(uint8 device, uint8 state) {
    DIO_voidWritePinValue(device, state);
}
