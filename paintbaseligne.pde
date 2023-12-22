boolean dessiner;
boolean boutonLigneSelect;
boolean boutonRectSelect;
boolean boutonElSelect;
int lastclicX;
int lastclicY;
int marge;
int a;
int b;
int c;

void setup() {
    size(900, 500);

    //assigner valeur de départ à lastclic
    lastclicX = 0;
    lastclicY = 0;

    //assigner valeur à marge
    marge = 100;

    //assigner valeur de départ à l'interrupteur de dessiner
    dessiner = false;
    
    //assigner une valeur de départ à l'interrupteur bouton ligne
    boutonLigneSelect = false;

    //assigner une valeur de départ à l'interrupteur bouton rectangle
    boutonRectSelect = false;

    //assigner une valeur de départ à l'interrupteur bouton ellipse
    boutonElSelect = false;

    //paramétrage du cadre du dessin
    stroke(0);
    strokeWeight(2);
    background (217, 247, 245);
    fill(255);
    rectMode (CENTER);
    rect(width/2, height/2, width, height-marge*2);
    

}

void draw () {
  afficheBoutons ();
    if (dessiner == true){
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

void afficheBoutons() {
    int a = marge;
    int b = height-(marge/2);
    int c;
    stroke (0);
    rectMode (CENTER);
    
    for(c =a/2; c<(a*8); c=c+a){
      fill (250, 229, 252);
      rect (c, b, a, a);
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
      }
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
}