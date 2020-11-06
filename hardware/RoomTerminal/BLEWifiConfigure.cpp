#include "BLEWifiConfigure.h"

void BLEWifiConfigure::BLEWifiConfigureInit(GpioManager *gpioManager, DisplayManager *displayManager, NetworkManager *networkManager)
{
    gpioMan = gpioManager;
    displayMan = displayManager;
    networkMan = networkManager;
}

void BLEWifiConfigure::enterConfigMode()
{
    BLEDevice::init(BLE_DEVICE_NAME);
    BLEServer *pServer = BLEDevice::createServer();
    BLEService *pService = pServer->createService(SERVICE_UUID);
    BLECharacteristic *pCharacteristic1 = pService->createCharacteristic(
        CHARACTERISTIC_UUID_1,
        BLECharacteristic::PROPERTY_READ |
            BLECharacteristic::PROPERTY_WRITE);
    BLECharacteristic *pCharacteristic2 = pService->createCharacteristic(
        CHARACTERISTIC_UUID_2,
        BLECharacteristic::PROPERTY_READ |
            BLECharacteristic::PROPERTY_WRITE);
    pCharacteristic1->setCallbacks(new BLEWifiConfigure::MyCallbacks1(this));
    pCharacteristic1->setValue("Input SSID");
    pCharacteristic2->setCallbacks(new BLEWifiConfigure::MyCallbacks2(this));
    pCharacteristic2->setValue("Input Password");

    BLEAdvertising *pAdvertising = pServer->getAdvertising();

    is_wifi_set = false;
    displayMan->DrawSetupMode();

    if (wifi_ssid == "" || wifi_password == "")
    {
        Serial.println("Waiting Wifi SSID & PASS via BLE...");
        pService->start();
        pAdvertising->start();
        while (!is_wifi_set)
        {
            delay(1000);
            Serial.print(".");
        }
        pAdvertising->stop();
        pService->stop();
    }

    networkMan->setWifiConfig(wifi_ssid.c_str(), wifi_password.c_str());

    displayMan->DrawSetupFinish();
}

BLEWifiConfigure::MyCallbacks1::MyCallbacks1(BLEWifiConfigure *configure)
{
    bleWifiConf = configure;
}

void BLEWifiConfigure::MyCallbacks1::onWrite(BLECharacteristic *pCharacteristic)
{
    bleWifiConf->wifi_ssid = pCharacteristic->getValue();
    Serial.print("SSID:");
    Serial.println(bleWifiConf->wifi_ssid.c_str());
}

BLEWifiConfigure::MyCallbacks2::MyCallbacks2(BLEWifiConfigure *configure)
{
    bleWifiConf = configure;
}

void BLEWifiConfigure::MyCallbacks2::onWrite(BLECharacteristic *pCharacteristic)
{
    bleWifiConf->wifi_password = pCharacteristic->getValue();
    Serial.print("Password:");
    Serial.println(bleWifiConf->wifi_password.c_str());

    bleWifiConf->is_wifi_set = true;
}
