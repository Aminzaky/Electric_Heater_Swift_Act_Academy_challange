/** @file SWITCH.c
 *  @brief Switches driver using debouncing sampling technique to make sure the switch is pressed or released to avoid noise. 
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#include "Std_Types.h"
#include "Utils.h"
#include "DIO.h"
#include "DIO_local.h"
#include "SWITCH.h"
#include "SWITCH_config.h"

uint8 UPstate = 0;
uint8 UPpushed_flag = 0;
uint8 DOWNstate = 0;
uint8 DOWNpushed_flag = 0;
uint8 ON_OFFstate = 0;
uint8 ON_OFFpushed_flag = 0;
uint8 SWcounter = 0;


void sw_int(void) {
    DIO_voidInitPin(UP_PIN, Input);
    DIO_voidInitPin(DOWN_PIN, Input);
    DIO_voidInitPin(ON_OFF_PIN, Input);
}


void sw_voidtask(void) {

    switch (UPstate) {
        case released:
            if (DIO_U8ReadPinValue(UP_PIN) == 0) {
                UPstate = prepushed;
            }
            break;

        case prepushed:
            if (DIO_U8ReadPinValue(UP_PIN) == 0) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                UPstate = pushed;
            }
            break;
        case pushed:
            UPpushed_flag = 1;
            if (DIO_U8ReadPinValue(UP_PIN) == 1) {
                UPstate = prereleased;
            }
            break;
        case prereleased:
            if (DIO_U8ReadPinValue(UP_PIN) == 1) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                UPstate = released;
            }
            break;

    }
    switch (DOWNstate) {
        case released:
            if (DIO_U8ReadPinValue(DOWN_PIN) == 0) {
                DOWNstate = prepushed;
            }
            break;

        case prepushed:
            if (DIO_U8ReadPinValue(DOWN_PIN) == 0) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                DOWNstate = pushed;
            }
            break;
        case pushed:
            DOWNpushed_flag = 1;
            if (DIO_U8ReadPinValue(DOWN_PIN) == 1) {
                DOWNstate = prereleased;
            }
            break;
        case prereleased:
            if (DIO_U8ReadPinValue(DOWN_PIN) == 1) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                DOWNstate = released;
            }
            break;

    }
    switch (ON_OFFstate) {
        case released:
            if (DIO_U8ReadPinValue(ON_OFF_PIN) == 0) {
                ON_OFFstate = prepushed;
            }
            break;

        case prepushed:
            if (DIO_U8ReadPinValue(ON_OFF_PIN) == 0) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                ON_OFFstate = pushed;
            }
            break;
        case pushed:
            ON_OFFpushed_flag = 1;
            if (DIO_U8ReadPinValue(ON_OFF_PIN) == 1) {
                ON_OFFstate = prereleased;
            }
            break;
        case prereleased:
            if (DIO_U8ReadPinValue(ON_OFF_PIN) == 1) {
                SWcounter++;
            }
            if (SWcounter >= 4) {
                SWcounter = 0;
                ON_OFFstate = released;
            }
            break;

    }


}

