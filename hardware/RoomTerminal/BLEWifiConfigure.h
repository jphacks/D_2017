#ifndef _BLEWIFICONFIGURE_H_
#define _BLEWIFICONFIGURE_H_

#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>
#include <WiFi.h>
#include "NetworkManager.h"
#include "GpioManager.h"
#include "DisplayManager.h"

#define SERVICE_UUID "97269200-c2f1-47c9-9fa0-1c6ee87a5d6d"
#define CHARACTERISTIC_UUID_1 "6c9ed47e-3d7a-4477-8a43-3626c96c1fc8"
#define CHARACTERISTIC_UUID_2 "6c9ed47f-3d7a-4477-8a43-3626c96c1fc8"
#define BLE_DEVICE_NAME "CERS Reader"

class BLEWifiConfigure
{
public:
    void BLEWifiConfigureInit(GpioManager *gpioManager, DisplayManager *displayManager, NetworkManager *networkManager);
    void enterConfigMode();

private:
    std::string wifi_ssid;
    std::string wifi_password;
    bool is_wifi_set;

    GpioManager *gpioMan;
    DisplayManager *displayMan;
    NetworkManager *networkMan;

    class MyCallbacks1 : public BLECharacteristicCallbacks
    {
    public:
        MyCallbacks1(BLEWifiConfigure *configure);
        void onWrite(BLECharacteristic *pCharacteristic);

    private:
        BLEWifiConfigure *bleWifiConf;
    };

    class MyCallbacks2 : public BLECharacteristicCallbacks
    {
    public:
        MyCallbacks2(BLEWifiConfigure *configure);
        void onWrite(BLECharacteristic *pCharacteristic);

    private:
        BLEWifiConfigure *bleWifiConf;
    };
};

#endif
