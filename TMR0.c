/** @file TMR0.c
 *  @brief Timer0 driver this driver to handle and configure timer.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */


#include "Utils.h"
#include "Std_Types.h"
#include "TMR0_local.h"
#include "TMR0_config.h"
#include "TMR0.h"
#include "SWITCH.h"

void (*CallBack_ptr)(void);


void TMR_Init(void) {
    int prescale = PRESCALER;

    //TMR_SET_PRESCALER
    switch (prescale) {
        case 2:
            CLRBIT(OPTION_REG, PS0);
            CLRBIT(OPTION_REG, PS1);
            CLRBIT(OPTION_REG, PS2);
            CLRBIT(OPTION_REG, PSA);
            break;
        case 4:
            SETBIT(OPTION_REG, PS0);
            CLRBIT(OPTION_REG, PS1);
            CLRBIT(OPTION_REG, PS2);
            CLRBIT(OPTION_REG, PSA);
            break;
        case 8:
            CLRBIT(OPTION_REG, PS0);
            SETBIT(OPTION_REG, PS1);
            CLRBIT(OPTION_REG, PS2);
            CLRBIT(OPTION_REG, PSA);
            break;
        case 16:
            SETBIT(OPTION_REG, PS0);
            SETBIT(OPTION_REG, PS1);
            CLRBIT(OPTION_REG, PS2);
            CLRBIT(OPTION_REG, PSA);
            break;
        case 32:
            CLRBIT(OPTION_REG, PS0);
            CLRBIT(OPTION_REG, PS1);
            SETBIT(OPTION_REG, PS2);
            CLRBIT(OPTION_REG, PSA);
            break;
        case 64:
            SETBIT(OPTION_REG, PS0);
            CLRBIT(OPTION_REG, PS1);
            SETBIT(OPTION_REG, PS2);
            CLRBIT(OPTION_REG, PSA);
            break;
        case 128:
            CLRBIT(OPTION_REG, PS0);
            SETBIT(OPTION_REG, PS1);
            SETBIT(OPTION_REG, PS2);
            CLRBIT(OPTION_REG, PSA);
            break;
        case 256:
            SETBIT(OPTION_REG, PS0);
            SETBIT(OPTION_REG, PS1);
            SETBIT(OPTION_REG, PS2);
            CLRBIT(OPTION_REG, PSA);
            break;
    }
    CLRBIT(OPTION_REG, T0CS);
    CLRBIT(OPTION_REG, T0SE);
}


void TMR_Start(void) {

    //TMR_ENABLE_INTERRUPT
    SETBIT(INTCON, TMR0IE);
    //GLOBAL_INTERRUPT_ENABLE
    SETBIT(INTCON, GIE);
    //PRE_INTERRUPT_ENABLE
    SETBIT(INTCON, PEIE);
    //TMR_CLEAR_FLAG
    CLRBIT(INTCON, TMR0IF);
    //TMR_UPDATE_REGISTER(TMR_TICK_MS)
    ASSIGPORT(TMR0, (uint8) ((256 + 2)-(((F_OSC_MHZ * TMR_TICK_MS) / (PRESCALER))*250.0)));

}


void TMR0_vidSetCallBack(void (*CallBack)(void)) {
    CallBack_ptr = CallBack;
}


uint8 TMR_CheckOverFlow(void) {
    return GETBIT(INTCON, TMR0IF);
}

/** @brief timer overflow ISR.
 *
 *  @param Void
 *  @return Void
 */
void __interrupt() TMR_Update(void) {

    //TMR_CLEAR_FLAG
    CLRBIT(INTCON, TMR0IF);
    //TMR_UPDATE_REGISTER(TMR_TICK_MS)
    ASSIGPORT(TMR0, (uint8) ((256 + 2)-(((F_OSC_MHZ * TMR_TICK_MS) / (PRESCALER))*250.0)));
    //STATUS_UPDATE
    CallBack_ptr();


}

