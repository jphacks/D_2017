#include <Arduino.h>

/// =======================================
///  UART Settings
/// =======================================
// Connected to PC via USB-Serial converter
#define UART0_BAUD 115200

void setup()
{
  Serial.begin(UART0_BAUD);

  Serial.println("COVID-19 NFC Program.");
}

void loop()
{
  
}
