#pragma once

#include <Arduino.h>
#include <EEPROM.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <NTPClient.h>
#include <AWSGreenGrassIoT.h>
#include <cstring>
#include "GpioManager.h"
#include "DisplayManager.h"
#include "NFCReader.h"

#define SSID_MAX_LEN 32
#define PASS_MAX_LEN 63
#define NTPS_MAX_LEN 128
#define APIS_MAX_LEN 256

extern const char aws_root_ca[];
extern const char thingCA[];
extern const char thingKey[];
extern const char AWSIOTURL[];
extern const char THING[];

class NetworkManager
{
public:
    struct WIFI_CONFIG
    {
        char ssid[SSID_MAX_LEN + 1];
        char pass[PASS_MAX_LEN + 1];
        char ntps[NTPS_MAX_LEN + 1];
        char apis[APIS_MAX_LEN + 1];
    };

    void NetworkInit(GpioManager *gpioManager, DisplayManager *displayManager);
    void connectWifi();
    void setupNTP();
    bool getNTPTime(char *str_dt, uint8_t str_c);
    bool setupIoTCore();
    bool isIoTCoreConnected();
    void setWifiConfig(const char *ssid, const char *pass);

private:
    WIFI_CONFIG wifi_config;
    GpioManager *gpioMan;
    DisplayManager *displayMan;

    // AWS GreenGrass IoT Core
    WiFiUDP ntpUDP;
    NTPClient *timeClient;
    AWSGreenGrassIoT *greengrass;

    void loadWifiConfig(WIFI_CONFIG *buf);
    void storeWifiConfig(WIFI_CONFIG buf);
    void readUARTnoTimeout(char *buf, int max_length, bool repeat);
};
