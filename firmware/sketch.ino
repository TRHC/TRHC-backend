#include "SHT21.h"
#include <ESP8266WiFi.h>
#include <Wire.h>
#include <hd44780.h>                     
#include <hd44780ioClass/hd44780_I2Cexp.h>
extern "C" {
  #include "user_interface.h"
}

os_timer_t myTimer;
hd44780_I2Cexp lcd;
SHT21 sht;

const int LCD_COLS = 20;
const int LCD_ROWS = 4;

const char* VERSION  = "0.0.1";
const char* SSID     = "IDDQD";
const char* PASSWORD = "0RT0zQgfObk4";

const char* HOST = "localhost";
const int   PORT = 3000;


bool tickOccured = false;
byte termometer[8]= {
  B00100, 
  B01010, 
  B01010, 
  B01110, 
  B01110, 
  B11111, 
  B11111, 
  B01110
};

byte drop[8]= {
  B00100, 
  B00100, 
  B01010, 
  B01010, 
  B10001, 
  B10001, 
  B10001, 
  B01110
};


void setup() {
  // We start by connecting to a WiFi network
  printWelcome();
  WiFi.mode(WIFI_STA);
  WiFi.begin(SSID, PASSWORD);
  Serial.begin(115200);
  sht.begin();
  os_timer_setfn(&myTimer, timerCallback, NULL);
  os_timer_arm(&myTimer, 1000, true);

	if(lcd.begin(LCD_COLS, LCD_ROWS)) {
		status = -status; // convert negative status value to positive number
		hd44780::fatalError(status); // does not return
	}

  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    lcd.print(".");
  }
}

void timerCallback(void *pArg) {
  tickOccured = true;
}

void setChars() {
  lcd.createChar(1, termometer);
  lcd.createChar(2, drop);
}

void printWelcome() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Welcome to TRCH");
  lcd.setCursor(13, 1);
  lcd.print(VERSION);
  lcd.setCursor(0, 2);
  lcd.print("Connecting to ");
  lcd.setCursor(2, 3);
  lcd.print(SSID);
}

void printInfoLCD(float tc, float rh) {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print(String("AP: ") + SSID);
  lcd.setCursor(0, 1);
  lcd.print(String("IP: ") + WiFi.localIP().toString());
  lcd.setCursor(5, 2);
  lcd.print(String("Hum.  : ") + rh + " \1");
  lcd.setCursor(5, 3);
  lcd.print(String("Temp. : ") + tc + " \2");
}

void netRequest() {
  // Use WiFiClient class to create TCP connections
  WiFiClient client;
  if (!client.connect(HOST, PORT)) {
    Serial.println("connection failed");
    return;
  }

  // We now create a URI for the request
  String url = "/api/submit";
  url += "?pkey=";
  url += KEY;
  url += "&tc=";
  url += tc;
  url += "&rh=";
  url += rh;

  Serial.print("Requesting URL: ");
  Serial.println(url);

  // This will send the request to the server
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" +
               "Connection: close\r\n\r\n");
  unsigned long timeout = millis();
  while (client.available() == 0) {
    if (millis() - timeout > 5000) {
      Serial.println(">>> Client Timeout !");
      client.stop();
      return;
    }
  }
}

void handlePeriodic() {
  if(tickOccured) {
    setChars();
    float tc = sht.getTemperature();
    float rh = sht.getHumidity();
    printInfoLCD(tc, rh);
  }
  tickOccured = false;
}

void loop() {  
  handlePeriodic();
}

