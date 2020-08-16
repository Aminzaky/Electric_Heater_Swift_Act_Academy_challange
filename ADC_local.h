/** @file ADC_local.h
 *  @brief Defines for I2C registers and interrupt register used in I2C driver.
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#ifndef ADC_LOCAL_H
#define	ADC_LOCAL_H

#define INTCON *((uint8*)(0x0B))
#define PIR1 *((uint8*)(0x0C))
#define PIE1 *((uint8*)(0x8C))
#define ADCON0 *((uint8*)(0x1F))
#define ADCON1 *((uint8*)(0x9F))
#define ADRESH *((uint8*)(0x1E))
#define ADRESL *((uint8*)(0x9E))

#define GIE  7
#define PEIE 6

#define ADIF 6

#define ADIE 6

#define ADCS1 7
#define ADCS0 6
#define CHS2 5
#define CHS1 4
#define CHS0 3
#define GO 2
#define ADON 0

#define ADFM 7
#define ADCS2 6
#define PCFG3 3
#define PCFG2 2
#define PCFG1 1
#define PCFG0 0

#endif	/* ADC_LOCAL_H */

