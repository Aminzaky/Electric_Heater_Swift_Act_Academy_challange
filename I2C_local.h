/** @file I2C_local.h
 *  @brief Defines for I2C registers and interrupt register used in I2C driver.
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef I2C_LOCAL_H
#define	I2C_LOCAL_H

#define SSPSTAT *((uint8*)(0x94))
#define SSPCON *((uint8*)(0x14))
#define SSPCON2 *((uint8*)(0x91))
#define PIE1 *((uint8*)(0x8C))
#define PIR1 *((uint8*)(0x0C))
#define PIR2 *((uint8*)(0x0D))
#define SSPBUF *((uint8*)(0x13))
#define SSPADD *((uint8*)(0x93))

#define SMP 7
#define CKE 6
#define D_A 5
#define P 4
#define S 3
#define R_W 2
#define UA 1
#define BF 0

#define WCOL 7
#define SSPOV 6
#define SSPEN 5
#define CKP 4
#define SSPM3 3
#define SSPM2 2
#define SSPM1 1
#define SSPM0 0

#define GCEN 7
#define ACKSTAT 6
#define ACKDT 5
#define ACKEN 4
#define RCEN 3
#define PEN 2
#define RSEN  1
#define SEN 0

#define SSPIE 3

#define SSPIF 3

#define BCLIF 3


#endif	/* I2C_LOCAL_H */

