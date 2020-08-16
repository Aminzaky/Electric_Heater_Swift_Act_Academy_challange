/** @file SWITCH.h
 *  @brief Switches driver using debouncing sampling technique to make sure the switch is pressed or released to avoid noise. 
 *
 *  This contains the prototypes for the console
 *  driver and eventually any macros, constants,
 *  or global variables you will need.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef SWITCH_H
#define	SWITCH_H

#define released 0
#define prepushed 1
#define pushed 2
#define prereleased 3

/** @brief initialization for switches will be used in the app this function must be called one time.
 *
 *  @param Void
 *  @return Void
 */
void sw_int();
/** @brief periodic task for switches will be used check and update switch states.
 *
 *  @param Void
 *  @return Void
 */
void sw_voidtask(void);



#endif	/* SWITCH_H */

