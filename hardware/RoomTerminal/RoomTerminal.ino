#include "GpioManager.h"
#include "NFCReader.h"
#include "NetworkManager.h"
#include "DisplayManager.h"
#include <U8g2lib.h>
#include <Wire.h>
#include <Arduino.h>

// OLED Library
U8G2_SSD1306_128X32_UNIVISION_1_HW_I2C oled(U8G2_R0, U8X8_PIN_NONE);

/// =======================================
///  UART Settings
/// =======================================
// Connected to PC via USB-Serial converter
#define UART0_BAUD 115200
// Connected to RC-S620/S NFC sensor
//        RX:IO16  TX:IO17
#define UART2_BAUD 115200

GpioManager gpioMan;
NFCReader nfcReader;
NetworkManager netMan;
DisplayManager dispMan;

char localtime_str[30];

void setup()
{
  Serial.begin(UART0_BAUD);
  Serial2.begin(UART2_BAUD);

  gpioMan.GpioInit();
  dispMan.DisplayInit(&oled, &gpioMan);
  nfcReader.NFCInit(&gpioMan, &dispMan);
  netMan.NetworkInit(&gpioMan, &dispMan);

  Serial.println("JPHACKS2020 NFC Program.");
  dispMan.DrawSplashScreen("1.1.0");
  gpioMan.setLEDColor(GpioManager::Color::GREEN, 0);

  // Conf Mode Check
  if (gpioMan.isConfMode())
  {
    netMan.enterConfigMode();
  }

  // Connect to Wifi
  netMan.connectWifi();
  netMan.setupNTP();
}

void loop()
{
  // Conf Mode Check
  if (gpioMan.isConfMode())
  {
    netMan.enterConfigMode();
  }

  // NTP
  if (!netMan.getNTPTime(localtime_str, 30))
    showNTPError();

  // New Arriving Card Process
  if (nfcReader.readCard())
  {
    gpioMan.setLEDColor(GpioManager::Color::GREEN, 50);

    // [TODO] AWS IoT MQTT Publish
    gpioMan.ringBuzzer(100);

    gpioMan.setLEDColor(GpioManager::Color::GREEN, 0);
    delay(1000);
  }

  // Display
  dispMan.DrawWaitCard(localtime_str);

  // Wifi Health Check
  if (WiFi.status() != WL_CONNECTED)
  {
    showWifiError();
    netMan.connectWifi();
  }
}

void showNTPError()
{
  Serial.println("=== NTP FAILED. ===");
  dispMan.DrawNTPError();
  gpioMan.ringBuzzer(2000);
}

void showWifiError()
{
  Serial.println("=== Wifi Discon. ===");
  dispMan.DrawWifiError();
  gpioMan.ringBuzzer(2000);
}
