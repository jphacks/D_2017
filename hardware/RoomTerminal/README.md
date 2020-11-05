# 入退室受付読取機 - firmware

## Requirements

### Platform
- [ESP32-DevKitC](https://akizukidenshi.com/catalog/g/gM-11819/)
- [RC-S620S](https://www.switch-science.com/catalog/353/)

### Library
- [U8g2](https://github.com/olikraus/u8g2)
- [ArduinoHkNfcRw](https://github.com/hirokuma/ArduinoHkNfcRw)
    - ただし、ESP32向けに変更修正が必要なため、同梱の改変バージョンを使用のこと

## How to

### AWS IoT Core Certificates
[aws_certificates.cpp.sample](./aws_certificates.cpp.sample)を複製して、AWS IoT CoreからThingの証明書情報を`aws_certificates.cpp`として登録する。
