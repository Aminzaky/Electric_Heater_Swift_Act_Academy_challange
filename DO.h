/** @file DO.h
 *  @brief file to map DIO with the pins which will be connected to the controller and will be controlled in the main function and scheduler. 
 *
 *  This contains the prototypes for the console
 *  driver and eventually any macros, constants,
 *  or global variables you will need.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef DO_H
#define	DO_H

#define HEATER_LED pin_B3
#define HEATER pin_C5
#define COOLER pin_C2

#define ON 1
#define OFF 0

/** @brief initialization for DO devices will be used in the app this function must be called one time.
 *
 *  @param Void
 *  @return Void
 */
void DO_Init(void);
/** @brief function for do devices to assign on and off states.
 *
 *  @param device in uint8
 *  @param state in uint8
 *  @return Void
 */
void DO_SetState(uint8 device ,uint8 state);

#endif	/* DO_H */

