#include <Arduino.h>
#include <bluefruit.h>
#include <stdint.h>
#include <math.h>
#include <Wire.h>
#include "I2C_16.h"
#include "TMP006.h"

// Define UUID
#define USER_SERVICE_UUID "c1d6b6e1-bdac-448f-b4fc-246faa3aecf8"
#define READ_CHARACTERISTIC_UUID "f91c7889-5013-446c-a998-431dd46a4d0c"
#define NOTIFY_CHARACTERISTIC_UUID "5be192ff-86b7-4764-b798-d5354a097d39"

// Service & Characteristic
BLEService        thermometerService;
BLECharacteristic testNotifyCharacteristic;
BLECharacteristic testReadCharacteristic;

// TMP006 SETTING
uint8_t sensor1 = 0x41; // I2C address of TMP006, can be 0x40-0x47
uint16_t samples = TMP006_CFG_8SAMPLE; // # of samples per reading, can be 1/2/4/8/16

void setup()
{
  Serial.begin(9600);
  
  Serial.println("------------------------------------");
  Serial.println("JPHACKS2020 CERS Thermometer Program");
  Serial.println("      TEAM: 893PRO feat. 3^5");
  Serial.println("------------------------------------");

  // Set I2C PINS
  Wire.setPins(4, 5);
  config_TMP006(sensor1, samples);

  // Initialise the Bluefruit module
  Bluefruit.begin();
  Bluefruit.setTxPower(4);    // Check bluefruit.h for supported values

  // Set the advertised device name (keep it short!)
  Bluefruit.setName("JPHACKS2020");

  // Set the connect/disconnect callback handlers
  Bluefruit.Periph.setConnectCallback(connect_callback);
  Bluefruit.Periph.setDisconnectCallback(disconnect_callback);

  // Setup the Heart Rate Monitor service using
  // BLEService and BLECharacteristic classes
  Serial.println("Configuring the Heart Rate Monitor Service");
  setupTestService();

  // Set up and start advertising
  startAdv();
}


void startAdv(void)
{  
  // Advertising packet
  Bluefruit.Advertising.addFlags(BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE);
  Bluefruit.Advertising.addTxPower();
  Bluefruit.Advertising.addName();

  // Include HRM Service UUID
  Bluefruit.Advertising.addService(thermometerService);

  Bluefruit.Advertising.restartOnDisconnect(true);
  Bluefruit.Advertising.setInterval(32, 244);    // in unit of 0.625 ms
  Bluefruit.Advertising.setFastTimeout(30);      // number of seconds in fast mode
  Bluefruit.Advertising.start(0);                // 0 = Don't stop advertising after n seconds  
}

void setupTestService(void)
{
  uint8_t userServiceUUID[16];
  uint8_t notifyCharacteristicUUID[16];
  uint8_t readCharacteristicUUID[16];

  strUUID2Bytes(USER_SERVICE_UUID, userServiceUUID);
  strUUID2Bytes(NOTIFY_CHARACTERISTIC_UUID, notifyCharacteristicUUID);
  strUUID2Bytes(READ_CHARACTERISTIC_UUID, readCharacteristicUUID);

  thermometerService = BLEService(userServiceUUID);
  thermometerService.begin();

  // Notify CONFIG
  testNotifyCharacteristic = BLECharacteristic(notifyCharacteristicUUID);
  testNotifyCharacteristic.setProperties(CHR_PROPS_NOTIFY);
  testNotifyCharacteristic.setPermission(SECMODE_OPEN, SECMODE_NO_ACCESS);
  testNotifyCharacteristic.setMaxLen(4);
  testNotifyCharacteristic.begin();

  // GET Bluetooth MAC Address
  static ble_gap_addr_t mac_addr;
  uint32_t err_code;
  err_code = sd_ble_gap_addr_get(&mac_addr);
  char macAddress[18];
  sprintf(macAddress, "%x:%x:%x:%x:%x:%x\r\n", mac_addr.addr[5], mac_addr.addr[4], mac_addr.addr[3], mac_addr.addr[2], mac_addr.addr[1], mac_addr.addr[0]);
  // SEND Bluetooth MAC Address
  testReadCharacteristic = BLECharacteristic(readCharacteristicUUID);
  testReadCharacteristic.setProperties(CHR_PROPS_READ);
  testReadCharacteristic.setPermission(SECMODE_OPEN, SECMODE_NO_ACCESS);
  testReadCharacteristic.setFixedLen(17);
  testReadCharacteristic.begin(); 
  testReadCharacteristic.write(macAddress,17);
}

void connect_callback(uint16_t conn_handle)
{
  // Get the reference to current connection
  BLEConnection* connection = Bluefruit.Connection(conn_handle);

  char central_name[32] = { 0 };
  connection->getPeerName(central_name, sizeof(central_name));

  Serial.print("Connected to ");
  Serial.println(central_name);
}

void disconnect_callback(uint16_t conn_handle, uint8_t reason)
{
  (void) conn_handle;
  (void) reason;

  Serial.print("Disconnected, reason = 0x"); Serial.println(reason, HEX);
  Serial.println("Advertising!");
}

void loop()
{
  // GET TEMP
  float object_temp = readObjTempC(sensor1);
  Serial.print("Object Temperature: "); 
  Serial.print(object_temp); Serial.println("*C");

  // SEND BLE
  char sendtempdata[5];
  sprintf(sendtempdata, "%2.1f", object_temp);

  if ( Bluefruit.connected() ) {      
    // Note: We use .notify instead of .write!
    // If it is connected but CCCD is not enabled
    // The characteristic's value is still updated although notification is not sent
    if ( testNotifyCharacteristic.notify(sendtempdata, 4) ){
      Serial.println("Notify SUCCESS"); 
    }else{
      Serial.println("ERROR: Notify not set in the CCCD or not connected!");
    }
  }

  delay(2000); // delay 1 second for every 4 samples per reading
}

/* UUID Converter */
void strUUID2Bytes(String strUUID, uint8_t binUUID[]) {
  String hexString = String(strUUID);
  hexString.replace("-", "");

  for (int i = 16; i != 0 ; i--) {
    binUUID[i - 1] = hex2c(hexString[(16 - i) * 2], hexString[((16 - i) * 2) + 1]);
  }
}

char hex2c(char c1, char c2) {
  return (nibble2c(c1) << 4) + nibble2c(c2);
}

char nibble2c(char c) {
  if ((c >= '0') && (c <= '9'))
    return c - '0';
  if ((c >= 'A') && (c <= 'F'))
    return c + 10 - 'A';
  if ((c >= 'a') && (c <= 'f'))
    return c + 10 - 'a';
  return 0;
}
