#include "NetworkManager.h"

void NetworkManager::NetworkInit(GpioManager *gpioManager, DisplayManager *displayManager)
{
    gpioMan = gpioManager;
    displayMan = displayManager;
    EEPROM.begin(sizeof(WIFI_CONFIG));

    // Read Wifi settings from EEPROM
    loadWifiConfig(&wifi_config);
    Serial.print("SSID : ");
    Serial.println(wifi_config.ssid);
    Serial.print("PASS : ");
    Serial.println(wifi_config.pass);
}

void NetworkManager::connectWifi()
{
    // Try to connect Wifi
    uint32_t check_count = 0;
    WiFi.begin(wifi_config.ssid, wifi_config.pass);

    Serial.print("Connecting to ");
    Serial.print(wifi_config.ssid);
    gpioMan->setLEDColor(GpioManager::Color::GREEN, 500);
    displayMan->DrawWifiConnection(wifi_config.ssid);

    while (WiFi.status() != WL_CONNECTED)
    {
        if (check_count % 50 == 0)
            Serial.print(".");

        check_count++;
        delay(10);
    }

    Serial.println("done.");
    gpioMan->setLEDColor(GpioManager::Color::GREEN, 0);
}

void NetworkManager::setupNTP()
{
    const long gmtOffset_sec = 9 * 3600;
    const int daylightOffset_sec = 0;
    configTime(gmtOffset_sec, daylightOffset_sec, wifi_config.ntps);
}

bool NetworkManager::getNTPTime(char *str_dt, uint8_t str_c)
{
    struct tm timeinfo;
    if (!getLocalTime(&timeinfo))
        return false;

    strftime(str_dt, str_c,
             "%Y-%m-%dT%H:%M:%S+09:00", &timeinfo);

    // Serial.print("[Info] Current Time : ");
    // Serial.println(str_dt);

    return true;
}

void NetworkManager::setWifiConfig(const char *ssid, const char *pass)
{
    // c++のstring世界からCのchar配列の世界へ持ってくる
    std::strcpy(wifi_config.ssid, ssid);
    std::strcpy(wifi_config.pass, pass);
    // 決め打ちntp&API設定
    std::strcpy(wifi_config.ntps, "ntp.nict.jp");
    std::strcpy(wifi_config.apis, "");

    storeWifiConfig(wifi_config);
}

void NetworkManager::loadWifiConfig(WIFI_CONFIG *buf)
{
    EEPROM.get<WIFI_CONFIG>(0, *buf);
}

void NetworkManager::storeWifiConfig(WIFI_CONFIG buf)
{
    EEPROM.put<WIFI_CONFIG>(0, buf);
    EEPROM.commit();
}
