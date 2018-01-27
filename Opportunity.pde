class Opportunity {
  private String title;
  private int OX;
  private int OY;
  private int OW;
  private int OH;
  private String description;
  private boolean favorite;
  private PImage photo;
  private int space;
  private String url;
  private int emailX;
  private int emailY;
  private int emailW;
  private int emailH;
  private int twitterX;
  private int twitterY;
  private int twitterW;
  private int twitterH;
  private int postX = OX+170;
  private int postY = OY+205;
  private int postW = 200;
  private int postH = 70;
  private boolean emailBoolean;
  private boolean twitterBoolean;
  private int emailOpacity = 255;
  private int twitterOpacity = 255;
  private boolean emailQuit = false;
  private boolean twitterQuit = false;
  private boolean twitterDone = false;
  private int screen;

  Opportunity(int scr, boolean twitter, boolean e, String u, PImage p, boolean f, String t, int x, int y, int s, String d) {
    //initialize object
    title = t;
    OX = x;
    OY = y;
    description = d;
    favorite = f;
    photo = p;
    space = s;
    url = u;
    OW = 400;
    OH = 700;
    emailBoolean = e;
    twitterBoolean = twitter;
    screen = scr;
  }  

  public void shortDisplay() {
    fill(#000000);
    strokeWeight(10);
    textSize(15);
    text(title, OX, OY, 200, 200) ;
  }
  public String getUrl() {
    return url;
  }
  public boolean getFavorite() {
    return favorite;
  }
  public int getScreen() {
    return screen;
  }
  public boolean getEmailBoolean() {
    return emailBoolean;
  }
  public boolean getTwitterBoolean() {
    return twitterBoolean;
  }
  public String getTitle() {
    return title;
  }

  public void setFavorite(boolean f) {
    favorite = f;
  }
  public void setX(int x) {
    OX = x;
  }
  public void setY(int y) {
    OY += y;
  }
  public int getY() {
    return OY;
  }


  public void drawTwitter() {
    if (mouseX>=twitterX && mouseX<=twitterX+twitterW) { 
      if (mouseY>=twitterY && mouseY<=twitterY+twitterH) {

        twitterX = OX+250;
        twitterY = OY+160;
        twitterW = 90;
        twitterH = 90;

        fill(#FFFFFF);
        stroke(#66A5F0);
        rect(OX+270, OY+250, 100, 50);
        fill(#217DEA);
        textSize(14);
        text("Click to share", OX+273, OY+273);
      }
    } else {
      twitterX = OX+260;
      twitterY = OY+170;
      twitterW = 70;
      twitterH = 70;
    }
    PImage img;
    img = loadImage("twitter-icon-circle-blue-logo-preview.png");
    image(img, twitterX, twitterY, twitterW, twitterH);
  }
  public void drawLinkButton() {
    noStroke();
    mouseOver(OX+270, OY+100, 100, 50, 8);
    fill(newColors[8]);
    rect(OX+270, OY+100, 100, 50);
    textSize(25);
    fill(#FFFFFF);
    text("Link", OX+277, OY+130);
    if (mouseX>=OX+270 && mouseX<=OX+270+100) { 
      if (mouseY>=OY+100 && mouseY<=OY+100+50) {
        fill(#FFFFFF);
        stroke(#85DFE3);
        rect(OX+270, OY+200, 100, 50);
        fill(#0AF2FC);
        textSize(10);
        text("Click for a link to the organization's website", OX+275, OY+204, 100, 50);
      }
    }
  }
  public void drawHeart(boolean h) {
    if (h == true) {

      noStroke();
      fill(#FF0000);
      triangle(OX+320, OY+320, OX+300, OY+300, OX+340, OY+300 );
      ellipse(OX+310, OY+288, 30, 30);
      ellipse(OX+330, OY+288, 30, 30);
    }
  }
  public void drawEmail() {

    if (mouseX>=emailX && mouseX<=emailX+emailW) { 
      if (mouseY>=emailY && mouseY<=emailY+emailH) {

        emailX = OX+320;
        emailY = OY+170;
        emailW = 70;
        emailH = 70;


        fill(#FFFFFF);
        stroke(#ED8B8B);
        rect(OX+270, OY+250, 100, 50);
        fill(#FF0303);
        textSize(14);
        text("Click to share", OX+273, OY+273);
      }
    } else {
      emailX = OX+330;
      emailY = OY+180;
      emailW = 50;
      emailH = 50;
    }
    PImage img;
    img = loadImage("New_Logo_Gmail.svg.png");
    image(img, emailX, emailY, emailW, emailH);
  }

  public void doLink() {
    if (mousePressed) {
      if (mouseX>=OX+270 && mouseX<=OX+270+100) {
        if (mouseY>=OY+100 && mouseY<=OY+150l) {
          link(url);
        }
      }
    }
  }

  public void doEmail() {
    if (mousePressed) {
      if (mouseX>=emailX && mouseX<=emailX+emailW) { 
        if (mouseY>=emailY && mouseY<=emailY+emailH) {
          emailBoolean = true;
          emailDone = false;
          //println(emailBoolean);
        }
      }
      if (mouseX>=OX+350 && mouseX<=OX+370) { 
        if (mouseY>=OX+70 && mouseY<=OX+90) {
          emailQuit = true;
        }
      }
    }

    if (emailBoolean == true) {
      if (emailQuit == false) {
        if (emailDone == false) {
          fill(#FFFFFF);
          stroke(#C95F59);
          rect(OX+60, OY+80, 310, 300);
          textSize(15);
          fill(#C95F59);
          text("enter the email you want to share the organization with", OX+70, OY+100, 290, 290);
          noStroke();
          fill(#C95F59);
          rect(OX+105, OY+170, 200, 90);
          fill(#FFFFFF);
          text(email, OX+110, OY+175, 200, 940);
          fill(#FF0000);
          ellipse(OX+360, OY+80, 20, 20);
          if (mouseX>=OX+350 && mouseX<=OX+370) { 
            if (mouseY>=OX+70 && mouseY<=OX+90) {
              stroke(#930404);
              line(OX+355, OY+75, OX+365, OY+85);
              line(OX+365, OY+75, OX+355, OY+85);
            }
          }
        }
      }
      if (emailDone == true) {
        emailOpacity -=20;
        fill(#FF087B, emailOpacity);
        textSize(25);
        strokeWeight(10);
        text("email has been sent", OX+70, OY+200, 290, 290);
      }
    }
  }
  public void doTwitter() {
    if (mousePressed) {
      if (mouseX>=twitterX && mouseX<=twitterX+twitterW) { 
        if (mouseY>=twitterY && mouseY<=twitterY+twitterH) {
          twitterBoolean = true;
          println(twitterBoolean);
          twitterDone = false;
        }
      }
      if (mouseX>=OX+350 && mouseX<=OX+370) { 
        if (mouseY>=OX+70 && mouseY<=OX+90) {
          twitterQuit = true;
        }
      }
    }

    if (twitterBoolean == true) {
      if (twitterQuit == false) {
        if (twitterDone == false) {
          fill(#FFFFFF);
          stroke(#289AF5);
          rect(OX+60, OY+80, 300, 300);
          textSize(15);
          fill(#289AF5);
          text("Click the post button to post a tweet encouraging people to donate to a certain organization", OX+70, OY+100, 290, 290);
          noStroke();
          fill(#289AF5);
          rect(OX+105, OY+200, 200, 70);
          fill(#FFFFFF);
          textSize(30);
          text("post", OX+170, OY+205, 200, 940);
          fill(#FF0000);
          ellipse(OX+360, OY+80, 20, 20);
          println(twitterDone);
          if (mouseX>=postX && mouseX<=postX+postW) { 
            if (mouseY>=postY && mouseY<=postY+postH) {
              twitterDone = true;
              checkLinkTwitter();
            }
          }
        }
        if (twitterDone == true) {
          twitterOpacity -=20;
          fill(#FF087B, twitterOpacity);
          textSize(25);
          strokeWeight(10);
          text("tweet has been posted", OX+70, OY+200, 290, 290);
        }
      }
    }
  }


  public void display() {
    drawHeart(favorite);
    drawEmail();
    drawTwitter();
    drawLinkButton();
    image(photo, OX, OY+350, width, 350);
    fill(#2E1A5F);
    strokeWeight(10);
    textSize(30);
    text(title, OX+30, OY, 200, 200) ;
    strokeWeight(5);
    textSize(10);
    text(description, OX+30, OY+space, 200, 500) ;
  }
  public void displaySearch() {
    int holder = OY;
    OY=0;
    drawHeart(favorite);
    drawEmail();
    drawTwitter();
    drawLinkButton();
    image(photo, OX, OY+350, width, 350);
    fill(#2E1A5F);
    strokeWeight(10);
    textSize(30);
    text(title, OX+30, OY, 200, 200) ;
    strokeWeight(5);
    textSize(10);
    text(description, OX+30, OY+space, 200, 500) ;
    OY= holder;
  }
}