import com.temboo.core.*;
import com.temboo.Library.Google.Gmail.*;
import com.temboo.Library.Twitter.Tweets.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

TembooSession session = new TembooSession("cindyh127", "myFirstApp", "Khsz7VskYm2Um4BCA0L672DU4Uk6uu42");

//next on start screen
int XPos1 = 100;
int YPos1 = 550;
int width1 = 210;
int height1 = 50;
//browse/favorites
int XPos2 = 100;
int YPos2 = 100;
int width2 = 210;
int height2 = 50;
int XPos3 = 100;
int YPos3 = 400;
int width3 = 210;
int height3 = 50;
//animals/
int XPos4 = 100;
int YPos4 = 200;
int width4 = 210;
int height4 = 50;
int XPos5 = 100;
int YPos5 = 350;
int width5 = 210;
int height5 = 50;
int XPos6 = 100;
int YPos6 = 500;
int width6 = 210;
int height6 = 50;
int backBrowseX = 270;
int backBrowseY = 20;
int backBrowseW = 100;
int backBrowseH = 50;
int searchX = 20;
int searchY = 20;
int searchW = 90;
int searchH =  30;
//int linkButtonX = 270;
//int linkButtonY = 100;
//int linkButtonW = 100;
//int linkButtonH = 50;
int screen = 0;
int backHomeX = 50;
int backHomeY = 600;
int backHomeW = 100;
int backHomeH = 50;

//int heartX = 330;
//int heartY = 300;
int favoriteY = 0;

int descriptionHomeColor = #000000;
int descriptionBrowseOpacity = 255;

//button colors
int color1 = #94A59A;
int color2 = #7595E3;
int color3 = #7595E3;
int color4 = #EB94F0;
int color5 = #AC71E0;
int color6 = #9CA6FA;
int backColor = #E17CE3;
int backHomeColor = #E17CE3;
int linkButtonColor = #9873F2;
int searchColor = #9DACAD;

boolean dragging = false;
int drag1 = 0;
int drag2 = 0;
int drag3 = 0;


Opportunity[] fav = new Opportunity[15]; 
Opportunity[] animals = new Opportunity[5]; 
Opportunity[] feminism = new Opportunity[5]; 
Opportunity[] health = new Opportunity[5]; 
int[] newColors = {color1, color2, color3, color4, color5, color6, backColor, backHomeColor, linkButtonColor, searchColor};
int[] originalColors = {#94A59A, #7595E3, #7595E3, #EB94F0, #AC71E0, #9CA6FA, #E17CE3, #E17CE3, #9873F2, #C79EE3 };

String email = "";
boolean emailDone = false;

String search = "";
boolean searchDone = false;
boolean noMatch = true;

String animalLinks = "";
String feminismLinks = "";
String healthLinks = "";

boolean firstTime1 = true;
boolean firstTime2 = true;
boolean firstTime3 = true;

void setup() {
  size(400, 700);
  Opportunity animalfund = new Opportunity(8, false, false, "http://fundforanimals.org/?referrer=https://www.google.com/?referrer=http://fundforanimals.org/", loadImage("fundforanimals.png"), false, "The Fund for Animals", 0, 0, 150, "By adopting one of our rescued animals, your monthly donation of $18\r(or whatevre you can afford) will help The Fund for Animals provide safe haven to animals rescued from horrible cruleties. Your monthly donation will be used to support all of the Fund's critical work-from providing sanctuary to rehabilitating and releasing injured animals back into the wild.");
  Opportunity aspca = new Opportunity(9, false, false, "https://www.aspca.org/ways-to-give", loadImage("Abusing Animals.jpg"), false, "ASPCA", 0, height, 150, "For over 150 years, the ASPCA has worked tirelessly to put an end to animal abuse and neglect. We are a national leader in the areas of rescue, adoption and welfare, and your tax-deductible donation will help fight cruelty and make a life-changing difference for animals across America.");
  Opportunity bronxZoo = new Opportunity(10, false, false, "https://secure3.convio.net/wcs/site/Donation2?df_id=11321&mfc_pref=T&11321.donation=form1&_ga=1.31964344.743885682.1493347239", loadImage("Day-Trip-Bronx-Zoo.jpg"), false, "Bronx Zoo", 0, 2*height, 150, "When you give to WCS, you join a community on the front lines of the fight to save wildlife. Together, we are working to secure a future these species might not otherwise have and it starts right here in New York City.");
  Opportunity petFund = new Opportunity(11, false, false, "http://www.thepetfund.com/to-donate", loadImage("petfund.png"), false, "Pet Fund", 0, 3*height, 150, "We need your help. The Pet Fund is supported by donations from individuals, corporate sponsorships, and foundation grants. Your contribution will have a significant impact on the lives of companion animals and their owners.");
  Opportunity awi = new Opportunity(12, false, false, "https://awionline.org/content/make-donation-awi", loadImage("animalwelfareinstitute.png"), false, "AWI", 0, 4*height, 130, "Our work to protect animals would not be possible without the generous donations we receive each year. AWI is committed to using our donors’ contributions for the direct benefit of animals, with more than 91% of funds going toward program expenses. Because of our fiscal responsibility and transparency, AWI has been awarded an A+ rating by CharityWatch.");
  Opportunity femsplain  = new Opportunity(13, false, false, "https://femsplain.com/donate-to-femsplain-b47639f7f2dd", loadImage("femsplain.png"), false, "Femsplain", 0, 0, 130, "Since Femsplain launched in October of 2014, we’ve been focused on creating community and giving a platform to trans/cis women, trans men, and gender nonconforming writers. Femsplain is one of the very few independently owned and operated by queer/femme folks. We’ve shared thousands of personal essays so far, but we need your supportto continue compensating our writers for their work.");
  Opportunity wrc = new Opportunity(14, false, false, "https://www.womensrefugeecommission.org/", loadImage("womenrefugeecommision.jpg"), false, "Women's Refugee Commision", 0, height, 130, "Help us advocate for refugee women and children. President Trump’s Executive Orders issued during his first week effectively slams America’s door in the face of thousands of men, women and children seeking protection from religious, ethnic and political persecution around the world. WRC staff is on the front lines advocating for the critical rights and protection of refugee women and children. Donate now to help us continue with our critical work.");
  Opportunity wgef = new Opportunity(15, false, false, "http://wgefund.org/donatenow/", loadImage("womenglobalempowermentfund.jpg"), false, "WGEF", 0, 2*height, 150, "Help Women’s Global Empowerment Fund with your tax-deductible gift today!  Your donation empowers women to start their own businesses, obtain training in literacy, leadership development and health for themselves and their families.  Follow the link below for simple, secure giving.  Thanks for your support!");
  Opportunity promujer = new Opportunity(16, false, false, "https://promujer.secure.force.com/donate", loadImage("promujer.png"), false, "Pro Mujer", 0, 3*height, 150, "Pro Mujer is a 501(c)3 non-profit organization. Gifts are tax-deductible and help transform the lives of low-income women and their families. Thank you for considering a gift!");
  Opportunity plannedParenthood = new Opportunity(17, false, false, "https://secure.ppaction.org/site/Donation2?df_id=12913&12913.donation=form1&_ga=1.48236390.1300324125.1448909610", loadImage("plannedparenthood.jpg"), false, "Planned Parenthood", 0, 4*height, 150, "For the past century, Planned Parenthood has transformed women's health and empowered millions of people worldwide to make informed health decisions, forever changing the way they live, love, learn and work.");
  Opportunity stJudes = new Opportunity(18, false, false, "https://www.stjude.org/about-st-jude/faq/how-can-i-donate-to-st-jude.html", loadImage("olivia-holt-st-jude-shirt-oct-20-2013.jpg"), false, "St. Jude's", 0, 0, 150, "The mission of St. Jude Children’s Research Hospital is to advance cures, and means of prevention, for pediatric catastrophic diseases through research and treatment. Consistent with the vision of our founder Danny Thomas, no child is denied treatment based on race, religion or a family's ability to pay.");
  Opportunity acs = new Opportunity(19, false, false, "https://www.cancer.org/involved/donate.html", loadImage("AdvHumPrintAdDefiance-5735e8ba71caa.jpg"), false, "American Cancer Society", 0, height, 150, "Donate to the American Cancer Society. Your gift means we can bring hope to cancer patients. Together we are fighting cancer smarter, better and harder than we ever have before. Thank you for your support."); 
  Opportunity amfAR = new Opportunity(20, false, false, "http://www.amfar.org/donate/", loadImage("amfAR.jpg"), false, "amfAR", 0, 2*height, 150, "amfAR provides vital funding to scientists who bring fresh perspectives, innovative ideas, and new energy to the HIV/AIDS research field. But to make sure we support every worthy study in the fight against AIDS, we need your help"); 
  Opportunity encourageKids = new Opportunity(21, false, false, "https://encourage-kids.networkforgood.com/", loadImage("encouragekids.jpg"), false, "Encourage Kids", 0, 3*height, 150, "For the past 32 years, enCourage Kids Foundation has enhanced the quality of life for millions of children with health challenges and chronic illnesses. We bring programs to pediatric patients that hospital budgets typically don't cover and that help children successfully cope with illness, injury and treatment so that they may continue to live normal lives during their medical journey.  ");
  Opportunity makeAWish = new Opportunity(22, false, false, "https://secure2.wish.org/site/SPageServer?pagename=donate_now&chid=100-000&chid=100-000#sm.0000ifkvjb19o7dsltcebdpc4dgnv", loadImage("Quote-Dryden_290.jpg"), false, "Make a Wish ", 0, 4*height, 130, "Tens of thousands of volunteers, donors and supporters advance the Make-A-Wish®vision to grant the wish of every child diagnosed with a life-threatening medical condition. In the United States and its territories, on average, a wish is granted every 34 minutes. We believe a wish experience can be a game-changer. This one belief guides us and inspires us to grant wishes that change the lives of the kids we serve.");


  fav[0]  = animalfund;
  fav[1]  = aspca;
  fav[2]  = bronxZoo;
  fav[3]  = petFund;
  fav[4]  = awi;
  fav[5]  = femsplain;
  fav[6]  = wrc;
  fav[7]  = wgef;
  fav[8]  = promujer;
  fav[9]  = plannedParenthood;
  fav[10] = stJudes;
  fav[11] = acs;
  fav[12] = amfAR;
  fav[13] = encourageKids;
  fav[14] = makeAWish;

  animals[0]  = animalfund;
  animals[1]  = aspca;
  animals[2]  = bronxZoo;
  animals[3]  = petFund;
  animals[4]  = awi;

  feminism[0]  = femsplain;
  feminism[1]  = wrc;
  feminism[2]  = wgef;
  feminism[3]  = promujer;
  feminism[4]  = plannedParenthood;

  health[0] = stJudes;
  health[1] = acs;
  health[2] = amfAR;
  health[3] = encourageKids;
  health[4] = makeAWish;
}
void draw() {
  println(screen);
  println(noMatch);
  PImage cursor;
  cursor = loadImage("113036-glowing-purple-neon-icon-business-cursor.png");
  cursor.resize(32, 32);
  cursor(cursor);

  background(#F2F8FA);
  //changes gamescreens
  if (screen == 0) {
    drawStart();
  } else if (screen==1 ) {
    drawHome();
  } else if (screen == 2) {
    drawBrowse();
  } else if (screen == 3) {
    drawFavorites();
  } else if (screen == 4) {
    drawScreen4();
  } else if (screen == 5) {
    drawScreen5();
  } else if (screen == 6) {
    drawScreen6();
  } else if (screen == 7) {
    drawScreen7();
  } else if (screen>7&&screen<23) {
    drawScreen8();
  } else if (screen ==23) {
    drawScreen23();
  }
  //} else {
  //  //error
  //}

  if (screen==4) {
    if (!mousePressed && dragging) dragging = false;
    if (dragging)
    {

      drag1 = -pmouseY+mouseY;

      for (int i = 0; i<animals.length; i++) {
        animals[i].setY(drag1);
      }
    }
  }
  if (screen==5) {
    if (!mousePressed && dragging) dragging = false;
    if (dragging)
    {

      drag2 = -pmouseY+mouseY;

      for (int i = 0; i<animals.length; i++) {
        feminism[i].setY(drag2);
      }
    }
  }
  if (screen==6) {
    if (!mousePressed && dragging) dragging = false;
    if (dragging)
    {

      drag3 = -pmouseY+mouseY;

      for (int i = 0; i<animals.length; i++) {
        health[i].setY(drag3);
      }
    }
  }
}


void drawStart() {
  mouseOver(XPos1, YPos1, width1, height1, 0);
  background(#FFFFFF);
  PImage img;
  img = loadImage("logo.png");
  image(img, 80, 100, 250, 200);
  noStroke();
  fill(newColors[0]);
  rect(XPos1, YPos1, width1, height1);
  fill(#FFFFFF);
  textSize(30);
  text("Start", XPos1+70, YPos1+35);
  fill(#1E0862);
  textSize(15);
  text("We all need to give back sometimes and there are so many different people and animals who need our help. This app will help you find certain organization you can donate to based on what you are interested. Click start to get begin.", 80, 320, 250, 200);
}

void drawHome() {
  background(#FFFFFF);
  fill(newColors[1]);
  rect(XPos2, YPos2, width2, height2);
  fill(newColors[2]);
  rect(XPos3, YPos3, width3, height3);
  fill(#FFFFFF);
  textSize(30);
  text("Browse", XPos2+50, YPos2+35);
  text("Favorites", XPos3+40, YPos3+35);
  //descriptions
  fill(descriptionHomeColor);
  textSize(15);
  text("Here you can browse through different organizations to donate to.", 100, 170, 210, 200);
  text("While viewing an opportunity you can click the space button and favorite it. Then if you click here you can see all your favorites here", 100, 470, 210, 200);
  mouseOver(XPos2, YPos2, width2, height2, 1);
  mouseOver(XPos3, YPos3, width3, height3, 2);
}

void drawBrowse() {
  background(#FFFFFF);
  fill(newColors[7]);
  rect(backHomeX, backHomeY, backHomeW, backHomeH);
  textSize(25);
  fill(#FFFFFF);
  text("Back", backHomeX+7, backHomeY+30);
  fill(newColors[3]);
  rect(XPos4, YPos4, width4, height4);
  fill(newColors[4]);
  rect(XPos5, YPos5, width5, height5);
  fill(newColors[5]);
  rect(XPos6, YPos6, width6, height6);
  fill(#FFFFFF);
  textSize(30);
  text("Animals", XPos4+50, YPos4+35);
  text("feminism", XPos5+40, YPos5+35);
  text("Health", XPos6+35, YPos6+35);
  fill(#EB94F0, descriptionBrowseOpacity);
  textSize(15);
  text("Click these different fields to see organizations you can support that work to fix issues in these fields.", 100, 60, 210, 200);
  mouseOver(backHomeX, backHomeY, backHomeW, backHomeH, 7);
  mouseOver(XPos4, YPos4, width4, height4, 3);
  mouseOver(XPos5, YPos5, width5, height5, 4);
  mouseOver(XPos6, YPos6, width6, height6, 5);
  fill(newColors[9]);
  rect(searchX, searchY, searchW, searchH, 90, 90, 90, 90);
  fill(#FFFFFF);
  text("Search", searchX+10, searchY+20);
  mouseOver(searchX, searchY, searchW, searchH, 9);
}
void drawFavorites() {
  background(#FFFFFF);
  fill(newColors[7]);
  rect(backHomeX, backHomeY, backHomeW, backHomeH);
  textSize(25);
  fill(#FFFFFF);
  text("Back", backHomeX+7, backHomeY+30);
  for (int i = 0; i<fav.length; i++) {
    if (fav[i].getFavorite()==true) {
      fill(#AC71E0);
      rect(100, favoriteY*70+50, 210, 50);
      fill(#FFFFFF);
      textSize(20);
      text(fav[i].getTitle(), 110, favoriteY*70+85);
      favoriteY++;
    }
  }
  favoriteY = 0;
  mouseOver(backHomeX, backHomeY, backHomeW, backHomeH, 7);
}

void drawScreen4() {
  print(firstTime1);
  for (int i = 0; i<animals.length; i++) {
    animals[i].display();
    animals[i].doLink();
    animals[i].doEmail();
    animals[i].doTwitter();
  }

  drawBackBrowse();
  mouseOver(backBrowseX, backBrowseY, backBrowseW, backBrowseH, 6);
  if (firstTime1 == true) {
    fill(#FFFFFF);
    stroke(#8194A2);
    rect(60, 80, 310, 300);
    textSize(15);
    fill(#8194A2);
    text("Drag the mouse to browse thorugh organizations,and to favorite a certain organization to see it later press the space bar.", 70, 100, 290, 290);
    fill(#FF0000);
    noStroke();
    ellipse(360, 80, 20, 20);
    if (mouseX>=320 && mouseX<=410) { 
      if (mouseY>=50 && mouseY<=130) {
        stroke(#930404);
        line(355, 75, 365, 85);
        line(365, 75, 355, 85);
      }
    }
  }
}
void drawScreen5() {
  for (int i = 0; i<feminism.length; i++) {
    feminism[i].display();
    feminism[i].doLink();
    feminism[i].doEmail();
    feminism[i].doTwitter();
  }

  drawBackBrowse();
  mouseOver(backBrowseX, backBrowseY, backBrowseW, backBrowseH, 6);
  if (firstTime2 == true) {
    fill(#FFFFFF);
    stroke(#8194A2);
    rect(60, 80, 310, 300);
    textSize(15);
    fill(#8194A2);
    text("Drag the mouse to browse thorugh organizations,and to favorite a certain organization to see it later press the space bar.", 70, 100, 290, 290);
    fill(#FF0000);
    noStroke();
    ellipse(360, 80, 20, 20);
    if (mouseX>=320 && mouseX<=410) { 
      if (mouseY>=50 && mouseY<=130) {
        stroke(#930404);
        line(355, 75, 365, 85);
        line(365, 75, 355, 85);
      }
    }
  }
}
void drawScreen6() {
  for (int i = 0; i<health.length; i++) {
    health[i].display();
    health[i].doLink();
    health[i].doEmail();
    health[i].doTwitter();
  }

  drawBackBrowse();
  mouseOver(backBrowseX, backBrowseY, backBrowseW, backBrowseH, 6);
  if (firstTime3 == true) {
    fill(#FFFFFF);
    stroke(#8194A2);
    rect(60, 80, 310, 300);
    textSize(15);
    fill(#8194A2);
    text("Drag the mouse to browse thorugh organizations,and to favorite a certain organization to see it later press the space bar.", 70, 100, 290, 290);
    fill(#FF0000);
    noStroke();
    ellipse(360, 80, 20, 20);
    if (mouseX>=320 && mouseX<=410) { 
      if (mouseY>=50 && mouseY<=130) {
        stroke(#930404);
        line(355, 75, 365, 85);
        line(365, 75, 355, 85);
      }
    }
  }
}

void drawScreen7() {
  background(#FFFFFF);
  fill(#9EA0E3);
  textSize(15);
  text("Type in the name of the organization you want to find.", 100, 100, 210, 200);
  rect(100, 200, 210, 100, 90, 90, 90, 90);
  fill(#FFFFFF);
  text(search, 120, 212, 180, 100);
}

void drawScreen8() {
  background(#FFFFFF);
  drawBackBrowse();
  search();
  fav[screen-8].displaySearch();
  mouseOver(backBrowseX, backBrowseY, backBrowseW, backBrowseH, 6);
  println(screen);
}
void drawScreen23() {
  background(#FFFFFF);
  drawBackBrowse();
  textSize(15);
  fill(#8F55F0);
  text("Sorry, your search does not match any documents.", 100, 100, 200, 200 );
  mouseOver(backBrowseX, backBrowseY, backBrowseW, backBrowseH, 6);
}

void mousePressed() {
  //exit button for instructions
  if (screen == 4) {
    if (mouseX>=350 && mouseX<=370) { 
      if (mouseY>=70 && mouseY<=90) {
        firstTime1 = false;
      }
    }
  }
  if (screen ==5) {
    if (mouseX>=350 && mouseX<=370) { 
      if (mouseY>=70 && mouseY<=90) {
        firstTime2 = false;
      }
    }
  }
  if (screen ==6) {
    if (mouseX>=350 && mouseX<=370) { 
      if (mouseY>=70 && mouseY<=90) {
        firstTime3 = false;
      }
    }
  }
  //links
  if (screen>=4) {
    dragging = true;
  }

  //back to home
  if (mouseX>=backHomeX && mouseX<=backHomeX+backHomeW) {
    if (mouseY>=backHomeY && mouseY<=backHomeY+backHomeH) {
      screen = 1;
    }
  }

  //back to browse
  if (mouseX>=backBrowseX && mouseX<=backBrowseX+backBrowseW) {
    if (mouseY>=backBrowseY && mouseY<=backBrowseY+backBrowseH) {
      screen = 2;
    }
  }


  //HOMETO SEARCH
  if (screen == 2) {
    if (mouseX>=searchX && mouseX<=searchX+searchW) {
      if (mouseY>=searchY && mouseY<=searchY+searchH) {
        screen = 7;
      }
    }
  }

  //browse-->health 
  if (screen == 2) {
    if (mouseX>=XPos6 && mouseX<=XPos6+width6) {
      if (mouseY>=YPos6 && mouseY<=YPos6+height6) {
        screen = 6;
      }
    }
  }
  //browse-->feminism
  if (screen == 2) {
    if (mouseX>=XPos5 && mouseX<=XPos5+width5) {
      if (mouseY>=YPos5 && mouseY<=YPos5+height5) {
        screen = 5;
      }
    }
  }
  //browse-->animals 
  if (screen == 2) {
    if (mouseX>=XPos4 && mouseX<=XPos4+width4) {
      if (mouseY>=YPos4 && mouseY<=YPos4+height4) {
        screen = 4;
      }
    }
  }

  //home-->favorite
  if (screen == 1) {
    if (mouseX>=XPos3 && mouseX<=XPos3+width3) {
      if (mouseY>=YPos3 && mouseY<=YPos3+height3) {
        screen = 3;
      }
    }
  }
  //home-->browse
  if (screen == 1) {
    if (mouseX>=XPos2 && mouseX<=XPos2+width2) {
      if (mouseY>=YPos2 && mouseY<=YPos2+height2) {
        screen = 2;
      }
    }
  }
  //start-->home
  if (screen==0) {
    if (mouseX>=XPos1 && mouseX<=XPos1+width1) {
      if (mouseY>=YPos1 && mouseY<=YPos1+height1) {
        screen = 1;
      }
    }
  }
}

void keyPressed() {
  checkFavorite();
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (screen-4>=fav.length) {
        screen=4;
      }
      screen++;
    }
    if (keyCode == LEFT) {
      screen--;
    }
  }

  //code for typing in email
  if (screen >= 4 && screen<7) {
    if (key == ENTER) {
      checkLink();
      emailDone = true;
    } else if (key == BACKSPACE) {
      if (email != "") {
        email = email.substring(0, email.length()-1);
      }
    } else if (Pattern.compile("[\\w\\.\\-@+]").matcher(String.valueOf(key)).matches()) {
      email+=key;
    }
  }

  //code for searchbar
  if (screen==7) {
    if (key == ENTER ) {
      searchDone = true;
      if (noMatch == false) {
        screen = 8;
      } else if(noMatch == true) {
        screen = 23;
      }
    } else if (key == BACKSPACE) {
      if (search != "") {
        search = search.substring(0, search.length()-1);
      }
    } else if (Pattern.compile("[\\w\\.\\-@+\\'\\ ]").matcher(String.valueOf(key)).matches()) {
      search+=key;
    }
  }
}


void drawBackBrowse() {
  noStroke();
  fill(newColors[6]);
  rect(backBrowseX, backBrowseY, backBrowseW, backBrowseH);
  textSize(25);
  fill(#FFFFFF);
  text("Back", backBrowseX+7, backBrowseY+30);
}

void mouseOver(int buttonX, int buttonY, int buttonW, int buttonH, int buttonColor) { 
  if (mouseX>=buttonX && mouseX<=buttonX+buttonW) { 
    if (mouseY>=buttonY && mouseY<=buttonY+buttonH) {
      newColors[buttonColor] = #9CFAEE;
    } else {
      newColors[buttonColor] = originalColors[buttonColor];
    }
  }
}


void checkFavorite() {
  if (screen == 4) {
    for (int i = 0; i<animals.length; i++) {
      if (mouseY>animals[i].getY()) {
        if (animals[i].getY() >= 0) {
          if (keyPressed) {
            if (key == ' ') {
              boolean tempFav = animals[i].getFavorite();
              animals[i].setFavorite(!tempFav);
              //println(animals[i].getFavorite());
            }
          }
        }
      }
    }
  }
  if (screen == 5) {
    for (int i = 0; i<feminism.length; i++) {
      if (mouseY>feminism[i].getY()) {
        if (feminism[i].getY() >= 0) {
          if (keyPressed) {
            if (key == ' ') {
              boolean tempFav = feminism[i].getFavorite();
              feminism[i].setFavorite(!tempFav);
              //println(feminism[i].getFavorite());
            }
          }
        }
      }
    }
  }
  if (screen == 6) {
    for (int i = 0; i<health.length; i++) {
      if (mouseY>health[i].getY()) {
        if (health[i].getY() >= 0) {
          if (keyPressed) {
            if (key == ' ') {
              boolean tempFav = health[i].getFavorite();
              health[i].setFavorite(!tempFav);
              //println(health[i].getFavorite());
            }
          }
        }
      }
    }
  }
}

void checkLink() {
  if (screen ==4) {
    for (int i = 0; i<animals.length; i++) {
      if (mouseY>animals[i].getY()) {
        if (animals[i].getY()>= 0) {
          runSendEmailChoreo(animals[i].getUrl());
        }
      }
    }
  } else if (screen ==5) {
    for (int i = 0; i<feminism.length; i++) {
      if (mouseY>feminism[i].getY()) {
        if (feminism[i].getY() >= 0) {
          runSendEmailChoreo(feminism[i].getUrl());
        }
      }
    }
  } else if (screen == 6) {
    for (int i = 0; i<health.length; i++) {
      if (mouseY>health[i].getY()) {
        if (health[i].getY() >= 0) {
          runSendEmailChoreo(health[i].getUrl());
        }
      }
    }
  }
}
void checkLinkTwitter() {
  if (screen ==4) {
    for (int i = 0; i<animals.length; i++) {
      if (mouseY>animals[i].getY()) {
        if (animals[i].getY()>= 0) {
          runStatusesUpdateChoreo(animals[i].getUrl());
        }
      }
    }
  } else if (screen ==5) {
    for (int i = 0; i<feminism.length; i++) {
      if (mouseY>feminism[i].getY()) {
        if (feminism[i].getY() >= 0) {
          runStatusesUpdateChoreo(feminism[i].getUrl());
        }
      }
    }
  } else if (screen == 6) {
    for (int i = 0; i<health.length; i++) {
      if (mouseY>health[i].getY()) {
        if (health[i].getY() >= 0) {
          runStatusesUpdateChoreo(health[i].getUrl());
        }
      }
    }
  }
}


void runSendEmailChoreo(String url) {
  // Create the Choreo object using your Temboo session
  SendEmail sendEmailChoreo = new SendEmail(session);

  // Set inputs
  sendEmailChoreo.setFromAddress("starrrrr59@gmail.com");
  sendEmailChoreo.setUsername("starrrrr59@gmail.com");
  sendEmailChoreo.setToAddress(email);
  sendEmailChoreo.setSubject("Hey, check out this organization");
  sendEmailChoreo.setMessageBody("Hey give back! Check out this organization and donate:"+ url);
  sendEmailChoreo.setPassword("qntublimzpbgzapp");

  // Run the Choreo and store the results
  SendEmailResultSet sendEmailResults = sendEmailChoreo.run();
  
  // Print results
  println(sendEmailResults.getSuccess());

}

void runStatusesUpdateChoreo(String url) {
  // Create the Choreo object using your Temboo session
  StatusesUpdate statusesUpdateChoreo = new StatusesUpdate(session);

  // Set inputs
  statusesUpdateChoreo.setStatusUpdate("Hey give back! Check out this organization and donate:" + url);
  statusesUpdateChoreo.setAccessToken("866013411724996608-aWKzSPO5VziKc35VPnyqKW7ae4Hxtl0");
  statusesUpdateChoreo.setConsumerKey("iamoGgvl0XJqT585HfKF9s3Y9");
  statusesUpdateChoreo.setConsumerSecret("C4a6AqmrNr87h3QKvpnDyI09gi3XAV6HlT3R80ZdlCit9vh4Xw");
  statusesUpdateChoreo.setAccessTokenSecret("e9oyHU4Gym67EldOikuCv3r1ajCptycmGL1TGvyZtqAFe");

  // Run the Choreo and store the results
  StatusesUpdateResultSet statusesUpdateResults = statusesUpdateChoreo.run();

  // Print results
  println(statusesUpdateResults.getResponse());
}

void search() {
  for (int i = 0; i<animals.length; i++) {
    if (search.equals(animals[i].getTitle())) {
      screen = animals[i].getScreen();
      noMatch = false;
    } 
  }
  for (int i = 0; i<animals.length; i++) {
    if (search.equals(feminism[i].getTitle())) {
      screen = feminism[i].getScreen();
      noMatch = false;
    } 
  }
  for (int i = 0; i<animals.length; i++) {
    if (search.equals(health[i].getTitle())) {
      screen = health[i].getScreen();
      noMatch = false;
    }
  }
}