#include "./GpioManager.h"

void GpioManager::GpioInit()
{
  // Switch
  pinMode(SW_MODE, INPUT_PULLUP);
  pinMode(SW_CONF, INPUT_PULLUP);

  // LED
  pinMode(LED_GRN, OUTPUT);
  digitalWrite(LED_GRN, LOW);
  pinMode(LED_RED, OUTPUT);
  digitalWrite(LED_RED, LOW);

  // Buzzer
  pinMode(BUZ_PIN, OUTPUT);
  digitalWrite(BUZ_PIN, LOW);

  // Reset color
  setLEDColor(Color::None, 0);
}

void GpioManager::setLEDColor(Color color, uint32_t pace_ms)
{
  current_color = color;
  ledBlinker.detach();

  digitalWrite(LED_GRN, color & 1);
  digitalWrite(LED_RED, (color >> 1) & 1);

  if (pace_ms > 0)
  {
    ledBlinker.attach_ms(pace_ms, blinkLED, (uint8_t)current_color);
  }
}

bool GpioManager::isConfMode()
{
  return !digitalRead(SW_CONF);
}

void GpioManager::buzzerOn()
{
  digitalWrite(BUZ_PIN, HIGH);
}

void GpioManager::buzzerOff()
{
  digitalWrite(BUZ_PIN, LOW);
}

void GpioManager::ringBuzzer(uint32_t bz_time)
{
  buzzerOn();
  delay(bz_time);
  buzzerOff();
}

void blinkLED(uint8_t color)
{
  if (color & 1)
    digitalWrite(LED_GRN, !digitalRead(LED_GRN));
  if ((color >> 1) & 1)
    digitalWrite(LED_RED, !digitalRead(LED_RED));
}
