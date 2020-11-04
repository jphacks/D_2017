#pragma once

#include <Arduino.h>
#include <U8g2lib.h>
#include <Wire.h>
#include <Ticker.h>
#include "GpioManager.h"

void blinkMsg(bool *flag);

class DisplayManager
{
public:
    void DisplayInit(U8G2_SSD1306_128X32_UNIVISION_1_HW_I2C *_u8g2, GpioManager *gpioManager);
    void DrawSplashScreen(const char *version);
    void DrawWifiConnection(char *SSID);
    void DrawWaitCard(char *dt_str);
    void DrawCardInfo(char *idm);
    void DrawSetupMode();
    void DrawWifiError();
    void DrawNTPError();
private:
    U8G2_SSD1306_128X32_UNIVISION_1_HW_I2C *u8g2;
    GpioManager *gpioMan;
    Ticker msgBlinker;
    bool msg_flag;
};
