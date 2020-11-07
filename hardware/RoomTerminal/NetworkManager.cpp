#include "NetworkManager.h"

void NetworkManager::NetworkInit(GpioManager *gpioManager, DisplayManager *displayManager)
{
    gpioMan = gpioManager;
    displayMan = displayManager;
    EEPROM.begin(sizeof(WIFI_CONFIG));

    // Read Wifi settings from EEPROM
    loadWifiConfig(&wifi_config);
    Serial.print("[Info] SSID : ");
    Serial.println(wifi_config.ssid);
    // Serial.print("[Info] PASS : ");
    // Serial.println(wifi_config.pass);
}

void NetworkManager::connectWifi()
{
    // Try to connect Wifi
    uint32_t check_count = 0;
    WiFi.begin(wifi_config.ssid, wifi_config.pass);

    Serial.print("[Info] Connecting to ");
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
    Serial.print("[Info] MAC Address : ");
    Serial.println(WiFi.macAddress());

    gpioMan->setLEDColor(GpioManager::Color::GREEN, 0);
}

void NetworkManager::setupNTP()
{
    timeClient = new NTPClient(ntpUDP, wifi_config.ntps, 32400, 60000);
    timeClient->begin();
}

bool NetworkManager::getNTPTime(char *str_dt, uint8_t str_c)
{
    timeClient->update();

    timeClient->getFormattedTime().toCharArray(str_dt, str_c);
    // Serial.println(timeClient->getFormattedTime());

    return true;
}

bool NetworkManager::setupIoTCore()
{
    displayMan->DrawWaitIoTCore();

    greengrass = new AWSGreenGrassIoT(AWSIOTURL, THING, aws_root_ca_pem, certificate_pem_crt, private_pem_key);
    if (!greengrass->connectToIoTCore())
    {
        return false;
    }

    Serial.println("[Info] Connected to AWS IoT core");

    return true;
}

bool NetworkManager::isIoTCoreConnected()
{
    return greengrass->isConnected();
}

bool NetworkManager::publishToIoTCore(char *idm)
{
    uint8_t RETRY_MAX = 3;

    // NTP update
    timeClient->update();

    // Generate payload JSON
    sprintf(payload, JSONPAYLOAD,
            idm, WiFi.macAddress().c_str(), timeClient->getEpochTime());

    // Publish
    for (uint8_t i = 0; i < RETRY_MAX; i++)
    {
        if (greengrass->publish(PUB_TOPIC_NAME, payload))
        {
            entry_res = ENTRY_RESULT::ASKING;

            Serial.print("[Info] Published Message : ");
            Serial.println(payload);
            // gpioMan->ringBuzzer(100);
            return true;
        }

        Serial.println("[Error] Publish failed");
        delay(200);
        // setupIoTCore();
    }

    return false;
}

void NetworkManager::setWifiConfig(const char *ssid, const char *pass)
{
    // c++のstring世界からCのchar配列の世界へ持ってくる
    std::strcpy(wifi_config.ssid, ssid);
    std::strcpy(wifi_config.pass, pass);
    // 決め打ちntp&API設定
    std::strcpy(wifi_config.ntps, "ntp.nict.jp");

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
