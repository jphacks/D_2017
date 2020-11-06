#include <Arduino.h>
#include <U8g2lib.h>
#include <Wire.h>
#include "GpioManager.h"
#include "NFCReader.h"
#include "NetworkManager.h"
#include "DisplayManager.h"
#include "BLEWifiConfigure.h"
#include "AWSIoTCore.h"

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
BLEWifiConfigure bleWifiConf;

char localtime_str[30];

void setup()
{
  Serial.begin(UART0_BAUD);
  Serial2.begin(UART2_BAUD);

  gpioMan.GpioInit();
  dispMan.DisplayInit(&oled, &gpioMan);
  nfcReader.NFCInit(&gpioMan, &dispMan);
  netMan.NetworkInit(&gpioMan, &dispMan);
  bleWifiConf.BLEWifiConfigureInit(&gpioMan, &dispMan, &netMan);

  Serial.println("JPHACKS2020 NFC Program.");
  dispMan.DrawSplashScreen("1.2.1");
  gpioMan.setLEDColor(GpioManager::Color::GREEN, 0);

  // Conf Mode Check
  if (gpioMan.isConfMode())
  {
    bleWifiConf.enterConfigMode();
    while (true)
      ;
  }

  // Connect to Wifi
  netMan.connectWifi();
  netMan.setupNTP();
  if (!setupIoTCore())
  {
    while (true)
      ;
  }

  entry_res = IDLE;
}

void loop()
{
  // NTP
  if (!netMan.getNTPTime(localtime_str, 30))
  {
    showNTPError();
    delay(5000);
    netMan.setupNTP();
  }

  // Check AWS IoT Core Connection
  if (!netMan.isIoTCoreConnected())
  {
    showIoTCoreError();
    delay(5000);
    setupIoTCore();
  }

  // New Arriving Card Process
  if (entry_res == IDLE)
  {
    dispMan.DrawWaitCard(localtime_str);

    if (nfcReader.readCard())
    {
      gpioMan.setLEDColor(GpioManager::Color::GREEN, 50);

      // AWS IoT MQTT Publish
      if (!netMan.publishToIoTCore(nfcReader.card_info.idm))
      {
        showIoTCoreError();
      }

      gpioMan.setLEDColor(GpioManager::Color::GREEN, 0);
    }
  }
  else if (entry_res != ASKING)
  {
    showCardResult();
    entry_res = IDLE;
  }

  // Wifi Health Check
  if (WiFi.status() != WL_CONNECTED)
  {
    showWifiError();
    netMan.connectWifi();
  }
}

bool setupIoTCore()
{
  if (!netMan.setupIoTCore())
  {
    showIoTCoreError();
    return false;
  }

  dispMan.DrawWaitSubscribe();
  // Wait for starting MQTT Client
  delay(2000);

  if (!setupIoTCoreSubscribe())
  {
    showIoTCoreError();
    return false;
  }

  return true;
}

void showCardResult()
{
  dispMan.DrawCardResult(entry_res);
  if (entry_res == REJECT || entry_res == UNKNOWN)
  {
    gpioMan.ringBuzzer(2000);
  }
  else
  {
    gpioMan.ringBuzzer(100);
    delay(1000);
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

void showIoTCoreError()
{
  Serial.println("=== AWS FAILED. ===");
  dispMan.DrawIoTCoreError();
  gpioMan.ringBuzzer(2000);
}
