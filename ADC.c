/** @file ADC.c
 *  @brief Analog to digital conversion driver.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#include "Utils.h"
#include "Std_Types.h"
#include "DIO_local.h"
#include "ADC_local.h"
#include "ADC.h"


void ADC_Init(void) {

    /* Flush ADC output Register */
    CLRPORT(ADRESH);
    CLRPORT(ADRESL);
    /*A/D Conversion Clock Select bits*/
    SETBIT(ADCON0, ADCS0);
    SETBIT(ADCON0, ADCS1);
    SETBIT(ADCON1, ADCS2);
    /*A/D Port Configuration Control bits*/
    CLRBIT(ADCON1, PCFG3);
    CLRBIT(ADCON1, PCFG2);
    CLRBIT(ADCON1, PCFG1);
    CLRBIT(ADCON1, PCFG0);
    /*A/D Result Format Select bit*/
    SETBIT(ADCON1, ADFM); //Right justified//
}


uint16 ADC_Read(uint8 channel) {

    uint8 A = GETPORT(TRISA);
    uint8 E = GETPORT(TRISE);
    uint16 ADC_result = 0;
    
    ASSIGPORT(TRISA, 0xFF);
    ASSIGPORT(TRISE, 0xFF);

    /* Flush ADC output Register */
    CLRPORT(ADRESH);
    CLRPORT(ADRESL);

    switch (channel) {
        case 0:
            ASSIGNBIT(ADCON0, CHS0, 0);
            ASSIGNBIT(ADCON0, CHS1, 0);
            ASSIGNBIT(ADCON0, CHS2, 0);
            break;
        case 1:
            ASSIGNBIT(ADCON0, CHS0, 1);
            ASSIGNBIT(ADCON0, CHS1, 0);
            ASSIGNBIT(ADCON0, CHS2, 0);
            break;
        case 2:
            ASSIGNBIT(ADCON0, CHS0, 0);
            ASSIGNBIT(ADCON0, CHS1, 1);
            ASSIGNBIT(ADCON0, CHS2, 0);
            break;
        case 3:
            ASSIGNBIT(ADCON0, CHS0, 1);
            ASSIGNBIT(ADCON0, CHS1, 1);
            ASSIGNBIT(ADCON0, CHS2, 0);
            break;
        case 4:
            ASSIGNBIT(ADCON0, CHS0, 0);
            ASSIGNBIT(ADCON0, CHS1, 0);
            ASSIGNBIT(ADCON0, CHS2, 1);
            break;
        case 5:
            ASSIGNBIT(ADCON0, CHS0, 1);
            ASSIGNBIT(ADCON0, CHS1, 0);
            ASSIGNBIT(ADCON0, CHS2, 1);
            break;
        case 6:
            ASSIGNBIT(ADCON0, CHS0, 0);
            ASSIGNBIT(ADCON0, CHS1, 1);
            ASSIGNBIT(ADCON0, CHS2, 1);
            break;
        case 7:
            ASSIGNBIT(ADCON0, CHS0, 1);
            ASSIGNBIT(ADCON0, CHS1, 1);
            ASSIGNBIT(ADCON0, CHS2, 1);
            break;
    }

    /*Enable ADC and start conversion*/
    SETBIT(ADCON0, ADON);
    SETBIT(ADCON0, GO);

    /* Wait for End of conversion i.e. Go/done'=0 conversion completed */
    while (GETBIT(ADCON0, GO) == 1);

    ADC_result = GETPORT(ADRESL) + GETPORT(ADRESH)*256;

    ASSIGPORT(TRISA, A);
    ASSIGPORT(TRISE, E);

    /*Disable ADC*/
    CLRBIT(ADCON0, ADON);

    return ADC_result;
}