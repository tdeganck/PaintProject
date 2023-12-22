//variables globales
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

    //définir la marge
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
    
    //Afficher un message sympathique
    textSize (50);
    textAlign (CENTER, CENTER);
    fill (234, 7, 117);
    text("Joyeuses fêtes !", width/2, marge/2);

}

void draw () {
  //Afficher les boutons en appelant la fonction utile
  afficheBoutons ();
  
    //Si on a activé l'outil en cliquant dans le cadre de dessin
    if (dessiner == true){
      
      //et qu'on dessine bien dans le cadre 
      if (mouseY>marge && mouseY<height-marge){
        
        //on dessine une forme selon l'outil choisi
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
    
    //les formes sont effacées quand on active le bouton effacer
    if (boutonEffSelect == true){
      fill(255);
      rectMode (CENTER);
      rect(width/2, height/2, width, height-marge*2);
    }
}

void afficheBoutons() {   
    //numéro du premier bouton
    numBouton = 0;
    
    //paramètres utiles au dessin des boutons
    int a = marge;
    int b = height-(marge/2);
    int c;
    stroke (0);
    rectMode (CENTER);
    
    //création des boutons
    for(c =a/2; c<(a*4); c=c+a){
      for (numBouton = 0; numBouton<4; numBouton = numBouton +1){
      fill (250, 229, 252);
      rect (c, b, a, a);
      //afficher le nom des boutons
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
}



void mousePressed() {
    //enregistrer la position de la souris à chaque clic
    lastclicX = mouseX;
    lastclicY = mouseY;
    
    //(dés)activer l'action de dessiner 
    // à chaque clic de souris dans le cadre de dessin
    if(mouseY>marge && mouseY<height-marge){
        dessiner = !dessiner;
    }
    //(dés)activer les boutons quand on clique dessus
    //bouton ligne
    if(mouseX<marge && mouseY>height-marge){
      boutonLigneSelect = !boutonLigneSelect;
    }

    //bouton rectangle
    if(mouseX<marge*2 && mouseX>marge){
      if (mouseY>height-marge){
        boutonRectSelect = !boutonRectSelect;
      }
    }

    //bouton ellipse
    if(mouseX<marge*3 && mouseX>marge*2){
      if (mouseY>height-marge){
        boutonElSelect = !boutonElSelect;
      }
    }
    //bouton effacer
    if(mouseX<marge*4 && mouseX>marge*3){
      if (mouseY>height-marge){
        boutonEffSelect = !boutonEffSelect;
      }
    }  
}

void mouseReleased() {
      //désactiver automatiquement le bouton effacer 
      if(mouseX<marge*4 && mouseX>marge*3){
      if (mouseY>height-marge){
        boutonEffSelect = !boutonEffSelect;
        }
      }
}
