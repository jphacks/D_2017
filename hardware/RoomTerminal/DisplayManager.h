#ifndef _DISPLAYMANAGER_H_
#define _DISPLAYMANAGER_H_

#include <Arduino.h>
#include <U8g2lib.h>
#include <Wire.h>
#include <Ticker.h>
#include "GpioManager.h"
#include "AWSIoTCore.h"

void blinkMsg(bool *flag);

class DisplayManager
{
public:
    void DisplayInit(U8G2_SSD1306_128X32_UNIVISION_1_HW_I2C *_u8g2, GpioManager *gpioManager);
    void DrawSplashScreen(const char *version);
    void DrawWifiConnection(char *SSID);
    void DrawWaitIoTCore();
    void DrawWaitSubscribe();
    void DrawWaitCard(char *dt_str);
    void DrawAsking(char *idm);
    void DrawCardResult(ENTRY_RESULT res);
    void DrawSetupMode();
    void DrawSetupFinish();
    void DrawWifiError();
    void DrawNTPError();
    void DrawIoTCoreError();
private:
    U8G2_SSD1306_128X32_UNIVISION_1_HW_I2C *u8g2;
    GpioManager *gpioMan;
    Ticker msgBlinker;
    bool msg_flag;
};

#endif
