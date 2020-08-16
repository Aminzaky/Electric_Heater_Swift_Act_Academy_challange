/** @file DIO.h
 *  @brief General purpose digital input/output driver.
 *
 *  This contains the prototypes for the console
 *  driver and eventually any macros, constants,
 *  or global variables you will need.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */


#ifndef DIO_H
#define	DIO_H

/* Pin directions */
#define Input 			1
#define Output			0

#define HIGH 			1
#define LOW			    0

/* PORTS */
#define PORT_A	0
#define PORT_B	1
#define PORT_C	2
#define PORT_D	3
#define PORT_E	4

/* Port Pins */
#define pin_A0	0
#define pin_A1	1
#define pin_A2	2
#define pin_A3	3
#define pin_A4	4
#define pin_A5	5


#define pin_B0	8
#define pin_B1	9
#define pin_B2	10
#define pin_B3	11
#define pin_B4	12
#define pin_B5	13
#define pin_B6	14
#define pin_B7	15

#define pin_C0	16
#define pin_C1	17
#define pin_C2	18
#define pin_C3	19
#define pin_C4	20
#define pin_C5	21
#define pin_C6	22
#define pin_C7	23

#define pin_D0	24
#define pin_D1	25
#define pin_D2	26
#define pin_D3	27
#define pin_D4	28
#define pin_D5	29
#define pin_D6	30
#define pin_D7	31

#define pin_E0	32
#define pin_E1	33
#define pin_E2	34


/** @brief initialization for DIO PORT will be used in the app.
 *
 *  @param Port number in uint8
 *  @param Port direction input or output in uint8
 *  @return Void
 */
void DIO_voidInitPort(uint8 Port, uint8 Dir);
/** @brief function to assign value to a port.
 *
 *  @param Port number in uint8
 *  @param value to be assigned in uint8
 *  @return Void
 */
void DIO_voidWritePortValue(uint8 Port, uint8 value);
/** @brief function to read value from a port.
 *
 *  @param Port number in uint8
 *  @return value of the Port in uint8
 */
uint8 DIO_U8ReadPortValue(uint8 Port);

/** @brief initialization for DIO PIN will be used in the app.
 *
 *  @param pin number in uint8
 *  @param pin direction input or output in uint8
 *  @return Void
 */
void DIO_voidInitPin(uint8 pin_num, uint8 Dir);
/** @brief function to assign value to a DIO pin.
 *
 *  @param pin number in uint8
 *  @param value to be assigned in uint8
 *  @return Void
 */
void DIO_voidWritePinValue(uint8 pin_num, uint8 value);
/** @brief function to read value from a DIO pin.
 *
 *  @param pin number in uint8
 *  @return value of the pin in uint8
 */
uint8 DIO_U8ReadPinValue(uint8 pin_num);


#endif	/* DIO_H */

