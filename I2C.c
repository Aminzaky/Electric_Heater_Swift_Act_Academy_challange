/** @file I2C.c
 *  @brief Driver to control I2C peripheral.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#include "Utils.h"
#include "Std_Types.h"
#include "DIO_local.h"
#include "I2C_local.h"
#include "I2C_config.h"
#include "I2C.h"


void I2C_Master_Init(void) {

    /* Set up I2C lines by setting as input */
    SETBIT(TRISC, 3);
    SETBIT(TRISC, 4);
    /* Slew rate disabled, other bits are cleared by default*/
    SETBIT(SSPSTAT, SMP);
    /* Enable SSP port for I2C Master mode,clock = FOSC / (4 * (SSPADD+1))*/
    SETBIT(SSPCON, SSPEN);
    SETBIT(SSPCON, SSPM3);
    CLRBIT(SSPCON, SSPM2);
    CLRBIT(SSPCON, SSPM1);
    CLRBIT(SSPCON, SSPM0);
    CLRPORT(SSPCON2);
    /* Clock Assignment */
    ASSIGPORT(SSPADD, ((crystal_MHz * 1000000) / (4 * clock)) - 1);

}


void I2C_Master_Start(void) {

    I2C_Master_Wait();
    /* Send start pulse */
    SETBIT(SSPCON2, SEN);
}


void I2C_Master_RepeatedStart() {
    I2C_Master_Wait();
    /* Send repeated start pulse */
    SETBIT(SSPCON2, RSEN);
}


void I2C_Master_Wait(void) {

    /* Wait for operation complete (all Idle states)*/
    while (GETBIT(SSPSTAT, R_W) || GETBIT(SSPCON2, SEN) || GETBIT(SSPCON2, RSEN) || GETBIT(SSPCON2, PEN) || GETBIT(SSPCON2, RCEN) || GETBIT(SSPCON2, ACKEN));
}


uint8 I2C_Master_Write(uint8 data) {

    I2C_Master_Wait();
    /* Write data to SSPBUF*/
    ASSIGPORT(SSPBUF, data);
    while (GETBIT(PIR1, SSPIF) == 0);
    CLRBIT(PIR1, SSPIF);
    /* Check for acknowledge bit*/
    return (GETBIT(SSPCON2, ACKSTAT));
}


void I2C_Master_Stop() {

    I2C_Master_Wait();
    /* Stop communication*/
    SETBIT(SSPCON2, PEN);


}


uint8 I2C_Master_Read(void) {

    int buffer = 0;
    I2C_Master_Wait();
    /* Enable receive */
    SETBIT(SSPCON2, RCEN);
    /* Wait for buffer full flag which when complete byte received */
    while (GETBIT(PIR1, SSPIF) == 0);
    CLRBIT(PIR1, SSPIF);

    I2C_Master_Wait();
    /* Copy SSPBUF to buffer */
    buffer = GETPORT(SSPBUF);

    return (buffer);
}


void I2C_Ack(void) {

    /* Acknowledge data 1:NACK,0:ACK */
    CLRBIT(SSPCON2, ACKDT);
    I2C_Master_Wait();
    /* Enable ACK to send */
    SETBIT(SSPCON2, ACKEN);


}


void I2C_Nack(void) {
    /* Acknowledge data 1:NACK,0:ACK */
    SETBIT(SSPCON2, ACKDT);
    I2C_Master_Wait();
    /* Enable NACK to send */
    SETBIT(SSPCON2, ACKEN);

}