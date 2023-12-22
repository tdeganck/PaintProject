boolean dessiner;
boolean boutonLigneSelect;
boolean boutonRectSelect;
boolean boutonElSelect;
boolean boutonEffSelect;
int lastclicX;
int lastclicY;
int marge;
int a;
int b;
int c;
int numBouton;

void setup() {
    size(1100, 800);

    //assigner valeur de départ à lastclic
    lastclicX = 0;
    lastclicY = 0;

    //assigner valeur à marge
    marge = 100;

    //assigner des valeur de départ aux booléens
    dessiner = false;
    boutonLigneSelect = false;
    boutonRectSelect = false;
    boutonElSelect = false;
    boutonEffSelect = false;

    //paramétrage du cadre du dessin
    stroke(0);
    strokeWeight(2);
    background (217, 247, 245);
    fill(255);
    rectMode (CENTER);
    rect(width/2, height/2, width, height-marge*2);
    
    textSize (50);
    textAlign (CENTER, CENTER);
    fill (234, 7, 117);
    text("Joyeuses fêtes !", width/2, marge/2);

}

void draw () {
  afficheBoutons ();
    if (dessiner == true){
      
      //si on est dans le cadre de dessin on peut dessiner des formes
      if (mouseY>marge && mouseY<height-marge){
        
        //
        if (boutonLigneSelect==true){
                line(pmouseX, pmouseY, mouseX, mouseY);
        }
        else if (boutonRectSelect == true) {
            rectMode(CORNERS);
            noStroke ();
            fill (150);
            rect (lastclicX, lastclicY, mouseX, mouseY);
        }
        else if (boutonElSelect == true) {
          ellipseMode(CORNERS);
          noStroke ();
          fill (100);
          ellipse (lastclicX, lastclicY, mouseX, mouseY);
        }
      }  
    }
    if (boutonEffSelect == true){
      fill(255);
      rectMode (CENTER);
      rect(width/2, height/2, width, height-marge*2);
    }
}

void afficheBoutons() {   
    numBouton = 0;
    int a = marge;
    int b = height-(marge/2);
    int c;
    stroke (0);
    rectMode (CENTER);
    
    for(c =a/2; c<(a*4); c=c+a){
      for (numBouton = 0; numBouton<4; numBouton = numBouton +1){
      fill (250, 229, 252);
      rect (c, b, a, a);
      textSize (20);
      fill (234, 7, 117);
      textAlign (CENTER, CENTER);
        if (numBouton < 1){
          text ("Ligne", a/2, height-marge/2);
          } else if (numBouton < 2) {
            text ("Rect", a/2+a, height-marge/2);
          } else if (numBouton < 3) {
            text ("Ellipse", a/2+a*2, height-marge/2);
          } else if (numBouton < 4) {
            text ("Effacer", a/2+a*3, height-marge/2);
          }
      }
    }
 


    // afficher le bouton sélectionné en jaune
    if (boutonLigneSelect == true){
        fill (252, 245, 214); 
        rect (c=a/2, b, a, a);
      } else if (boutonRectSelect== true){
        fill (252, 245, 214);
        rect (c=a+a/2, b, a, a);
      } else if (boutonElSelect== true){
        fill (252, 245, 214);
        rect (c=a*2+a/2, b, a, a);
      } else if (boutonEffSelect == true){
        fill (252, 245, 214);
        rect (c=a*3+a/2, b, a, a);
      }
      
      textSize (25);
      fill (42, 67, 41);
      textAlign (LEFT, CENTER);
      text("Enfoncez < espace > pour effacer la forme en cours", a*5, height-marge/2);
}



void mousePressed() {
    lastclicX = mouseX;
    lastclicY = mouseY;
    
    //(dés)activer l'action de dessiner 
    // à chaque clic de souris dans le cadre de dessin
    if(mouseY>marge && mouseY<height-marge){
        dessiner = !dessiner;
    }
        //(dés)activer le bouton ligne
    if(mouseX<marge && mouseY>height-marge){
      boutonLigneSelect = !boutonLigneSelect;
    }

    //(dés)activer le bouton rectangle
    if(mouseX<marge*2 && mouseX>marge){
      if (mouseY>height-marge){
        boutonRectSelect = !boutonRectSelect;
      }
    }

    //(dés)activer le bouton ellipse
    if(mouseX<marge*3 && mouseX>marge*2){
      if (mouseY>height-marge){
        boutonElSelect = !boutonElSelect;
      }
    }
        //(dés)activer le bouton effacer
    if(mouseX<marge*4 && mouseX>marge*3){
      if (mouseY>height-marge){
        boutonEffSelect = !boutonEffSelect;
      }
    }  
}
