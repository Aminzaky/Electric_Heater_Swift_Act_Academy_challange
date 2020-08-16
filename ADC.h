/** @file ADC.h
 *  @brief Analog to digital conversion driver.
 *
 *  This contains the prototypes for the console
 *  driver and eventually any macros, constants,
 *  or global variables you will need.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */


#ifndef ADC_H
#define	ADC_H

/** @brief initialization for ADC driver will be used in the app this function must be called one time.
 *
 *  @param Void
 *  @return Void
 */
void ADC_Init(void);
/** @brief function ADC start conversion and read and return its value.
 *
 *  @param channel_number in uint8
 *  @return adc_register value in uint16
 */
uint16 ADC_Read(uint8 channel);

#endif	/* ADC_H */

