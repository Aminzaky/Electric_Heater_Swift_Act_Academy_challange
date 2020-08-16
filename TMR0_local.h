/** @file TMR0_local.h
 *  @brief Defines for timer registers and interrupt register used in timer driver.
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef TMR0_LOCAL_H
#define	TMR0_LOCAL_H

#define TMR0 *((uint8*)(0x01))
#define INTCON *((uint8*)(0x0B))
#define OPTION_REG *((uint8*)(0x81))

#define GIE 7
#define PEIE 6
#define TMR0IE 5
#define INTE 4
#define RBIE 3
#define TMR0IF 2
#define INTF 1
#define RBIF 0

#define RBPU 7
#define INTEDG 6
#define T0CS 5
#define T0SE 4
#define PSA 3
#define PS2 2
#define PS1 1
#define PS0 0

#endif	/* TMR0_LOCAL_H */

