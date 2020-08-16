# 1 "main.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Program Files (x86)/Microchip/MPLABX/v5.40/packs/Microchip/PIC16Fxxx_DFP/1.2.33/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "main.c" 2
# 12 "main.c"
# 1 "./configs.h" 1
# 12 "./configs.h"
#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config BOREN = OFF
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config WRT = OFF
#pragma config CP = OFF
# 12 "main.c" 2

# 1 "./Utils.h" 1
# 13 "main.c" 2

# 1 "./Std_Types.h" 1
# 18 "./Std_Types.h"
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;

typedef unsigned char bool;
# 14 "main.c" 2

# 1 "./DIO.h" 1
# 78 "./DIO.h"
void DIO_voidInitPort(uint8 Port, uint8 Dir);






void DIO_voidWritePortValue(uint8 Port, uint8 value);





uint8 DIO_U8ReadPortValue(uint8 Port);







void DIO_voidInitPin(uint8 pin_num, uint8 Dir);






void DIO_voidWritePinValue(uint8 pin_num, uint8 value);





uint8 DIO_U8ReadPinValue(uint8 pin_num);
# 15 "main.c" 2

# 1 "./TMR0.h" 1
# 19 "./TMR0.h"
void TMR_Init(void);





void TMR_Start(void);





uint8 TMR_CheckOverFlow(void);





void TMR0_vidSetCallBack(void (*CallBack)(void));





void __attribute__((picinterrupt(("")))) TMR_Update(void);
# 16 "main.c" 2

# 1 "./ADC.h" 1
# 22 "./ADC.h"
void ADC_Init(void);





uint16 ADC_Read(uint8 channel);
# 17 "main.c" 2

# 1 "./TEMP.h" 1
# 22 "./TEMP.h"
void UPDATE_TEMP(void);
# 18 "main.c" 2

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
# 19 "main.c" 2

# 1 "./EX_E2PROM.h" 1
# 25 "./EX_E2PROM.h"
void EEPROM_Write(uint8 address, uint8 data);





uint8 EEPROM_Read(uint8 address);
# 20 "main.c" 2

# 1 "./SWITCH.h" 1
# 26 "./SWITCH.h"
void sw_int();





void sw_voidtask(void);
# 21 "main.c" 2

# 1 "./SSD.h" 1
# 21 "./SSD.h"
void SSD_Init(void);






void SSD_Display(uint8 display_no, uint8 number);





void SSD_OFF(void);
# 22 "main.c" 2

# 1 "./DO.h" 1
# 28 "./DO.h"
void DO_Init(void);






void DO_SetState(uint8 device ,uint8 state);
# 23 "main.c" 2

# 1 "./Scheduler.h" 1
# 26 "./Scheduler.h"
void Sch_Init(void);





void Sch_Start(void);





void Sch_UpdateTick_Handler(void);
# 24 "main.c" 2
# 37 "main.c"
void main(void) {

    TMR_Init();
    TMR_Start();
    SSD_Init();
    ADC_Init();
    sw_int();
    DO_Init();
    I2C_Master_Init();


    Sch_Init();

    TMR0_vidSetCallBack(Sch_UpdateTick_Handler);

    Sch_Start();

    return;
}
