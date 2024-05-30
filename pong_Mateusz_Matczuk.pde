int szerokoscPaletki = 10;
int wysokoscPaletki = 60;
int rozmiarPilki = 20;

float lewaPaletkaY;
float prawaPaletkaY;

float pilkaX;
float pilkaY;
float predkoscPilkiX;
float predkoscPilkiY;

int lewyWynik = 0;
int prawyWynik = 0;

void setup() {
  size(800, 400);
  resetujGre(); 
}

void draw() {
  background(0); 
  
  
  rect(30, lewaPaletkaY, szerokoscPaletki, wysokoscPaletki);
  rect(width - 30 - szerokoscPaletki, prawaPaletkaY, szerokoscPaletki, wysokoscPaletki);
  
  
  ellipse(pilkaX, pilkaY, rozmiarPilki, rozmiarPilki);
  
  
  textSize(32);
  text(lewyWynik, width/4, 50);
  text(prawyWynik, 3 * width/4, 50);
  
  
  pilkaX += predkoscPilkiX;
  pilkaY += predkoscPilkiY;
  
  
  if (pilkaY <= 0 || pilkaY >= height) {
    predkoscPilkiY *= -1;
  }
  
  
  if (pilkaX - rozmiarPilki/2 <= 30 + szerokoscPaletki && pilkaY >= lewaPaletkaY && pilkaY <= lewaPaletkaY + wysokoscPaletki) {
    predkoscPilkiX *= -1;
    pilkaX = 30 + szerokoscPaletki + rozmiarPilki/2;
  } else if (pilkaX + rozmiarPilki/2 >= width - 30 - szerokoscPaletki && pilkaY >= prawaPaletkaY && pilkaY <= prawaPaletkaY + wysokoscPaletki) {
    predkoscPilkiX *= -1;
    pilkaX = width - 30 - szerokoscPaletki - rozmiarPilki/2;
  }
  
  
  if (pilkaX < 0) {
    prawyWynik++;
    resetujGre();
  } else if (pilkaX > width) {
    lewyWynik++;
    resetujGre();
  }
  
  
  if (keyPressed) {
    if (key == 'w') {
      lewaPaletkaY -= 5;
    }
    if (key == 's') {
      lewaPaletkaY += 5;
    }
    if (keyCode == UP) {
      prawaPaletkaY -= 5;
    }
    if (keyCode == DOWN) {
      prawaPaletkaY += 5;
    }
  }
  
  
  lewaPaletkaY = constrain(lewaPaletkaY, 0, height - wysokoscPaletki);
  prawaPaletkaY = constrain(prawaPaletkaY, 0, height - wysokoscPaletki);
}

void resetujGre() {
  lewaPaletkaY = height/2 - wysokoscPaletki/2;
  prawaPaletkaY = height/2 - wysokoscPaletki/2;
  pilkaX = width/2;
  pilkaY = height/2;
  predkoscPilkiX = random(3, 5) * (random(1) > 0.5 ? 1 : -1);
  predkoscPilkiY = random(3, 5) * (random(1) > 0.5 ? 1 : -1);
}
