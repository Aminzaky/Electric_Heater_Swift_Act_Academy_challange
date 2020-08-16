/** @file DIO_local.h
 *  @brief Defines for DIO registers used in GPIO driver.
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef DIO_LOCAL_H
#define	DIO_LOCAL_H

#define PORTA *((uint8*)(0x05))
#define PORTB *((uint8*)(0x06))
#define PORTC *((uint8*)(0x07))
#define PORTD *((uint8*)(0x08))
#define PORTE *((uint8*)(0x09))

#define TRISA *((uint8*)(0x85))
#define TRISB *((uint8*)(0x86))
#define TRISC *((uint8*)(0x87))
#define TRISD *((uint8*)(0x88))
#define TRISE *((uint8*)(0x89))
        
#endif	/* DIO_LOCAL_H */

