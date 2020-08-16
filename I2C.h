/** @file I2C.h
 *  @brief Driver to control I2C peripheral.
 *
 *  This contains the prototypes for the console
 *  driver and eventually any macros, constants,
 *  or global variables you will need.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef I2C_H
#define	I2C_H

/** @brief initialization for I2C peripheral as a master this function must be called one time.
 *
 *  @param Void
 *  @return Void
 */
void I2C_Master_Init(void);
/** @brief start I2C communication as a master.
 *
 *  @param Void
 *  @return Void
 */
void I2C_Master_Start(void);
/** @brief repeated start I2C communication as a master.
 *
 *  @param Void
 *  @return Void
 */
void I2C_Master_RepeatedStart(void);
/** @brief wait for clear conditions and flags for the bus to start I2C communication as a master.
 *
 *  @param Void
 *  @return Void
 */
void I2C_Master_Wait(void);
/** @brief write data on I2C bus as a master.
 *
 *  @param data in uint8
 *  @return flag in uint8
 */
uint8 I2C_Master_Write(uint8 data);
/** @brief stop I2C communication as a master.
 *
 *  @param Void
 *  @return Void
 */
void I2C_Master_Stop(void);
/** @brief read data on I2C bus as a master.
 *
 *  @param Void
 *  @return data on the buffer in uint8
 */
uint8 I2C_Master_Read(void);
/** @brief enable acknowledge I2C bus as a master.
 *
 *  @param Void
 *  @return Void
 */
void I2C_Ack(void);
/** @brief disable acknowledge I2C bus as a master.
 *
 *  @param Void
 *  @return Void
 */
void I2C_Nack(void);


#endif	/* I2C_H */

