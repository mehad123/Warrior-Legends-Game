//import processing.sound.*;
//SoundFile song;

boolean hitGoku=false;//hitting the player is false (good levels)
boolean hitBeerus=false;//hitting the player is false (evil levels)

int menuChoice=0;//0=main menu 1-choosing side screen   2-instructions
int gLevel=0;//level for good team
int eLevel=0;//level for evil team
int idle=0;//0-facing right

int start=0;//timer in between enemy hits

float hx=100;//x-coord for hero
float hy=550;//y-coord for hero
float hw=75;//width of hero
float hh=100;//height of hero

float heroHealth=250;//hero's health bar
float enemyHealth=250;//enemy's health bar

float ex=800;//x-coord for enemy
float ey=550;//y-coord for enemy
float ew=75;//width of enemy
float eh=100;//height of enemy

PImage menuBackground;//background for main menu
PImage chooseSides;//background for choosing sides (good or evil)
PImage battleScreen;//battlescreen background for level 1
PImage battleScreen2;//battlescreen background for level 2
PImage battleScreen3;//battlescreen background for level 3
PImage battleScreen4;//battlescreen background for level 4
PImage battleScreen5;//battlescreen background for level 5
PImage winScreen;//background for winner screen

//hero for ALL hero levels (player)
PImage gokuStance;//goku standing
PImage forwardGoku;//goku moving forward
PImage backwardGoku;//goku moving backwards
PImage damagedGoku;//goku damaged from attack
PImage[] gokuAttack=new PImage[5];//goku's attack (kicks)
PImage[] gokuSpecial=new PImage[3];//goku's specials (punches)

//enemy for hero level 1
PImage friezaStance;//frieza standing
PImage forwardFrieza;//frieza moving forward
PImage backwardFrieza;//frieza moving backwards
PImage damagedFrieza;//frieza damaged from attack
PImage[] friezaAttack=new PImage[4];//frieza's attacks 

//enemy for hero level 2
PImage cellStance;//cell standing
PImage forwardCell;//cell moving forward
PImage backwardCell;//cell moving backwards
PImage damagedCell;//cell damaged from attack
PImage[] cellAttack=new PImage[5];//cell's attacks

//enemy for hero level 3
PImage buuStance;//buu standing 
PImage forwardBuu;//buu moving forward
PImage backwardBuu;//buu moving backwards
PImage damagedBuu;//buu damaged from attack
PImage[] buuAttack=new PImage[2];//buu's attacks

//enemy for hero level 4
PImage brolyStance;//broly standing
PImage forwardBroly;//broly moving forward
PImage backwardBroly;//broly moving backwards
PImage damagedBroly;//broly damaged from attack
PImage[] brolyAttack=new PImage[5];//broly's attacks

//enemy for hero level 5
PImage beerusStance;//beerus standing
PImage forwardBeerus;//beerus moving forward
PImage backwardBeerus;//beerus moving backwards
PImage damagedBeerus;//beerus damaged from attacks
PImage[] beerusAttack=new PImage[2];//beerus's attacks

//enemy for ALL enemy levels (player)
PImage beerusStance2;//beerus standing 
PImage forwardBeerus2;//beerus moving forward
PImage backwardBeerus2;//beerus moving backwards
PImage damagedBeerus2;//beerus damaged from attacks
PImage[] beerus2Attack=new PImage[4];//beerus's attack (kicks)
PImage[] beerus2Special=new PImage[4];//beerus's attack (punches)

//hero for enemy level 1
PImage gotenStance;//goten standing
PImage forwardGoten;//goten moving forward
PImage backwardGoten;//goten moving backwards
PImage damagedGoten;//goten damaged from attacks
PImage[] gotenAttack=new PImage[3];//goten's attacks

//hero for enemy level 2
PImage trunksStance;//trunks standing
PImage forwardTrunks;//trunks moving forward
PImage backwardTrunks;//trunks moving backwards
PImage damagedTrunks;//trunks damaged from attacks
PImage[] trunksAttack=new PImage[3];//trunks's attacks

//hero for enemy level 3
PImage gohanStance;//gohan standing
PImage forwardGohan;//gohan moving forward
PImage backwardGohan;//gohan moving backwards
PImage damagedGohan;//gohan damaged from attacks
PImage[] gohanAttack=new PImage[5];//gohan's attacks

//hero for enemy level 4
PImage vegetaStance;//vegeta standing
PImage forwardVegeta;//vegeta moving forward
PImage backwardVegeta;//vegeta moving backwards
PImage damagedVegeta;//vegeta damaged from attacks
PImage[] vegetaAttack=new PImage[2];//vegeta's attacks

//hero for enemy level 5
PImage SuperVegetaStance;//super vegeta standing
PImage forwardSuperVegeta;//super vegeta moving forward
PImage backwardSuperVegeta;//super vegeta moving backwards
PImage damagedSuperVegeta;//super vegeta damaged from attacks
PImage[] SuperVegetaAttack=new PImage[3];//super vegeta's attacks

//fonts
PFont title;//title font
PFont options;//font for options (play, instructions) and other words

String titlefont;//title font
String font;//font for options

boolean moveRight=false;//moving right for player is false if right arrow key isnt pressed
boolean moveLeft=false;//moving left for player is false if left arrow key isnt pressed
boolean moveUp=false;//jumping is false if space bar isnt pressed
boolean onFloor=false;//if player is not on the floor, onFloor is false
boolean hitEnemy=false;//hitting the enemy is false if the 'x' isnt pressed while touching the enemy
boolean specialMove=false;//hitting the enemy with a special is false if 'c' isnt pressed while touching the enemy
boolean moveEnemy=true;//move enemy(cpu) is true when it is following the player
boolean moveHero=true;//move hero(cpu) is true when it is following the player
boolean damage=false;//damage is false if the player isnt attacking the cpu
boolean stance=true;//if hero/villain is standing

float ySpeed=0;//y speed for jumping
float gravity=0.3;//gravity for jumping
float jumpPower=10;//how powerful the jump is for both player and cpu
float frame=0.3;//how fast the frames are for the array of sprites


void setup() {
  size(1000, 700);

  //song = new SoundFile(this, "dbz.mp3");//background song
  //song.loop();//background music will restart each time it ends

  menuBackground=loadImage("background.jpg");//menu background
  chooseSides=loadImage("chooseSides.jpg");//choosing sides background
  battleScreen=loadImage("planet namek.png");//level 1 battlescreen
  battleScreen2=loadImage("cellTournament.jpg");//level 2 battlescreen
  battleScreen3=loadImage("kaiPlanet.jpg");//level 3 battlescreen
  battleScreen4=loadImage("planetVampa.png");//level 4 battlescreen
  battleScreen5=loadImage("planetBeerus.png");//level 5 battlescreen
  winScreen=loadImage("winScreen.jpg");//win screen background

  //HERO LEVELS
  gokuStance=loadImage("Goku0.png");
  forwardGoku=loadImage("Goku1.png");
  backwardGoku=loadImage("Goku2.png");
  damagedGoku=loadImage("Goku21.png");
  for (int i=0; i<gokuAttack.length; i++) {
    gokuAttack[i]=loadImage("Goku"+(11+i)+".png");
  }
  for (int i=0; i<gokuSpecial.length; i++) {
    gokuSpecial[i]=loadImage("Goku"+(6+i)+".png");
  }

  //Hero Level 1
  friezaStance=loadImage("Frieza0.png");
  forwardFrieza=loadImage("Frieza1.png");
  backwardFrieza=loadImage("Frieza2.png");
  damagedFrieza=loadImage("Frieza21.png");
  for (int i=0; i<friezaAttack.length; i++) {
    friezaAttack[i]=loadImage("Frieza"+(8+i)+".png");
  }

  //Hero Level 2
  cellStance=loadImage("Cell0.png");
  forwardCell=loadImage("Cell1.png");
  backwardCell=loadImage("Cell2.png");
  damagedCell=loadImage("Cell22.png");
  for (int i=0; i<cellAttack.length; i++) {
    cellAttack[i]=loadImage("Cell"+(5+i)+".png");
  }

  //Hero Level 3
  buuStance=loadImage("Buu0.png");
  forwardBuu=loadImage("Buu1.png");
  backwardBuu=loadImage("Buu2.png");
  damagedBuu=loadImage("Buu22.png");
  for (int i=0; i<buuAttack.length; i++) {
    buuAttack[i]=loadImage("Buu"+(8+i)+".png");
  }

  //Hero Level 4
  brolyStance=loadImage("Broly8.png");
  forwardBroly=loadImage("Broly10.png");
  backwardBroly=loadImage("Broly9.png");
  damagedBroly=loadImage("Broly23.png");
  for (int i=0; i<brolyAttack.length; i++) {
    brolyAttack[i]=loadImage("Broly"+(15+i)+".png");
  }

  //Hero Level 5
  beerusStance=loadImage("RightBeerus19.png");
  forwardBeerus=loadImage("RightBeerus2.png");
  backwardBeerus=loadImage("RightBeerus0.png");
  damagedBeerus=loadImage("RightBeerus17.png");
  for (int i=0; i<beerusAttack.length; i++) {
    beerusAttack[i]=loadImage("RightBeerus"+(7+i)+".png");
  }

  //ENEMY LEVELS
  beerusStance2=loadImage("Beerus19.png");
  forwardBeerus2=loadImage("Beerus2.png");
  backwardBeerus2=loadImage("Beerus0.png");
  damagedBeerus2=loadImage("Beerus17.png");
  for (int i=0; i<beerus2Attack.length; i++) {
    beerus2Attack[i]=loadImage("Beerus"+(11+i)+".png");
  }
  for (int i=0; i<beerus2Special.length; i++) {
    beerus2Special[i]=loadImage("Beerus"+(7+i)+".png");
  }

  //Enemy Level 1
  gotenStance=loadImage("Goten0.png");
  forwardGoten=loadImage("Goten1.png");
  backwardGoten=loadImage("Goten2.png");
  damagedGoten=loadImage("Goten21.png");
  for (int i=0; i<gotenAttack.length; i++) {
    gotenAttack[i]=loadImage("Goten"+(8+i)+".png");
  }

  //Enemy Level 2
  trunksStance=loadImage("Trunks0.png");
  forwardTrunks=loadImage("Trunks1.png");
  backwardTrunks=loadImage("Trunks2.png");
  damagedTrunks=loadImage("Trunks22.png");
  for (int i=0; i<trunksAttack.length; i++) {
    trunksAttack[i]=loadImage("Trunks"+(8+i)+".png");
  }

  //Enemy Level 3
  gohanStance=loadImage("Gohan0.png");
  forwardGohan=loadImage("Gohan1.png");
  backwardGohan=loadImage("Gohan2.png");
  damagedGohan=loadImage("Gohan22.png");
  for (int i=0; i<gohanAttack.length; i++) {
    gohanAttack[i]=loadImage("Gohan"+(10+i)+".png");
  }

  //Enemy Level 4
  vegetaStance=loadImage("Vegeta0.png");
  forwardVegeta=loadImage("Vegeta1.png");
  backwardVegeta=loadImage("Vegeta2.png");
  damagedVegeta=loadImage("Vegeta17.png");
  for (int i=0; i<vegetaAttack.length; i++) {
    vegetaAttack[i]=loadImage("Vegeta"+(5+i)+".png");
  }

  //Enemy Level 5
  SuperVegetaStance=loadImage("SuperVegeta0.png");
  forwardSuperVegeta=loadImage("SuperVegeta1.png");
  backwardSuperVegeta=loadImage("SuperVegeta2.png");
  damagedSuperVegeta=loadImage("SuperVegeta21.png");
  for (int i=0; i<SuperVegetaAttack.length; i++) {
    SuperVegetaAttack[i]=loadImage("SuperVegeta"+(8+i)+".png");
  }
  //Fonts
  titlefont="Sacred Hertz.otf";
  font="Propeller-Regular.otf";
}//end of setup

void mainMenu() {
  //Fonts for title
  title = createFont(titlefont, 75);
  textFont(title);
  text("Warrior", 250, 150);
  text("Legends", 325, 250);
  textSize(25);
  text("From Dragon Ball", 725, 685);

  //Fonts for options
  options=createFont(font, 100);
  textFont(options);
  text("Play", 200, 500);
  text("Instructions", 200, 600);
}//end of mainMenu

void mainMenuBackground() {
  if (menuChoice==0) {//if menuChoice is 0
    menuBackground.resize(1000, 700);
    image(menuBackground, 0, 0);
  }//end of if
}//end of mainMenuBackground

void mymouseClicked() {
  if (mousePressed && mouseX>=200 && mouseX<=330 && mouseY<=500 && mouseY>=430) {//play button
    menuChoice=1;//menuChoice is 1
    play();//play function
  }//end of if

  if (mousePressed && mouseX>=200 && mouseX<=570 && mouseY<=600 && mouseY>=530) {//instructions button
    menuChoice=2;//menuChoice is 2
    instructions();//instructions function
  }//end of if
}//end of selecting options with mouseClicked

void play() {
  chooseSides.resize(1000, 700);
  image(chooseSides, 0, 0);
  fill(255, 20, 0);//red
  rect(175, 300, 200, 125);//square for good
  fill(0, 0, 255);//blue
  rect(575, 300, 175, 125);//square for evil
  fill(255);//white
  text("GOOD", 200, 400);
  text("EVIL", 600, 400);
  if (mousePressed && mouseX>175 && mouseX<375 && mouseY>300 && mouseY<425) {//if good box is pressed
    gLevel=1;//hero level equals 1
    level1();//hero level 1
  }

  if (mousePressed && mouseX>575 && mouseX<750 && mouseY>300 && mouseY<425) {//if evil box is pressed
    eLevel=1;//enemy level equals 1
    eLevel1();//enemy level 1
  }
}//end of play

void level1() {//level 1 for hero levels

  battleScreen.resize(1000, 700);
  image(battleScreen, 0, 0);
  heroHealthg1();//hero health for player in ALL HERO LEVELS
  enemyHealthg1();//enemy health health for enemy in level 1
  moveHero();//hero for ALL hero levels
  checkDist();//distance between hero and enemy
  drawEnemyg1();//enemy for hero level 1 only

  if (moveEnemy) {//if moveEnemy is true
    moveEnemyg1();//enemy for hero level 1 only
  }//end of if

  if (enemyHealth<=0) {//if (cpu) enemy health is at zero 
    gLevel=2;//hero level is 2
    heroHealth=250;//hero health resets
    enemyHealth=250;//enemy health resets
    hx=100;//hero's positions reset
    ex=800;//enemy's position resets
  }//end of if

  if (heroHealth<=0) {//if (player) hero health is at zero
    gLevel=0;//hero level equals zero
    menuChoice=0;//menu choice is zero
    mainMenuBackground();//switch to main menu background
    mainMenu();//switch to main menu
    mymouseClicked();//mymouseClicked allows player to play again
    heroHealth=250;//hero health resets
    enemyHealth=250;//enemy health resets
    hx=100;//hero's position resets
    ex=800;//enemy's position resets
  }//end of if
}//end of function level1

void level2() {//same as above except its hero level 2

  battleScreen2.resize(1375, 950);
  image(battleScreen2, -225, -50);

  heroHealthg1();
  enemyHealthg2();
  moveHero();
  checkDist();
  drawEnemyg2();

  if (moveEnemy) {
    moveEnemyg2();
  }

  if (enemyHealth<=0) {
    gLevel=3;
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if

  if (heroHealth<=0) {
    gLevel=0;
    menuChoice=0;
    mainMenuBackground();
    mainMenu();
    mymouseClicked();
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if
}//end of level2

void level3() {//same as above except its hero level 3
  battleScreen3.resize(1000, 700);
  image(battleScreen3, 0, 0);
  heroHealthg1();
  enemyHealthg3();
  moveHero();
  checkDist();
  drawEnemyg3();

  if (moveEnemy) {
    moveEnemyg3();
  }

  if (enemyHealth<=0) {
    gLevel=4;
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if

  if (heroHealth<=0) {
    gLevel=0;
    menuChoice=0;
    mainMenuBackground();
    mainMenu();
    mymouseClicked();
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if
}

void level4() {//same as above except its hero level 4
  battleScreen4.resize(1000, 700);
  image(battleScreen4, 0, 0);
  heroHealthg1();
  enemyHealthg4();
  moveHero();
  checkDist();
  drawEnemyg4();

  if (moveEnemy) {
    moveEnemyg4();
  }

  if (enemyHealth<=0) {
    gLevel=5;
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if

  if (heroHealth<=0) {
    gLevel=0;
    menuChoice=0;
    mainMenuBackground();
    mainMenu();
    mymouseClicked();
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if
}//end of level4

void level5() {//same as above except its hero level 4
  battleScreen5.resize(1000, 700);
  image(battleScreen5, 0, 0);
  heroHealthg1();
  enemyHealthg5();
  moveHero();
  checkDist();
  drawEnemyg5();

  if (moveEnemy) {
    moveEnemyg5();
  }

  if (enemyHealth<=0) {
    winner();
  }

  if (heroHealth<=0) {
    gLevel=0;
    menuChoice=0;
    mainMenuBackground();
    mainMenu();
    mymouseClicked();
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if
}//end of level5

void winner() {//if player wins the game
  winScreen.resize(1000, 700);
  image(winScreen, 0, 0);
  textSize(100);
  text("YOU WIN!", 350, 300);
  textSize(50);
  text("Click the mouse to play again", 275, 350);
  if (mousePressed) {//if the mouse is pressed
    gLevel=0;//hero level equals 0
    eLevel=0;//enemy level equals 0
    menuChoice=0;//menu choice is 1
    mainMenuBackground();//switches to main menu background
    mainMenu();//switches to main menu
    mymouseClicked();//allows player to play again
  }//end of if
}//end of winner

void eLevel1() {//enemy level 1 
  battleScreen.resize(1000, 700);
  image(battleScreen, 0, 0);
  heroHealthe1();//hero health for enemy level 1 only
  enemyHealthe1();//enemy health for enemy level 1 only

  moveEnemy();//for ALL enemy levels
  checkDist();//distance between hero and enemy 
  drawHeroe1();//for enemy levels (level 1 only)

  if (moveHero) {//if moveHero is true
    moveHeroe1();//for enemy level 1 only
  }

  if (heroHealth<=0) {//if (cpu) hero health is at zero
    eLevel=2;//enemy level equals 2
    heroHealth=250;//hero health resets
    enemyHealth=250;//enemy health resets
    hx=100;//hero's positon resets
    ex=800;//enemy's positon resets
  }//end of if

  if (enemyHealth<=0) {//if (player) enemy health is at zero
    eLevel=0;//enemy level equals 0
    menuChoice=0;//menu choice equals 0
    mainMenuBackground();//switches to main menu background
    mainMenu();//switches to main menu
    mymouseClicked();//allows player to play again
    heroHealth=250;//hero health resets
    enemyHealth=250;//enemy health resets
    hx=100;//hero's position resets
    ex=800;//enemy's positon resets
  }//end of if
}//end of eLevel1

void eLevel2() {//same as above except enemy level 2
  battleScreen2.resize(1375, 950);
  image(battleScreen2, -225, -50);

  heroHealthe2();
  enemyHealthe1();

  moveEnemy();
  checkDist();
  drawHeroe2();

  if (moveHero) {
    moveHeroe2();
  }

  if (heroHealth<=0) {
    eLevel=3;
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if

  if (enemyHealth<=0) {
    eLevel=0;
    menuChoice=0;
    mainMenuBackground();
    mainMenu();
    mymouseClicked();
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }
}//end of eLevel2

void eLevel3() {//same as above except enemy level 3

  battleScreen3.resize(1000, 700);
  image(battleScreen3, 0, 0);

  heroHealthe3();
  enemyHealthe1();

  moveEnemy();
  checkDist();
  drawHeroe3();

  if (moveHero) {
    moveHeroe3();
  }

  if (heroHealth<=0) {
    eLevel=4;
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if

  if (enemyHealth<=0) {
    eLevel=0;
    menuChoice=0;
    mainMenuBackground();
    mainMenu();
    mymouseClicked();
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }
}//end of eLevel3

void eLevel4() {//same as above except enemy level 4

  battleScreen4.resize(1000, 700);
  image(battleScreen4, 0, 0);

  heroHealthe4();
  enemyHealthe1();

  moveEnemy();
  checkDist();
  drawHeroe4();

  if (moveHero) {
    moveHeroe4();
  }

  if (heroHealth<=0) {
    eLevel=5;
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if

  if (enemyHealth<=0) {
    eLevel=0;
    menuChoice=0;
    mainMenuBackground();
    mainMenu();
    mymouseClicked();
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }
}//end of eLevel4

void eLevel5() {//same as above except enemy level 5

  battleScreen5.resize(1000, 700);
  image(battleScreen5, 0, 0);   

  heroHealthe5();
  enemyHealthe1();

  moveEnemy();
  checkDist();
  drawHeroe5();

  if (moveHero) {
    moveHeroe5();
  }  

  if (heroHealth<=0) {
    winner();
  }

  if (enemyHealth<=0) {
    eLevel=0;
    menuChoice=0;
    mainMenuBackground();
    mainMenu();
    mymouseClicked();
    heroHealth=250;
    enemyHealth=250;
    hx=100;
    ex=800;
  }//end of if
}//end of eLevel5

void moveHero() {
  fill(255);
  if (moveRight) {//hero moves right
    if (key==120 && hitEnemy) {//if 'x' is pressed and hitEnemy is true
      gokuAttack[int(frame)].resize(75, 100);
      image(gokuAttack[int(frame)], hx, hy);//goku attacks the enemy
    }//end of if 
    else if (key==99 && specialMove) {//if 'x' is pressed and hitSpecial is true
      gokuSpecial[int(frame)].resize(75, 100);
      image(gokuSpecial[int(frame)], hx, hy);
    }//end of else if 
    else {//if keys arent pressed
      stance=false;//stops moving
      forwardGoku.resize(75, 100);
      image(forwardGoku, hx, hy);//goku is at his stance
      hx+=8;
    }//end of else
  }//end of if moveRight is true
  else if (moveLeft) {//hero moves left
    if (key==120 && hitEnemy) {//if 'x' is pressed and hitEnemy is true
      gokuAttack[int(frame)].resize(75, 100);
      image(gokuAttack[int(frame)], hx, hy);
    }//end of if
    else if (key==99 && specialMove) {//if 'c' is pressed and SpecialMove is true
      gokuSpecial[int(frame)].resize(75, 100);
      image(gokuSpecial[int(frame)], hx, hy);
    }//end of else if
    else {//if keys arent pressed
      stance=false;
      backwardGoku.resize(75, 100);
      image(backwardGoku, hx, hy);
      hx-=8;
    }//end of else
  }//end of else if
  else {
    if (idle==0 || stance) {
      gokuStance.resize(75, 100);
      image(gokuStance, hx, hy);
    }//end of if idle is zero and stance is true
  }//end of else

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }//end of if hero is not on floor

  hy=hy-ySpeed;//hero goes down

  if (hy>587-hw/2) {//hero stops when they hit the floor
    onFloor=true;
    hy=587-hw/2;//hero's y-cord is 510
  } else {//if hero is in the air
    onFloor=false;//on floor is false
  }

  if (hx<=0) {//hero cant go out of screen
    hx=0;
  }
  if (hx+75>width) {//hero cant go out of screen
    hx=925;
  }
}//end of moveHero

void drawEnemyg1() {//enemy for hero level 1
  if (stance || moveEnemy==false) {
    if (hitGoku) {//if player (goku) is hit by enemy
      friezaAttack[int(frame)].resize(75, 100);
      image(friezaAttack[int(frame)], ex, ey);
    }//end of if

    else {//if enemy doesn't hit player (goku)
      friezaStance.resize(75, 100);
      image(friezaStance, ex, ey);
    }//end of else
  }//end of if
}//end of drawEnemy

void checkDist() {
  if (dist(hx, hy, ex, ey)<100) {//if distance between hero and enemy is less than 100
    hitGoku=true;//enemy hits player (goku)
    hitBeerus=true;//hero hits player (beerus)
  }//end of if
}//end of checkDist between player(hero/enemy) and cpu(hero/enemy)


void moveEnemyg1() {//enemy for hero level 1
  if (hx>ex+90) {//enemy moves right if hero's x-coord is greater than enemy's x-coord
    stance=false;//enemy stops standing and moves
    backwardFrieza.resize(75, 100);
    image(backwardFrieza, ex, ey);
    ex+=8;
  }

  if (hx+75<ex) {//enemy moves left if hero's x-coord is less than enemy's x-coord
    stance=false;//enemy stops standing and moves
    forwardFrieza.resize(75, 100);
    image(forwardFrieza, ex, ey);
    ex-=8;
  }

  if (!onFloor) {//if enemy is not on the floor
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//enemy goes down

  if (ey>587-ew/2) {//enemy stops when they hit the floor
    onFloor=true;
    ey=587-ew/2;//enemy's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//enemy cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//enemy cant go out of screen
    ex=925;
  }
}//end of moveEnemy for hero level 1

void drawEnemyg2() {//enemy for hero level 2
  if (stance || moveEnemy==false) {
    if (hitGoku) {
      cellAttack[int(frame)].resize(75, 100);
      image(cellAttack[int(frame)], ex, ey);
    }//end of if

    else {
      cellStance.resize(75, 100);
      image(cellStance, ex, ey);
    }//end of else
  }//end of if
}//end of drawEnemy

void moveEnemyg2() {//enemy for hero level 2
  if (hx>ex+90) {//enemy moves right
    stance=false;
    forwardCell.resize(75, 100);
    image(forwardCell, ex, ey);
    ex+=8;
  }

  if (hx+75<ex) {//enemy moves left
    stance=false;
    backwardCell.resize(75, 100);
    image(backwardCell, ex, ey);
    ex-=8;
  }

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//enemy goes down

  if (ey>587-ew/2) {//enemy stops when they hit the floor
    onFloor=true;
    ey=587-ew/2;//enemy's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//enemy cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//enemy cant go out of screen
    ex=925;
  }
}//end of moveEnemy for hero level 2

void drawEnemyg3() {//enemy for hero level 3
  if (stance || moveEnemy==false) {
    if (hitGoku) {
      buuAttack[int(frame)].resize(75, 100);
      image(buuAttack[int(frame)], ex, ey);
    }//end of if

    else {
      buuStance.resize(75, 100);
      image(buuStance, ex, ey);
    }//end of else
  }//end of if
}//end of drawEnemy

void moveEnemyg3() {//enemy for hero level 3
  if (hx>ex+90) {//enemy moves right
    stance=false;
    backwardBuu.resize(75, 100);
    image(backwardBuu, ex, ey);
    ex+=8;
  }

  if (hx+75<ex) {//enemy moves left
    stance=false;
    forwardBuu.resize(75, 100);
    image(forwardBuu, ex, ey);
    ex-=8;
  }

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//enemy goes down

  if (ey>587-ew/2) {//enemy stops when they hit the floor
    onFloor=true;
    ey=587-ew/2;//enemy's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//enemy cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//enemy cant go out of screen
    ex=925;
  }
}//end of moveEnemy for hero level 3

void drawEnemyg4() {//enemy for hero level 4
  if (stance || moveEnemy==false) {
    if (hitGoku) {
      brolyAttack[int(frame)].resize(75, 100);
      image(brolyAttack[int(frame)], ex, ey);
    }//end of if

    else {
      brolyStance.resize(75, 100);
      image(brolyStance, ex, ey);
    }//end of else
  }//end of if
}//end of drawEnemy

void moveEnemyg4() {//enemy for hero level 4
  if (hx>ex+90) {//enemy moves right
    stance=false;
    backwardBroly.resize(75, 100);
    image(backwardBroly, ex, ey);
    ex+=8;
  }

  if (hx+75<ex) {//enemy moves left
    stance=false;
    forwardBroly.resize(75, 100);
    image(forwardBroly, ex, ey);
    ex-=8;
  }

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//enemy goes down

  if (ey>587-ew/2) {//enemy stops when they hit the floor
    onFloor=true;
    ey=587-ew/2;//enemy's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//enemy cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//enemy cant go out of screen
    ex=925;
  }
}//end of moveEnemy for hero level 4

void drawEnemyg5() {//enemy for hero level 5
  if (stance || moveEnemy==false) {
    if (hitGoku) {
      beerusAttack[int(frame)].resize(75, 100);
      image(beerusAttack[int(frame)], ex, ey);
    }//end of if

    else {
      beerusStance.resize(75, 100);
      image(beerusStance, ex, ey);
    }//end of else
  }//end of if
}//end of drawEnemy

void moveEnemyg5() {//enemy for hero level 5
  if (hx>ex+90) {//enemy moves right
    stance=false;
    backwardBeerus.resize(75, 100);
    image(backwardBeerus, ex, ey);
    ex+=8;
  }

  if (hx+75<ex) {//enemy moves left
    stance=false;
    forwardBeerus.resize(75, 100);
    image(forwardBeerus, ex, ey);
    ex-=8;
  }

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//enemy goes down

  if (ey>587-ew/2) {//enemy stops when they hit the floor
    onFloor=true;
    ey=587-ew/2;//enemy's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//enemy cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//enemy cant go out of screen
    ex=925;
  }
}//end of moveEnemy for hero level 5

void moveEnemy() {
  fill(255);//white
  if (moveRight) {//enemy (player) moves right
    if (key==120 && hitEnemy) {
      beerus2Attack[int(frame)].resize(75, 100);
      image(beerus2Attack[int(frame)], hx, hy);
    }//end of if
    else if (key==99 && specialMove) {
      beerus2Special[int(frame)].resize(75, 100);
      image(beerus2Special[int(frame)], hx, hy);
    }//end of else if
    else {
      stance=false;
      forwardBeerus2.resize(75, 100);
      image(forwardBeerus2, hx, hy);
      hx+=8;
    }//end of else
  }//end of if enemy (player) moves right
  else if (moveLeft) {//enemy moves left
    if (key==120 && hitEnemy) {
      beerus2Attack[int(frame)].resize(75, 100);
      image(beerus2Attack[int(frame)], hx, hy);
    }//end of if 
    else if (key==99 && specialMove) {
      beerus2Special[int(frame)].resize(75, 100);
      image(beerus2Special[int(frame)], hx, hy);
    }//end of else if
    else {
      stance=false;
      backwardBeerus2.resize(75, 100);
      image(backwardBeerus2, hx, hy);
      hx-=8;
    }//end of else
  }//end of else if enemy (player) moves left
  else {//if enemy (player) doesnt move left or right
    if (idle==0 || stance) {
      beerusStance2.resize(75, 100);
      image(beerusStance2, hx, hy);//player stands in their stance
    }//end of if
  }//end of else

  if (!onFloor) {//if enemy (player) isnt on the floor
    ySpeed=ySpeed-gravity;
  }
  hy=hy-ySpeed;//enemy goes down

  if (hy>587-ew/2) {//enemy stops when they hit the floor
    onFloor=true;
    hy=587-ew/2;//enemy's y-cord is 510
  } else {
    onFloor=false;
  }

  if (hx<=0) {//enemy cant go out of screen
    hx=0;
  }
  if (hx+75>width) {//enemy cant go out of screen
    hx=925;
  }
}//end of moveEnemy

void drawHeroe1() {//hero for enemy level 1
  if (stance || moveHero==false) {
    if (hitBeerus) {
      gotenAttack[int(frame)].resize(75, 100);
      image(gotenAttack[int(frame)], ex, ey);
    } else {
      gotenStance.resize(75, 100);
      image(gotenStance, ex, ey);
    }
  }
}//end of drawHeroe1

void moveHeroe1() {//hero for enemy level 1
  if (hx>ex+90) {//hero moves right
    stance=false;
    backwardGoten.resize(75, 100);
    image(backwardGoten, ex, ey);
    ex+=8;
  }
  if (hx+75<ex) {//hero moves left
    forwardGoten.resize(75, 100);
    image(forwardGoten, ex, ey);
    ex-=8;
  }

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//hero goes down

  if (ey>587-hw/2) {//hero stops when they hit the floor
    onFloor=true;
    ey=587-hw/2;//hero's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//hero cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//hero cant go out of screen
    ex=925;
  }
}//end of moveHeroe1

void drawHeroe2() {//hero for enemy level 2
  if (stance || moveHero==false) {
    if (hitBeerus) {
      trunksAttack[int(frame)].resize(75, 100);
      image(trunksAttack[int(frame)], ex, ey);
    } else {
      trunksStance.resize(75, 100);
      image(trunksStance, ex, ey);
    }
  }
}//end of drawHeroe2

void moveHeroe2() {//hero for enemy level 2
  if (hx>ex+90) {//hero moves right
    stance=false;
    backwardTrunks.resize(75, 100);
    image(backwardTrunks, ex, ey);
    ex+=8;
  }
  if (hx+75<ex) {//hero moves left
    forwardTrunks.resize(75, 100);
    image(forwardTrunks, ex, ey);
    ex-=8;
  }

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//hero goes down

  if (ey>587-hw/2) {//hero stops when they hit the floor
    onFloor=true;
    ey=587-hw/2;//hero's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//hero cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//hero cant go out of screen
    ex=925;
  }
}//end of moveHeroe2

void drawHeroe3() {//hero for enemy level 3
  if (stance || moveHero==false) {
    if (hitBeerus) {
      gohanAttack[int(frame)].resize(75, 100);
      image(gohanAttack[int(frame)], ex, ey);
    } else {
      gohanStance.resize(75, 100);
      image(gohanStance, ex, ey);
    }
  }
}//end of drawHeroe3

void moveHeroe3() {//hero for enemy level 3
  if (hx>ex+90) {//hero moves right
    stance=false;
    backwardGohan.resize(75, 100);
    image(backwardGohan, ex, ey);
    ex+=8;
  }
  if (hx+75<ex) {//hero moves left
    forwardGohan.resize(75, 100);
    image(forwardGohan, ex, ey);
    ex-=8;
  }

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//hero goes down

  if (ey>587-hw/2) {//hero stops when they hit the floor
    onFloor=true;
    ey=587-hw/2;//hero's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//hero cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//hero cant go out of screen
    ex=925;
  }
}//end of moveHeroe3

void drawHeroe4() {//hero for enemy level 4
  if (stance || moveHero==false) {
    if (hitBeerus) {
      vegetaAttack[int(frame)].resize(75, 100);
      image(vegetaAttack[int(frame)], ex, ey);
    } else {
      vegetaStance.resize(75, 100);
      image(vegetaStance, ex, ey);
    }
  }
}//end of drawHeroe4

void moveHeroe4() {//hero for enemy level 4
  if (hx>ex+90) {//hero moves right
    stance=false;
    backwardVegeta.resize(75, 100);
    image(backwardVegeta, ex, ey);
    ex+=8;
  }
  if (hx+75<ex) {//hero moves left
    forwardVegeta.resize(75, 100);
    image(forwardVegeta, ex, ey);
    ex-=8;
  }

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//hero goes down

  if (ey>587-hw/2) {//hero stops when they hit the floor
    onFloor=true;
    ey=587-hw/2;//hero's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//hero cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//hero cant go out of screen
    ex=925;
  }
}//end of moveHeroe4

void drawHeroe5() {//hero for enemy level 5
  if (stance || moveHero==false) {
    if (hitBeerus) {
      SuperVegetaAttack[int(frame)].resize(75, 100);
      image(SuperVegetaAttack[int(frame)], ex, ey);
    } else {
      SuperVegetaStance.resize(75, 100);
      image(SuperVegetaStance, ex, ey);
    }
  }
}//end of drawHeroe5

void moveHeroe5() {//hero for enemy level 5
  if (hx>ex+90) {//hero moves right
    stance=false;
    backwardSuperVegeta.resize(75, 100);
    image(backwardSuperVegeta, ex, ey);
    ex+=8;
  }
  if (hx+75<ex) {//hero moves left
    forwardSuperVegeta.resize(75, 100);
    image(forwardSuperVegeta, ex, ey);
    ex-=8;
  }

  if (!onFloor) {
    ySpeed=ySpeed-gravity;
  }

  ey=ey-ySpeed;//hero goes down

  if (ey>587-hw/2) {//hero stops when they hit the floor
    onFloor=true;
    ey=587-hw/2;//hero's y-cord is 510
  } else {
    onFloor=false;
  }
  if (ex<=0) {//hero cant go out of screen
    ex=0;
  }
  if (ex+75>width) {//hero cant go out of screen
    ex=925;
  }
}//end of moveHeroe5

boolean hitBox(float h1x, float h1y, float h1w, float h1h, float e1x, float e1y, float e1w, float e1h) {
  float h1Bot, h1Right;
  float e1Bot, e1Right;
  h1Right=h1x+h1w;
  h1Bot=h1y+h1h;

  e1Right=e1x+e1w;
  e1Bot=e1y+e1h;


  if (h1Right > e1x && h1x < e1Right && h1Bot > e1y && h1y < e1Bot) {
    return true;
  }

  return false;
}//end of hitBox

//for hero level 1
void heroHealthg1() {

  start++;
  moveEnemy=false;

  if (start>10) {//if start is greater than 10
    damage=true; //damage is true
    moveEnemy=true;//enemy can move
  }

  textSize(40);
  text(heroHealth, 200, 100);
  textSize(50);
  text("Hero", 50, 75);
  fill(255, 0, 0);
  rect(150, 50, heroHealth, 20);//health bar for hero

  if (hitBox(ex, ey, ew, eh, hx, hy, hw, hh) && damage && hx<ex+80) {//if enemy collides with hero and damage is true and hero's x-coord is less than enemy's x-coord
    if (gLevel==1) {
      heroHealth-=25;//hero's health decreases
      moveEnemy=false;//enemy cant move
      start=0;//start resets
      damagedGoku.resize(75, 100);//goku is damaged
      image(damagedGoku, hx, hy);
      hx-=100;//hero is pushed back
    }
    if (gLevel==2) {
      heroHealth-=30;//hero's health decreases
      moveEnemy=false;//enemy cant move
      start=0;//start resets
      damagedGoku.resize(75, 100);//goku is damaged
      image(damagedGoku, hx, hy);
      hx-=100;//hero is pushed back
    }
    if (gLevel==3) {
      heroHealth-=35;//hero's health decreases
      moveEnemy=false;//enemy cant move
      start=0;//start resets
      damagedGoku.resize(75, 100);//goku is damaged
      image(damagedGoku, hx, hy);
      hx-=100;//hero is pushed back
    }
    if (gLevel==4) {
      heroHealth-=40;//hero's health decreases
      moveEnemy=false;//enemy cant move
      start=0;//start resets
      damagedGoku.resize(75, 100);//goku is damaged
      image(damagedGoku, hx, hy);
      hx-=100;//hero is pushed back
    }
    if (gLevel==5) {
      heroHealth-=45;//hero's health decreases
      moveEnemy=false;//enemy cant move
      start=0;//start resets
      damagedGoku.resize(75, 100);//goku is damaged
      image(damagedGoku, hx, hy);
      hx-=100;//hero is pushed back
    }
  }//end of if

  if (hitBox(ex, ey, ew, eh, hx, hy, hw, hh) && damage && hx+80<ex) {
    heroHealth-=25;
    moveEnemy=false;
    start=0;
    damagedGoku.resize(75, 100);
    image(damagedGoku, hx, hy);
    hx+=100;
  }//end of if
}//end of heroHealth

void enemyHealthg1() {
  textSize(40);
  text(enemyHealth, 650, 100);
  text("Enemy", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, enemyHealth, 20);//health bar for enemy

  if (hitEnemy && hx+85>=ex) {//if enemy is hit by hero and hero's x-coord is greater than or equal to enemy's x-coord
    enemyHealth-=25;//enemy's health decreases
    moveEnemy=false;//enemy cant move
    damagedFrieza.resize(75, 100);//enemy is damaged
    image(damagedFrieza, ex, ey);
    ex+=100;//enemy is pushed back
  }//end of if

  if (specialMove && hx+85>=ex) {//if enemy is hit by hero's special and hero's x-coord is greater than or equal to enemy's x-coord
    enemyHealth-=40;//enemy's health decreases
    moveEnemy=false;//enemy cant move
    damagedFrieza.resize(75, 100);//enemy is damaged
    image(damagedFrieza, ex, ey);
    ex+=150;//enemy is pushed back
  }//end of if
}//end of enemyHealthg1

void enemyHealthg2() {
  textSize(40);
  text(enemyHealth, 650, 100);
  text("Enemy", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, enemyHealth, 20);

  if (hitEnemy && hx+85>=ex) {
    enemyHealth-=25;
    moveEnemy=false;
    damagedCell.resize(75, 100);
    image(damagedCell, ex, ey);
    ex+=100;
  }//end of if

  if (specialMove && hx+85>=ex) {
    enemyHealth-=40;
    moveEnemy=false;
    damagedCell.resize(75, 100);
    image(damagedCell, ex, ey);
    ex+=150;
  }
}//end of enemyHealthg2

void enemyHealthg3() {
  textSize(40);
  text(enemyHealth, 650, 100);
  text("Enemy", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, enemyHealth, 20);

  if (hitEnemy && hx+85>=ex) {
    enemyHealth-=25;
    moveEnemy=false;
    damagedBuu.resize(75, 100);
    image(damagedBuu, ex, ey);
    ex+=100;
  }//end of if

  if (specialMove && hx+85>=ex) {
    enemyHealth-=40;
    moveEnemy=false;
    damagedBuu.resize(75, 100);
    image(damagedBuu, ex, ey);
    ex+=150;
  }
}//end of enemyHealthg3

void enemyHealthg4() {
  textSize(40);
  text(enemyHealth, 650, 100);
  text("Enemy", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, enemyHealth, 20);

  if (hitEnemy && hx+85>=ex) {
    enemyHealth-=25;
    moveEnemy=false;
    damagedBroly.resize(75, 100);
    image(damagedBroly, ex, ey);
    ex+=100;
  }//end of if

  if (specialMove && hx+85>=ex) {
    enemyHealth-=40;
    moveEnemy=false;
    damagedBroly.resize(75, 100);
    image(damagedBroly, ex, ey);
    ex+=150;
  }
}//end of enemyHealthg4

void enemyHealthg5() {
  textSize(40);
  text(enemyHealth, 650, 100);
  text("Enemy", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, enemyHealth, 20);

  if (hitEnemy && hx+85>=ex) {
    enemyHealth-=25;
    moveEnemy=false;
    damagedBeerus.resize(75, 100);
    image(damagedBeerus, ex, ey);
    ex+=100;
  }//end of if

  if (specialMove && hx+85>=ex) {
    enemyHealth-=40;
    moveEnemy=false;
    damagedBeerus.resize(75, 100);
    image(damagedBeerus, ex, ey);
    ex+=150;
  }
}//end of enemyHealthg5

//for enemy levels
void enemyHealthe1() {//enemy (player) for ALL enemy levels

  start++;//start increases
  moveHero=false;//enemy cant move

  if (start>10) {//if start is greather than 10
    damage=true; //damage is true
    moveHero=true;//hero (cpu) can move
  }

  textSize(40);
  text(enemyHealth, 200, 100);
  textSize(50);
  text("Enemy", 25, 75);
  fill(255, 0, 0);
  rect(150, 50, enemyHealth, 20);//enemy's health bar

  if (hitBox(ex, ey, hw, hh, hx, hy, ew, eh) && damage && hx<ex+80) {//if enemy is hit by hero and hero's x-coord is less than enemy's x-coord
    if (eLevel==1) {
      enemyHealth-=25;//enemy's health decreases
      moveHero=false;//hero cant move
      damagedBeerus2.resize(75, 100);//enemy is damageed
      image(damagedBeerus2, hx, hy);
      start=0;//start resets to zero
      hx-=100;//enemy is pushed back
    }
    if (eLevel==2) {
      enemyHealth-=30;//enemy's health decreases
      moveHero=false;//hero cant move
      damagedBeerus2.resize(75, 100);//enemy is damageed
      image(damagedBeerus2, hx, hy);
      start=0;//start resets to zero
      hx-=100;//enemy is pushed back
    }
    if (eLevel==3) {
      enemyHealth-=35;//enemy's health decreases
      moveHero=false;//hero cant move
      damagedBeerus2.resize(75, 100);//enemy is damageed
      image(damagedBeerus2, hx, hy);
      start=0;//start resets to zero
      hx-=100;//enemy is pushed back
    }
    if (eLevel==4) {
      enemyHealth-=40;//enemy's health decreases
      moveHero=false;//hero cant move
      damagedBeerus2.resize(75, 100);//enemy is damageed
      image(damagedBeerus2, hx, hy);
      start=0;//start resets to zero
      hx-=100;//enemy is pushed back
    }
    if (eLevel==5) {
      enemyHealth-=45;//enemy's health decreases
      moveHero=false;//hero cant move
      damagedBeerus2.resize(75, 100);//enemy is damageed
      image(damagedBeerus2, hx, hy);
      start=0;//start resets to zero
      hx-=100;//enemy is pushed back
    }
  }//end of if

  if (hitBox(ex, ey, hw, hh, hx, hy, ew, eh) && damage && hx+80<ex) {
    enemyHealth-=25;
    moveHero=false;
    damagedBeerus2.resize(75, 100);
    image(damagedBeerus2, hx, hy);
    start=0;
    hx+=100;
  }//end of if
}//end of enemyHealthe1

void heroHealthe1() {//enemy level 1
  fill(255);
  textSize(40);
  text(heroHealth, 650, 100);
  text("Hero", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, heroHealth, 20);//hero's (cpu)  health bar

  if (hitEnemy && hx+85>=ex) {//if hero is hit by enemy and hero's x-coord is greater than or equal to enemy's x-coord
    heroHealth-=25;//hero's health decreases
    moveHero=false;//hero cant move
    damagedGoten.resize(75, 100);//hero is damaged
    image(damagedGoten, ex, ey);
    ex+=100;//hero is pushed back
  }//end of if

  if (specialMove && hx+85>=ex) {//if hero is hit by enemy's special and hero's x-coord is greater than or equal to enemy's x-coord
    heroHealth-=40;//hero's health decreases
    moveHero=false;//hero cant move
    damagedGoten.resize(75, 100);//hero is damaged
    image(damagedGoten, ex, ey);
    ex+=150;//hero is pushed back
  }//end of if
}//end of heroHealthe1

void heroHealthe2() {//enemy level 2
  fill(255);
  textSize(40);
  text(heroHealth, 650, 100);
  text("Hero", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, heroHealth, 20);

  if (hitEnemy && hx+85>=ex) {
    heroHealth-=25;
    moveHero=false;
    damagedTrunks.resize(75, 100);
    image(damagedTrunks, ex, ey);
    ex+=100;
  }//end of if

  if (specialMove && hx+85>=ex) {
    heroHealth-=40;
    moveHero=false;
    damagedTrunks.resize(75, 100);
    image(damagedTrunks, ex, ey);
    ex+=150;
  }
}//end of heroHealthe2


void heroHealthe3() {//enemy level 3
  fill(255);
  textSize(40);
  text(heroHealth, 650, 100);
  text("Hero", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, heroHealth, 20);

  if (hitEnemy && hx+85>=ex) {
    heroHealth-=25;
    moveHero=false;
    damagedGohan.resize(75, 100);
    image(damagedGohan, ex, ey);
    ex+=100;
  }//end of if

  if (specialMove && hx+85>=ex) {
    heroHealth-=40;
    moveHero=false;
    damagedGohan.resize(75, 100);
    image(damagedGohan, ex, ey);
    ex+=150;
  }
}//end of heroHealthe3


void heroHealthe4() {//enemy level 4
  fill(255);
  textSize(40);
  text(heroHealth, 650, 100);
  text("Hero", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, heroHealth, 20);

  if (hitEnemy && hx+85>=ex) {
    heroHealth-=25;
    moveHero=false;
    damagedVegeta.resize(75, 100);
    image(damagedVegeta, ex, ey);
    ex+=100;
  }//end of if

  if (specialMove && hx+85>=ex) {
    heroHealth-=40;
    moveHero=false;
    damagedVegeta.resize(75, 100);
    image(damagedVegeta, ex, ey);
    ex+=150;
  }
}//end of heroHealthe4


void heroHealthe5() {//enemy level 5
  fill(255);
  textSize(40);
  text(heroHealth, 650, 100);
  text("Hero", 875, 75);
  fill(255, 0, 0);
  rect(600, 50, heroHealth, 20);

  if (hitEnemy && hx+85>=ex) {
    heroHealth-=25;
    moveHero=false;
    damagedSuperVegeta.resize(75, 100);
    image(damagedSuperVegeta, ex, ey);
    ex+=100;
  }//end of if

  if (specialMove && hx+85>=ex) {
    heroHealth-=40;
    moveHero=false;
    damagedSuperVegeta.resize(75, 100);
    image(damagedSuperVegeta, ex, ey);
    ex+=150;
  }
}//end of heroHealthe5

void instructions() {
  menuBackground.resize(1000, 700);
  image(menuBackground, 0, 0);
  textSize(80);
  text("How To Play", 325, 250);
  textSize(40);
  text("Use the arrow keys to move around", 275, 450);
  text("Space bar to jump", 350, 500);
  text("'x' to attack", 385, 550);
  text("'c' for special", 385, 600);
  text("You must be moving while clicking the attacking buttons to do damage", 75, 650);
  text("Back", 50, 75);//back button to go back to main menu
  if (mousePressed && mouseX>50 && mouseX<105 && mouseY>45 && mouseY<75) {//is back button is pressed
    menuChoice=0; 
    mainMenuBackground();
    mainMenu();//player goes to back to main menu screen
  }//end of if
}//end of instructions

void draw() {
  mainMenuBackground();//background for main menu
  mainMenu();//main menu screen
  mymouseClicked();//allows player to click and switch screens

  if (menuChoice==1) {//if menu choice is 1
    play();//play screen to choose sides ('good' or 'evil')
  }
  if (menuChoice==2) {//if menu choice is 2
    instructions();//instructions screen
  }

  if (gLevel==1) {//if hero level equals 1
    level1();//hero level 1
  }
  if (gLevel==2) {//if hero level equals 2
    level2();//hero level 2
  }
  if (gLevel==3) {//if hero level equals 3
    level3();//hero level 3
  }
  if (gLevel==4) {//if hero level equals 4
    level4();//hero level 4
  }
  if (gLevel==5) {//if hero level equals 5
    level5();//hero level 5
  }

  if (eLevel==1) {//if enemy level equals 1
    eLevel1();//enemy level 1
  }
  if (eLevel==2) {//if enemy level equals 2
    eLevel2();//enemy level 2
  }
  if (eLevel==3) {//if enemy level equals 3
    eLevel3();//enemy level 3
  }
  if (eLevel==4) {//if enemy level equals 4
    eLevel4();//enemy level 4
  }
  if (eLevel==5) {//if enemy level equals 5
    eLevel5();//enemy level 5
  }
}//end of draw

void keyPressed() {
  if (key==CODED && keyCode==RIGHT) {//if right arrow key is pressed
    moveRight=true;//move right is true
  } 
  if (key==CODED && keyCode==LEFT) {//if left arrow key is pressed
    moveLeft=true;//move left is true
  }
  if (keyCode==32 && onFloor) {//if space bar is pressed and player is on floor
    ySpeed=jumpPower;//player jumps
  }
  if (key==120) {//'x'
    hitEnemy=true;
  }
  if (key==99) {//'c'
    specialMove=true;
  }
}//end of keyPressed

void keyReleased() {
  if (key==CODED && keyCode==RIGHT) {
    moveRight=false;
  }
  if (key==CODED && keyCode==LEFT) {
    moveLeft=false;
  }
  if (key==120) {
    hitEnemy=false;
  }
  if (key==99) {
    specialMove=false;
  }
}//end of keyReleased
