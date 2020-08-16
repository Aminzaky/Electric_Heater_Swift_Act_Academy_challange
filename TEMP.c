/** @file TEMP.c
 *  @brief LM35 interface to Get temperature using ADC driver.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#include "Utils.h"
#include "Std_Types.h"
#include "TEMP.h"
#include "ADC.h"

uint8 temp;


void UPDATE_TEMP(void) {
    uint16 val=0;
    val=ADC_Read(TEMP_PIN);
    temp=(uint8)(val*(500.0/1024.0));
}