// This is the code running on the arduino

#include "Arduino.h"
#include "HardwareSerial.h"

char message;

unsigned long previousMillis = 0;

const long interval = 1000;

int main(void)
{
	init();
	setup();

	for (;;) {
		loop();
		if (serialEventRun) serialEventRun();
	}

	return 0;
}

void setup() {
  Serial.begin(9600);
  Serial.println("Hello world!");
}

int readSignal() {
	const int lightSensor = A0;
	int sensorReading = analogRead(lightSensor);
	return sensorReading;
}

void lightOn() {
	const int ledPin = 13;
	pinMode(ledPin, OUTPUT);
	digitalWrite(ledPin, HIGH);
	delay(20);
	digitalWrite(ledPin, LOW);
	delay(20);
}

int getTemp() {
	const int tempSensor = A1;
	int tempReading = analogRead(tempSensor);
	return tempReading;
}

void getLightReading() {
	int readingMessage = readSignal();
	Serial.print("The light sensor is currently reading: ");
	Serial.println(readingMessage);
}

void loop() {
	unsigned long currentMillis = millis();
	if (currentMillis - previousMillis >= interval) {
		previousMillis = currentMillis;

	}
	getLightReading();
	message = Serial.read();
	if (message == 't') {
//		Serial.println("You are sending the letter 'T'. This is good news indeed!!!");
		for (int i = 0; i < 5; i++) {
			lightOn();
		}
	}
	delay(250);

//	else if (message == 'o') {
//		Serial.println("Going into flicker mode...");
//		flicker();
//	} else if (message == 'l') {
//		int readingMessage = readSignal();
//		Serial.print("The light sensor is currently reading: ");
//		Serial.println(readingMessage);
//		int temperature = getTemp();
//		float millivolts = (temperature/1024.0)*5000;
//		Serial.println(millivolts);
//		float celsius = millivolts/10;
//		if (celsius > 22) {
//			flicker();
//		}
//		Serial.print("The temperature sensor is currently reading: ");
//		Serial.print(celsius);
//		Serial.println("°");

//	} else {
//		Serial.println("You don't seem to be sending me a message at the moment.");
//	}
//	delay (10);
}
