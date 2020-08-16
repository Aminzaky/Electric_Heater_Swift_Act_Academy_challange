/** @file SSD.h
 *  @brief Drive two seven segments display and interface. 
 *
 * This contains the prototypes for the console
 *  driver and eventually any macros, constants,
 *  or global variables you will need.
 * 
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef SSD_H
#define	SSD_H

/** @brief initialization for 7segment display.
 *
 *  @param Void
 *  @return Void
 */
void SSD_Init(void);
/** @brief display data on 7segments.
 *
 *  @param display_no in uint8
 *  @param number to be displayed in uint8
 *  @return Void
 */
void SSD_Display(uint8 display_no, uint8 number);
/** @brief Turn Off 7segments.
 *
 *  @param Void
 *  @return Void
 */
void SSD_OFF(void);

#endif	/* SSD_H */

