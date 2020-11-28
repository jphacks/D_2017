#include "DisplayManager.h"

void DisplayManager::DisplayInit(U8G2_SSD1306_128X32_UNIVISION_1_HW_I2C *_u8g2, GpioManager *gpioManager)
{
    u8g2 = _u8g2;
    gpioMan = gpioManager;
    msg_flag = true;

    msgBlinker.attach(1.5f, blinkMsg, &msg_flag);
    u8g2->begin();
    u8g2->enableUTF8Print();
}

void DisplayManager::DrawSplashScreen(const char *version)
{
    u8g2->setFontDirection(0);
    u8g2->setDrawColor(1);
    u8g2->firstPage();
    do
    {
        u8g2->setFont(u8g2_font_luBIS08_tf);
        u8g2->setCursor(10, 8);
        u8g2->print("JPHACKS2020 Entrance");
        u8g2->setCursor(10, 18);
        u8g2->print("Tracking Recorder");

        u8g2->setFont(u8g2_font_profont12_mf);
        u8g2->setCursor(30, 32);
        u8g2->print("Ver,");
        u8g2->setCursor(60, 32);
        u8g2->print(version);
    } while (u8g2->nextPage());

    delay(2000);
}

void DisplayManager::DrawWifiConnection(char *SSID)
{
    u8g2->setFont(u8g2_font_profont12_mf);
    u8g2->setFontDirection(0);
    u8g2->firstPage();
    do
    {
        u8g2->setDrawColor(0);
        u8g2->setCursor(20, 10);
        u8g2->print(" Connect Wifi ");

        u8g2->setDrawColor(1);
        u8g2->setCursor(0, 26);
        u8g2->print(SSID);
    } while (u8g2->nextPage());
}

void DisplayManager::DrawWaitIoTCore()
{
    u8g2->setFont(u8g2_font_profont12_mf);
    u8g2->setFontDirection(0);
    u8g2->firstPage();
    do
    {
        u8g2->setDrawColor(0);
        u8g2->setCursor(20, 10);
        u8g2->print(" Connect IoT ");

        u8g2->setDrawColor(1);
        u8g2->setCursor(0, 26);
        u8g2->print("Waiting AWS IoT Core");
    } while (u8g2->nextPage());
}

void DisplayManager::DrawWaitSubscribe()
{
    u8g2->setFont(u8g2_font_profont12_mf);
    u8g2->setFontDirection(0);
    u8g2->firstPage();
    do
    {
        u8g2->setDrawColor(0);
        u8g2->setCursor(20, 10);
        u8g2->print(" Connect IoT ");

        u8g2->setDrawColor(1);
        u8g2->setCursor(0, 26);
        u8g2->print("Subscribing IoT Core");
    } while (u8g2->nextPage());
}

void DisplayManager::DrawWaitCard(char *dt_str)
{
    u8g2->setFont(u8g2_font_b16_t_japanese3);
    u8g2->setFontDirection(0);
    u8g2->setDrawColor(1);
    u8g2->firstPage();
    do
    {
        u8g2->setCursor(36, 15);
        u8g2->print("受付中");

        if (msg_flag)
        {
            u8g2->setCursor(8, 31);
            u8g2->print("ICカードタッチ");
        }
        else
        {
            u8g2->setCursor(32, 31);
            u8g2->print(dt_str);
        }

    } while (u8g2->nextPage());
}

void DisplayManager::DrawAsking(char *idm)
{
    u8g2->setFont(u8g2_font_b16_t_japanese3);
    u8g2->setFontDirection(0);
    u8g2->setDrawColor(1);
    u8g2->firstPage();
    do
    {
        u8g2->setCursor(16, 15);
        u8g2->print("問い合わせ中");
        u8g2->setCursor(0, 31);
        u8g2->print(idm);
    } while (u8g2->nextPage());
}

void DisplayManager::DrawCardResult(ENTRY_RESULT res)
{
    String msg;
    if (res == ACCEPT)
    {
        msg = "入室しました";
    }
    else if (res == EXIT)
    {
        msg = "退室しました";
    }
    else if (res == REJECT)
    {
        msg = "入室できません!!";
    }
    else if (res == UNKNOWN)
    {
        msg = "不正コマンド";
    }

    u8g2->setFont(u8g2_font_unifont_t_japanese1);
    u8g2->setFontDirection(0);
    u8g2->setDrawColor(1);
    u8g2->firstPage();
    do
    {
        u8g2->setCursor(32, 15);
        u8g2->print(" 判定結果 ");

        u8g2->setCursor(8, 31);
        u8g2->print(msg);

    } while (u8g2->nextPage());
}

void DisplayManager::DrawSetupMode()
{
    u8g2->setFont(u8g2_font_profont12_mf);
    u8g2->setFontDirection(0);
    u8g2->firstPage();
    do
    {
        u8g2->setFontMode(0);
        u8g2->setDrawColor(0);

        u8g2->setCursor(25, 9);
        u8g2->print(" Setup Mode ");

        u8g2->setDrawColor(1);
        u8g2->setCursor(0, 20);
        u8g2->print("Open App, configure");
        u8g2->setCursor(0, 32);
        u8g2->print("Wifi settings via BLE");
    } while (u8g2->nextPage());
}

void DisplayManager::DrawSetupFinish()
{
    u8g2->setFont(u8g2_font_profont12_mf);
    u8g2->setFontDirection(0);
    u8g2->firstPage();
    do
    {
        u8g2->setFontMode(0);
        u8g2->setDrawColor(0);

        u8g2->setCursor(25, 9);
        u8g2->print(" Setup Mode ");

        u8g2->setDrawColor(1);
        u8g2->setCursor(0, 21);
        u8g2->print("Setup Done!! Turn");
        u8g2->setCursor(0, 32);
        u8g2->print("switch and repower.");
    } while (u8g2->nextPage());
}

void DisplayManager::DrawWifiError()
{
    u8g2->setFont(u8g2_font_b16_t_japanese3);
    u8g2->setFontDirection(0);
    u8g2->setDrawColor(1);
    u8g2->firstPage();
    do
    {
        u8g2->setCursor(32, 15);
        u8g2->print("エラー");
        u8g2->setCursor(16, 31);
        u8g2->print("WiFi切断");
    } while (u8g2->nextPage());
}

void DisplayManager::DrawNTPError()
{
    u8g2->setFont(u8g2_font_b16_t_japanese3);
    u8g2->setFontDirection(0);
    u8g2->setDrawColor(1);
    u8g2->firstPage();
    do
    {
        u8g2->setCursor(32, 15);
        u8g2->print("エラー");
        u8g2->setCursor(16, 31);
        u8g2->print("NTP失敗");
    } while (u8g2->nextPage());
}

void DisplayManager::DrawIoTCoreError()
{
    u8g2->setFont(u8g2_font_b16_t_japanese3);
    u8g2->setFontDirection(0);
    u8g2->setDrawColor(1);
    u8g2->firstPage();
    do
    {
        u8g2->setCursor(32, 15);
        u8g2->print("エラー");
        u8g2->setCursor(0, 31);
        u8g2->print("IoT Core接続失敗");
    } while (u8g2->nextPage());
}

void blinkMsg(bool *flag)
{
    *flag = !*flag;
}
