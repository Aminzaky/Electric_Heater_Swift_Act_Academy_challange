/** @file main.c
 *  @brief main function which includes the application of the project which runs in super loop using scheduler.
 *
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */


// INCLUDES
#include "configs.h"
#include "Utils.h"
#include "Std_Types.h"
#include "DIO.h"
#include "TMR0.h"
#include "ADC.h"
#include "TEMP.h"
#include "I2C.h"
#include "EX_E2PROM.h"
#include "SWITCH.h"
#include "SSD.h"
#include "DO.h"
#include "Scheduler.h"

/** @brief entrypoint and main function.
 *  
 *  This is the entrypoint for program.
 *  You will use this to run and call drivers and scheduler of your App.
 *  
 *  this app using scheduler and timer tick handler as application all tasks are called periodically.
 *
 * @param void
 * @return void
 */

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
