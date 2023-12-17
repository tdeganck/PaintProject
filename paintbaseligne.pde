boolean dessiner;
boolean boutonLigneSelect;
int marge;

void setup() {
    //fenêtre de l'app
    size(1200, 1000);
    background (217, 247, 245);
    
    //assigner valeur de départ à l'interrupteur de dessiner
    dessiner = false;
    
    //assigner une valeur de départ à l'interrupteur bouton ligne
    boutonLigneSelect = false;
    
    //assigner une valeur à la marge
    marge = 200;
    
    //paramétrage du cadre du dessin
    stroke(0);
    strokeWeight(2);
    background (217, 247, 245);
    fill(255);
    rectMode (CENTER);
    rect(width/2, height/2, width, height-marge*2);
     

}

void draw() {
    //Vérifier si l'action dessiner est activée
    if (dessiner == true){
        stroke(0);
        // vérifier si la souris est située dans le cadre de dessin
        if(mouseY>marge && mouseY<height-marge){
        line (pmouseX, pmouseY, mouseX, mouseY);
        }
    }
    //Afficher 3 boutons colorés
    int a = marge;
    int b = (height/2)+(marge*2);
    int c;
    for(c =a/2; c<(a*4); c=c+a){
      fill (250, 229, 252); // afficher le bouton non sélectionné en rose
      rect (c, b, a, a);
    }  
    if (boutonLigneSelect == true){
        fill (252, 245, 214); // afficher le bouton sélectionné en jaune
        rect (c=a/2, b, a, a);
      }
}


void mousePressed() {
    //(dés)activer l'action de dessiner 
    // à chaque clic de souris dans le cadre de dessin
    if(mouseY>marge && mouseY<height-marge){
        dessiner = !dessiner;
    }
    
    //idem pour l'outil ligne
    if(mouseX<(marge/2)+marge&&mouseY>(height/2)+marge){
      boutonLigneSelect = !boutonLigneSelect;
    }
}







