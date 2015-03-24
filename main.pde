
#include <ctype.h>
#include <math.h>
#include "LCDInterface.h"

using namespace std;

// Pin for led
int ledPin = 13;

void setup()
{
    pinMode(13, OUTPUT);

    // Init LCD screen
    LCDInit();
    char message[72] = "                                                                       ";
    gotoXY(0, 0);
    LCDString(message);
}

// Total time to wait for omnom readiness
int i = 58;
void loop() 
{
    // Print time remaining before omnom is ready
    char message[72] = "Pret dans :                       ";
    int index = 15;
    
    // Dirty stuff to convert int time in chars
    if (i >= 10) message[index++] = int(i/10)+48; 
    else         message[index++] = '0';
    if (i >= 1)  message[index++] = int(i - (i/10)*10)+48; 
    else         message[index++] = '0';

    // Finish string
    message[index++] = 's';
    message[index++] = '\0';

    // Print dat bitch
    gotoXY(0, 0);
    LCDString(message);

    // Decrement time
    i--;

    // Wait one second
    delay(1000);
}


