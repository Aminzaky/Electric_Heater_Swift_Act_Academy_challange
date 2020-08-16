/** @file Scheduler.c
 *  @brief Scheduler of the system which handle TMR0 tick count and call apps. 
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */


#include "Utils.h"
#include "Std_Types.h"
#include "DIO.h"
#include "DIO_local.h"
#include "TMR0.h"
#include "ADC.h"
#include "TEMP.h"
#include "I2C.h"
#include "EX_E2PROM.h"
#include "SWITCH.h"
#include "SSD.h"
#include "DO.h"
#include "Scheduler.h"
#include "DIO_local.h"

uint32 u32TickCount = 0;
uint32 u32SetmodeCount = 0;
uint8 temp_array[10];
uint8 Settemp;
uint8 avgtemp;
uint8 state, heaterstate;
extern uint8 temp;
extern uint8 UPpushed_flag;
extern uint8 DOWNpushed_flag;
extern uint8 ON_OFFpushed_flag;


void Sch_Init(void) {

    Settemp = 60;
    state = OFF;
    EEPROM_Write(0x00, Settemp);


}


void Sch_Start(void) {

    uint8 OPtemp = 60;
    while (1) {
        switch (state) {
            case OFF:
                DO_SetState(HEATER, OFF);
                DO_SetState(HEATER_LED, OFF);
                DO_SetState(COOLER, OFF);
                SSD_OFF();
                if (ON_OFFpushed_flag == 1) {
                    ON_OFFpushed_flag = 0;
                    state = OP;
                }
                break;


            case OP:
                OPtemp = EEPROM_Read(0x00);
                if (ON_OFFpushed_flag == 1) {
                    ON_OFFpushed_flag = 0;
                    state = OFF;
                    heaterstate = OFF;
                }
                if (DOWNpushed_flag == 1 || UPpushed_flag == 1) {
                    DOWNpushed_flag = 0;
                    UPpushed_flag = 0;
                    state = SET;
                    u32SetmodeCount = 0;
                    heaterstate = OFF;
                }

                if (avgtemp > ((OPtemp + 5))) {
                    DO_SetState(HEATER, OFF);
                    DO_SetState(COOLER, ON);

                    DO_SetState(HEATER_LED, ON);
                    heaterstate = OFF;
                }

                if (avgtemp < ((OPtemp - 5))) {
                    DO_SetState(HEATER, ON);
                    DO_SetState(COOLER, OFF);
                    heaterstate = ON;
                }

                break;
            case SET:
                DO_SetState(HEATER, OFF);
                DO_SetState(HEATER_LED, OFF);
                DO_SetState(COOLER, OFF);
                if (ON_OFFpushed_flag == 1) {
                    ON_OFFpushed_flag = 0;
                    state = OFF;
                }
                if (DOWNpushed_flag == 1) {
                    Settemp -= 5;
                    if (Settemp < 35) {
                        Settemp = 35;
                    }
                    DOWNpushed_flag = 0;

                    EEPROM_Write(0x00, Settemp);

                    u32SetmodeCount = 0;

                }
                if (UPpushed_flag == 1) {
                    Settemp += 5;
                    if (Settemp > 75) {
                        Settemp = 75;
                    }
                    UPpushed_flag = 0;

                    EEPROM_Write(0x00, Settemp);

                    u32SetmodeCount = 0;
                }
                if (u32SetmodeCount > 1000) {

                    u32SetmodeCount = 0;
                    state = OP;

                }
                break;


        }
    }


}


void Sch_UpdateTick_Handler(void) {

    u32TickCount++;

    if ((u32TickCount % 200 == 0)&&(heaterstate == ON)) {
        TOGGLEBIT(PORTB, 3);
    }

    if (u32TickCount % 10 == 0) {
        sw_voidtask();
    }

    if (u32TickCount % 20 == 0) {
        UPDATE_TEMP();
        for (int i = 0; i < 10; i++) {
            temp_array[i] = temp_array[i + 1];
        }
        temp_array[9] = (uint8) temp;
        avgtemp = (temp_array[0] + temp_array[1] + temp_array[2] + temp_array[3] + temp_array[4] + temp_array[5] + temp_array[6] + temp_array[7] + temp_array[8] + temp_array[9]) / 10;
    }

    switch (state) {

        case OP:
            if (u32TickCount % 10 == 5) {
                SSD_Display(0, ((uint8) temp) / 10);
            }
            if (u32TickCount % 10 == 0) {
                SSD_Display(1, ((uint8) temp) % 10);
            }

            break;
        case SET:
            u32SetmodeCount++;
            if (u32TickCount % 200 < 100) {
                if (u32TickCount % 10 == 5) {
                    SSD_Display(0, ((uint8) Settemp) / 10);
                }
                if (u32TickCount % 10 == 0) {
                    SSD_Display(1, ((uint8) Settemp) % 10);
                }
            } else {
                SSD_OFF();
            }
            break;

    }



}

