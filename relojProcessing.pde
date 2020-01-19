/**
 *clock
 */

import java.lang.Math;

/*
 *desface de 45
 *esto es debido a que las 12 
 *en punto corresponden al angulo de 45
 */
int offset = 45;

int segundos = 0;
int minutos = 5;
int horas = 3;

void setup() {
    size(500, 500); //size de la ventana
    background(255); //color del fondo

    fill(204, 102, 0); //color del relleno
    ellipse(250, 250, 500, 500); //contorno del reloj

    fill(0);
    //llena las horas; 360/12 = 30
    textSize(32);
    for (int i = 10; i < 22; i++) {
        int x = (int)(Math.cos(Math.toRadians(30 * i)) * 210);
        int y = (int)(Math.sin(Math.toRadians(30 * i)) * 210);
        text((i - 9) + "", 237 + x, 260 + y);
    }

}

//dibuja el contorno de reloj
void drawClock() {
    //size de borde normal
    strokeWeight(1);

    //limpia las manecillas
    stroke(204, 102, 0);
    fill(204, 102, 0);
    ellipse(250, 250, 365, 365);

    //punto medio
    stroke(0);
    fill(0); //color del relleno
    ellipse(250, 250, 15, 15);
}

void draw() {
    drawClock();
    /*
     *  las manecillas del reloj se calculan como vectores
     *  los angulos:
     *  segundos 360/60 = 6; minutos 360/60 = 6; horas 360 /12 = 30
     */
    //print("segundos "+segundos+"\n");
    
    //segundos
    int xseg = (int)(Math.cos(Math.toRadians(6 * (segundos + offset))) * 180);
    int yseg = (int)(Math.sin(Math.toRadians(6 * (segundos + offset))) * 180);
    strokeWeight(1);
    line(250, 250, 250 + xseg, 250 + yseg);
    
    //minutos
    int xmin = (int)(Math.cos(Math.toRadians(6 * (minutos + offset))) * 170);
    int ymin = (int)(Math.sin(Math.toRadians(6 * (minutos + offset))) * 170);
    strokeWeight(4);
    line(250, 250, 250 + xmin, 250 + ymin);
    
    //horas
    int xhor = (int)(Math.cos(Math.toRadians(30 * (horas + offset))) * 140);
    int yhor = (int)(Math.sin(Math.toRadians(30 * (horas + offset))) * 140);
    strokeWeight(10);
    line(250, 250, 250 + xhor, 250 + yhor);
    
    /*espera un segundo*/
    delay(1000);
    segundos++;
    
    /*valida el incrementos*/
    if (segundos == 60) {
        segundos = 0;
        minutos++;
        if (minutos == 60) {
            minutos = 0;
            horas++;
            if (horas == 12) {
                horas = 0;
            }
        }
    }

}
