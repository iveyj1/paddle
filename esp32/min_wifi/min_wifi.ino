
#include <WiFi.h>
#define BLINK 13
//WiFi globals
const char* ssid     = "Cold Comfort Farm";
const char* password = "widephoenix967";
WiFiServer server(80);
WiFiClient client;

void setupWifi()
{
    Serial.println(ssid);
    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }

    Serial.println("");
    Serial.println("WiFi connected.");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
    
    server.begin();
}

void setup() {
    Serial.begin(115200);
    pinMode(BLINK, OUTPUT);
    setupWifi();
}

void loop()
{
    int start = millis();
    client = server.available();   // listen for incoming clients
    
    if (client) 
    { 
        client.setNoDelay(true);
        while (client.connected()) 
        {
            Serial.println("Connected");
            while (client.available()) 
            {             
                digitalWrite(BLINK, HIGH);
                char c = client.read();
                digitalWrite(BLINK, LOW);
                //Serial.write(c);
                //client.write(c);
            }
        }
        Serial.println("Disconnected");
        client.stop();
    }
    if(millis()-start > 0)
    {
        //p("processWifi duration: %d\n", millis()-start);
    }
}

