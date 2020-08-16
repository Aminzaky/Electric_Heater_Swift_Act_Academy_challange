/** @file TEMP.h
 *  @brief LM35 interface to Get temperature using ADC driver.
 *
 *   This contains the prototypes for the driver and eventually any macros, constants,
 *  or global variables you will need.
 *  
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef TEMP_H
#define	TEMP_H

#define TEMP_PIN 2

/** @brief temperature update in fixed ticks.
 *
 *  @param Void
 *  @return Void
 */
void UPDATE_TEMP(void);

#endif	/* TEMP_H */

