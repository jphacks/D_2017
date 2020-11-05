#include "NFCReader.h"

void NFCReader::NFCInit(GpioManager *gpioManager, DisplayManager *displayManager)
{
  gpioMan = gpioManager;
  displayMan = displayManager;

  // Init NFC reader
  if (!HkNfcRw::open())
  {
    // Show Error
    Serial.println("[Error] NFC Reader Init Failed.");
    while (true)
      ;
  }
  Serial.println("[Info] RC-S620S Connected.");

  clearCardInfo();
  is_detected = false;
}

void NFCReader::resetNFC()
{
  HkNfcRw::reset();
}

bool NFCReader::readCard()
{
  // Card Polling
  if (!pollingCard())
  {
    is_detected = false;
    return false;
  }

  // Work only first detection
  if (!is_detected)
  {
    clearCardInfo();

    if (!readIDmFromCard(card_info.idm))
    {
      return false;
    }

    // Detected Flag
    is_detected = true;

    printCardInfo();
  }
  else
  {
    return false;
  }

  return true;
}

bool NFCReader::pollingCard()
{
  // Detect NFC Felica
  return HkNfcF::polling(NFC_SYSTEM_CODE);
}

bool NFCReader::readIDmFromCard(char *str_idm)
{
  uint8_t uid[8];

  // Read Card IDm
  if (!HkNfcRw::getNfcId(uid))
  {
    return false;
  }

  char buf[100];
  int len = sizeof(buf) / sizeof(buf[0]);

  snprintf(str_idm, IDM_MAX_LENGTH + 1,
           "%02x%02x%02x%02x%02x%02x%02x",
           uid[0], uid[1], uid[2], uid[3], uid[4], uid[5], uid[6], uid[7]);

  return true;
}

void NFCReader::clearCardInfo()
{
  for (int i = 0; i < IDM_MAX_LENGTH; i++)
  {
    card_info.idm[i] = 0x00;
  }
}

void NFCReader::printCardInfo()
{
  // Console log
  Serial.print("[Info] Card IDm   : ");
  Serial.println(card_info.idm);
  displayMan->DrawCardInfo(card_info.idm);
}
