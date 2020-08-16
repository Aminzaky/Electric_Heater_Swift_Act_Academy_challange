/** @file EX_E2PROM.h
 *  @brief Driver to communicate with external e2prom using I2C.
 *
 * This contains the prototypes for the console
 *  driver and eventually any macros, constants,
 *  or global variables you will need.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef EX_E2PROM_H
#define	EX_E2PROM_H

#define EEPROM_Address_W 0xA0
#define EEPROM_Address_R 0xA1

/** @brief write data on address in external e2prom.
 *
 *  @param adress in uint8
 *  @param data in uint8
 *  @return Void
 */
void EEPROM_Write(uint8 address, uint8 data);
/** @brief read data from address in external e2prom.
 *
 *  @param adress in uint8
 *  @return data in uint8
 */
uint8 EEPROM_Read(uint8 address);

#endif	/* EX_E2PROM_H */

