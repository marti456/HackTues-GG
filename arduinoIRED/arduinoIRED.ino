#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

#define IRSensor 5
#define LED 15


// Constants
const char *ssid = "VW GOLF GTI";
const char *password =  "kolelo7141";

const int dns_port = 53;
const int http_port = 8080;

int id = 1;

//String address = "j.k. Goce Delchev ulitsa Kostenski vodopad";

/***********************************************************
 * Functions
 */

void SendData()
{
    HTTPClient http;    //Declare object of class HTTPClient
 
    http.begin("http://192.168.1.12/server.php");      //Specify request destination
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");  //Specify content-type header
    String postData = "id="+String(id); 
    int httpResponseCode = http.POST(postData);   //Send the request
    String payload = http.getString();                   //Get the response payload
    Serial.println(payload);    //Print request response payload

    http.end();  //Close connection
    Serial.println("Enter in sleep mode");
    delay(500);
    
    //delay(36000);
}

/***********************************************************
 * Main
 */

void setup() {
  // Init IR sensor
  pinMode (IRSensor, INPUT); // sensor pin INPUT
  pinMode (LED, OUTPUT); // sensor pin OUTPUT
  
  // Start Serial port
  Serial.begin(115200);

  // Start access point
  Serial.println("start");
  WiFi.begin(ssid, password);
  //WiFi.softAP(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {  //Wait for the WiFI connection completion
 
    delay(500);
    Serial.println("Waiting for connection");
 
  }

  digitalWrite(LED, HIGH);
  delay(100);

  // Print our IP address
  Serial.println();
  Serial.println("AP running");
  Serial.print("My IP address: ");
  Serial.println(WiFi.softAPIP());


  //initialize the indicator LED:
  pinMode(13, OUTPUT);

  
}
  
void loop() {
 
  if (WiFi.status() == WL_CONNECTED) { //Check WiFi connection status
    
    Serial.println("wifi is connected");   //Print HTTP return code
    //check the sensor
    int statusSensor = digitalRead (IRSensor);
    
    Serial.println(statusSensor);
    //if there is sognal call gunction SendData()
    if (statusSensor == 1){

      for(int i = 0; i < 7; i++){
        if(statusSensor == 0){
          break;
        }
        if(i == 6){
          Serial.println("object detected");
          SendData();
        }
        delay(1000);
      } 
    }
    else{
        Serial.println("not object detected");
        delay(500);
    }

    digitalWrite(LED, LOW);
    ESP.deepSleep(10e6);
    //ESP.deepSleep(ESP.deepSleepMax()); //sleeps for 3:25 hours/

    
  } else {
    
    Serial.println("Error in WiFi connection");
 
  }

  
 
  delay(1000);  //Send a request every 30 seconds
  
}
