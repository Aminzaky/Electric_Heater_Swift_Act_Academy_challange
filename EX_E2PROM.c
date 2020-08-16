/** @file EX_E2PROM.c
 *  @brief Driver to communicate with external e2prom using I2C.
 *
 *  @author Amin zaky.
 *  @date 8 Jul 2020.
 *  @bug No known bugs.
 */

#include "Utils.h"
#include "Std_Types.h"
#include "I2C.h"
#include "EX_E2PROM.h"


void EEPROM_Write(uint8 address, uint8 data) {
    I2C_Master_Start();
    while (I2C_Master_Write(EEPROM_Address_W)) {
        I2C_Master_RepeatedStart();
    }
    I2C_Master_Write(address);
    I2C_Master_Write(data);
    I2C_Master_Stop();
}


uint8 EEPROM_Read(uint8 address) {
    uint8 Data;
    I2C_Master_Start();
    while (I2C_Master_Write(EEPROM_Address_W)) {
        I2C_Master_RepeatedStart();
    }
    I2C_Master_Write(address);
    I2C_Master_Start();
    I2C_Master_Write(EEPROM_Address_R);
    Data = I2C_Master_Read();
    I2C_Nack();
    I2C_Master_Stop();
    return Data;
}