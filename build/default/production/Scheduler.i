# 1 "Scheduler.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "Scheduler.c" 2
# 10 "Scheduler.c"
# 1 "./Utils.h" 1
# 10 "Scheduler.c" 2

# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 11 "Scheduler.c" 2

# 1 "./DIO.h" 1
# 78 "./DIO.h"
void DIO_voidInitPort(uint8 Port, uint8 Dir);






void DIO_voidWritePortValue(uint8 Port, uint8 value);





uint8 DIO_U8ReadPortValue(uint8 Port);







void DIO_voidInitPin(uint8 pin_num, uint8 Dir);






void DIO_voidWritePinValue(uint8 pin_num, uint8 value);





uint8 DIO_U8ReadPinValue(uint8 pin_num);
# 12 "Scheduler.c" 2

# 1 "./DIO_local.h" 1
# 13 "Scheduler.c" 2

# 1 "./TMR0.h" 1
# 19 "./TMR0.h"
void TMR_Init(void);





void TMR_Start(void);





uint8 TMR_CheckOverFlow(void);





void TMR0_vidSetCallBack(void (*CallBack)(void));





void __attribute__((picinterrupt(("")))) TMR_Update(void);
# 14 "Scheduler.c" 2

# 1 "./ADC.h" 1
# 22 "./ADC.h"
void ADC_Init(void);





uint16 ADC_Read(uint8 channel);
# 15 "Scheduler.c" 2

# 1 "./TEMP.h" 1
# 22 "./TEMP.h"
void UPDATE_TEMP(void);
# 16 "Scheduler.c" 2

# 1 "./I2C.h" 1
# 21 "./I2C.h"
void I2C_Master_Init(void);





void I2C_Master_Start(void);





void I2C_Master_RepeatedStart(void);





void I2C_Master_Wait(void);





uint8 I2C_Master_Write(uint8 data);





void I2C_Master_Stop(void);





uint8 I2C_Master_Read(void);





void I2C_Ack(void);





void I2C_Nack(void);
# 17 "Scheduler.c" 2

# 1 "./EX_E2PROM.h" 1
# 25 "./EX_E2PROM.h"
void EEPROM_Write(uint8 address, uint8 data);





uint8 EEPROM_Read(uint8 address);
# 18 "Scheduler.c" 2

# 1 "./SWITCH.h" 1
# 26 "./SWITCH.h"
void sw_int();





void sw_voidtask(void);
# 19 "Scheduler.c" 2

# 1 "./SSD.h" 1
# 21 "./SSD.h"
void SSD_Init(void);






void SSD_Display(uint8 display_no, uint8 number);





void SSD_OFF(void);
# 20 "Scheduler.c" 2

# 1 "./DO.h" 1
# 28 "./DO.h"
void DO_Init(void);






void DO_SetState(uint8 device ,uint8 state);
# 21 "Scheduler.c" 2

# 1 "./Scheduler.h" 1
# 26 "./Scheduler.h"
void Sch_Init(void);





void Sch_Start(void);





void Sch_UpdateTick_Handler(void);
# 22 "Scheduler.c" 2



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
    state = 0;
    EEPROM_Write(0x00, Settemp);


}


void Sch_Start(void) {

    uint8 OPtemp = 60;
    while (1) {
        switch (state) {
            case 0:
                DO_SetState(21, 0);
                DO_SetState(11, 0);
                DO_SetState(18, 0);
                SSD_OFF();
                if (ON_OFFpushed_flag == 1) {
                    ON_OFFpushed_flag = 0;
                    state = 1;
                }
                break;


            case 1:
                OPtemp = EEPROM_Read(0x00);
                if (ON_OFFpushed_flag == 1) {
                    ON_OFFpushed_flag = 0;
                    state = 0;
                    heaterstate = 0;
                }
                if (DOWNpushed_flag == 1 || UPpushed_flag == 1) {
                    DOWNpushed_flag = 0;
                    UPpushed_flag = 0;
                    state = 2;
                    u32SetmodeCount = 0;
                    heaterstate = 0;
                }

                if (avgtemp > ((OPtemp + 5))) {
                    DO_SetState(21, 0);
                    DO_SetState(18, 1);

                    DO_SetState(11, 1);
                    heaterstate = 0;
                }

                if (avgtemp < ((OPtemp - 5))) {
                    DO_SetState(21, 1);
                    DO_SetState(18, 0);
                    heaterstate = 1;
                }

                break;
            case 2:
                DO_SetState(21, 0);
                DO_SetState(11, 0);
                DO_SetState(18, 0);
                if (ON_OFFpushed_flag == 1) {
                    ON_OFFpushed_flag = 0;
                    state = 0;
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
                    state = 1;

                }
                break;


        }
    }


}


void Sch_UpdateTick_Handler(void) {

    u32TickCount++;

    if ((u32TickCount % 200 == 0)&&(heaterstate == 1)) {
        ((*((uint8*)(0x06))) ^= (1 <<(3)));
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

        case 1:
            if (u32TickCount % 10 == 5) {
                SSD_Display(0, ((uint8) temp) / 10);
            }
            if (u32TickCount % 10 == 0) {
                SSD_Display(1, ((uint8) temp) % 10);
            }

            break;
        case 2:
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
