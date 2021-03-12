#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

#define IRSensor 2



// Constants
const char *ssid = "VW GOLF GTI";
const char *password =  "kolelo7141";

const int dns_port = 53;
const int http_port = 8080;

int id = 1;

String address = "Goce Delchev";

/***********************************************************
 * Functions
 */

void SendData()
{
    HTTPClient http;    //Declare object of class HTTPClient
 
    http.begin("http://192.168.1.88:8085/server.php");      //Specify request destination
    http.addHeader("Content-Type", "text/plain");  //Specify content-type header
 
    int httpCode = http.POST("Message from ESP8266");   //Send the request
    String payload = http.getString();                  //Get the response payload
 
    Serial.println(httpCode);   //Print HTTP return code
    Serial.println(payload);    //Print request response payload
 
    http.end();  //Close connection
}

/***********************************************************
 * Main
 */

void setup() {
  // Init IR sensor
  pinMode (IRSensor, INPUT); // sensor pin INPUT
  
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

    //if there is sognal call gunction SendData()
    if (statusSensor == 1){
      Serial.println("not object detected");
      SendData();  
    }

    else{
        Serial.println("not object detected");
        delay(1000);
    }

    
  } else {
    
    Serial.println("Error in WiFi connection");
 
  }

  
 
  delay(30000);  //Send a request every 30 seconds
  
}
