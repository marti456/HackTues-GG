#include <ESP8266WiFi.h>
#include <WebSocketsServer.h>
#include <ESPAsyncWebServer.h>


// Constants
const char *ssid = "IzvorIsTheBest";
const char *password =  "123456789";

const int dns_port = 53;
const int http_port = 8080;
const int ws_port = 1337;
const int led_pin = 12;


// Globals
AsyncWebServer server(http_port);
WebSocketsServer webSocket = WebSocketsServer(ws_port);
char msg_buf[10];
int led_state = 0;

/***********************************************************
 * Functions
 */


// Callback: send homepage
void onIndexRequest(AsyncWebServerRequest *request) {
  IPAddress remote_ip = request->client()->remoteIP();
  Serial.println("[" + remote_ip.toString() +
                  "] HTTP GET request of " + request->url());
  request->send(SPIFFS, "/index.html", "text/html");
}

// Callback: send style sheet
void onCSSRequest(AsyncWebServerRequest *request) {
  IPAddress remote_ip = request->client()->remoteIP();
  Serial.println("[" + remote_ip.toString() +
                  "] HTTP GET request of " + request->url());
  request->send(SPIFFS, "/style.css", "text/css");
}

/***********************************************************
 * Main
 */

void setup() {
  // Init LED and turn on and off
  pinMode(led_pin, OUTPUT);
  digitalWrite(led_pin, HIGH);

  delay(3000);
  digitalWrite(led_pin, LOW);
  

  // Start Serial port
  Serial.begin(115200);

  // Make sure we can read the file system
  /*if( !SPIFFS.begin()){
    Serial.println("Error mounting SPIFFS");
    while(1);
  }
  */
  // Start access point
  Serial.println("start");
  //WiFi.begin(ssid, password);
  WiFi.softAP(ssid, password);

  // Print our IP address
  Serial.println();
  Serial.println("AP running");
  Serial.print("My IP address: ");
  Serial.println(WiFi.softAPIP());
  
  // On HTTP request for root, provide index.html file
  //server.on("/", HTTP_GET, onIndexRequest);

  // On HTTP request for style sheet, provide style.css
  //server.on("/style.css", HTTP_GET, onCSSRequest);

  // Handle requests for pages that do not exist
  //server.onNotFound(onPageNotFound);

  // Start web server
  server.begin();

  // Start WebSocket server and assign callback
  webSocket.begin();
  webSocket.onEvent(onWebSocketEvent);
  
}

void loop() {
  
  // Look for and handle WebSocket data
  webSocket.loop();
}
