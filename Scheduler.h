/** @file Scheduler.h
 *  @brief Scheduler of the system which handle TMR0 tick count and call apps. 
 *
 *  This contains the prototypes for the console
 *  driver and eventually any macros, constants,
 *  or global variables you will need.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef SCHEDULER_H
#define	SCHEDULER_H


#define OFF 0
#define OP 1
#define SET 2

/** @brief initialization for scheduler to do some initial actions before starting the app.
 *
 *  @param Void
 *  @return Void
 */
void Sch_Init(void);
/** @brief Start for scheduler to enter the super loop of the app.
 *
 *  @param Void
 *  @return Void
 */
void Sch_Start(void);
/** @brief Tick handler of the TMR0 tick that handle some Tasks and update status in fixed periods.
 *
 *  @param Void
 *  @return Void
 */
void Sch_UpdateTick_Handler(void);



#endif	/* SCHEDULER_H */

