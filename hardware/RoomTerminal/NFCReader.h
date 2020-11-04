#pragma once

#include <Arduino.h>
#include <HkNfcRw.h>
#include <HkNfcF.h>
#include "GpioManager.h"
#include "DisplayManager.h"

//  Card IDm Length
#define IDM_MAX_LENGTH 16

// Detect ALL NFC SYSTEM CODE
//  0003 : Transit IC
//  FF00 : Credic Card / Student Card
#define NFC_SYSTEM_CODE 0xFFFF

class NFCReader
{
public:
  struct CardInfo
  {
    char idm[IDM_MAX_LENGTH + 1];
  };

  CardInfo card_info;

  void NFCInit(GpioManager *gpioManager, DisplayManager *displayManager);
  void resetNFC();
  bool readCard();

private:
  bool is_detected;
  GpioManager *gpioMan;
  DisplayManager *displayMan;

  bool pollingCard();
  bool readIDmFromCard(char *str_idm);
  void clearCardInfo();
  void printCardInfo();
};
