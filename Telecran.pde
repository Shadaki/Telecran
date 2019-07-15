// Déplacement d'un rond dans une fenêtre 800 x 600 sur les deux axes avec deux potentiomètres.
// Télécharger le module StandardFirmata sur l'Arduino pour la communication avec Processing.
// 10-08-2007

import processing.serial.*;
import cc.arduino.*;

Arduino arduino;			//crée un objet Arduino

color back = color(64, 218, 255);	//variable pour la couleur du fond

int xpin = 0;
int ypin = 1;
float value = 0;

void setup() {
    size(800, 600);
    smooth();
    arduino = new Arduino(this, Arduino.list()[0], 57600);	//paramétrage de l'Arduino
    arduino.pinMode(xpin, Arduino.INPUT);			//réglage de l'entrée A0
    arduino.pinMode(ypin, Arduino.INPUT);			//réglage de l'entrée A1
    background(back);
}

void draw() {
    noStroke();
    nettoyer();
    int x=arduino.analogRead(xpin);
    int y=arduino.analogRead(ypin);
    if(x<8) {
        x=8;
    }
    if(x>792) {
        x=792;
    }
    if(y<8) {
        y=8;
    }
    if(y>592) {
        y=592;
    }
    ellipse(x, 600-y, 16, 16);
}

void nettoyer() {
    background(back);
}
