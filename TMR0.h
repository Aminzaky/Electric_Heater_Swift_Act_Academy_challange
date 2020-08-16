/** @file TMR0.h
 *  @brief Timer0 driver this driver to handle and configure timer.
 *
 *  This contains the prototypes for the driver and eventually any macros, constants,
 *  or global variables you will need.
 * 
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef TMR0_H
#define	TMR0_H
/** @brief initialization for TMR0 peripheral this function must be called one time.
 *
 *  @param Void
 *  @return Void
 */
void TMR_Init(void);
/** @brief start for TMR0 peripheral.
 *
 *  @param Void
 *  @return Void
 */
void TMR_Start(void);
/** @brief check for over flow flag.
 *
 *  @param Void
 *  @return flag in uint8
 */
uint8 TMR_CheckOverFlow(void);
/** @brief set call back function that will be called every tick and will handle some tasks.
 *
 *  @param pointer to function that will be called every tick or overflow interrupt.
 *  @return Void
 */
void TMR0_vidSetCallBack(void (*CallBack)(void));
/** @brief timer overflow ISR this function mustn't be called ever.
 *
 *  @param Void
 *  @return Void
 */
void __interrupt() TMR_Update(void); 

#endif	/* TMR0_H */

