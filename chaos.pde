import java.lang.Math;

class Point{
    
    public float x;
    public float y;
    public float z;
    float dt = 0.01;
    
    
    public Point(float x, float y, float z){
        this.x = x;
        this.y = y;
        this.z = z;
    }
    
    float getX(){
        return this.x;
    }
    float getY(){
        return this.y;
    }
    float getZ(){
        return this.z;
    }
    
    void setX(float newValueX){
        this.x = newValueX;
    }
    void setY(float newValueY){
        this.y = newValueY;
    }
    void setZ(float newValueZ){
        this.z = newValueZ;
    }
    
    void drawPoint(){
        fill(163, 240, 246);
        circle(this.getX(), this.getY(), (this.getZ()/2 + 2)/ 10);
    }
    
    
    
}





class Halvorsen extends Point{
    
    float a = 1.89;
    float dt = 0.01;
    
    public Halvorsen(float x, float y, float z){
        super(x, y, z);
    }
    
    void drawPoint(){
        fill(163, 240, 246);
        circle(this.getX(), this.getY(), 1);
    }
    
    
    void updateX(){
        float dx = (  (-a*this.getX()) - (4*this.getY()) - (4*this.getZ()) - (this.getY() * this.getY()) ) * this.dt;
        this.setX(this.getX() + dx);
    }
    void updateY(){
        float dy = (  (-a*this.getY()) - (4*this.getZ()) - (4*this.getX()) - (this.getZ() * this.getZ()) ) * this.dt;
        this.setY(this.getY() + dy);
    }
    void updateZ(){
        float dz = (  (-a*this.getZ()) - (4*this.getX()) - (4*this.getY()) - (this.getX() * this.getX()) ) * this.dt;
        this.setZ(this.getZ() + dz);
    }
    
    void updateAll(){
        this.updateX();
        this.updateY();
        this.updateZ();
    }
    
    
    
}



class Lorenz extends Point{
    
    int sigma = 10;
    int roh =  28;
    float beta = 2.66666666666666;
    
    public Lorenz(float x, float y, float z){
        super(x, y, z);
    }
    
    
    void updateX(){
        float dx = (this.sigma*(this.getY() - this.getX())) * this.dt;
        this.setX(this.getX() + dx);
    }
    void updateY(){
        float dy = ((this.getX()*-1 * this.getZ()) + (this.roh * this.getX()) - (this.getY())) * this.dt;
        this.setY(this.getY() + dy);
    }
    void updateZ(){
        float dz = ((this.getX() * this.getY()) - (this.beta * this.getZ())) * dt;
        this.setZ(this.getZ() + dz);
    }
    
    void updateAll(){
        this.updateX();
        this.updateY();
        this.updateZ();
    }
    
    
    
}



class Aizawa extends Point{
    
    float a = 0.95;
    float b = 0.7;
    float c = 0.6;
    float d = 3.5;
    float e = 0.25;
    float f = 0.1;
    float dt = 0.05;
    
    
    public Aizawa(float x, float y, float z){
        super(x, y, z);
    }
    
    void drawPoint(){
        fill(163, 240, 246);
        circle(this.getZ(), this.getX(), 0.1);
    }
    
    
    void updateX(){
        float dx = ((this.getZ() - b) * this.getX() - (this.getY() * d)) * this.dt;
        this.setX(this.getX() + dx);
    }
    void updateY(){
        float dy = ((this.getX() * d) + (this.getZ() - b) * this.getY()) * this.dt;
        this.setY(this.getY() + dy);
    }
    void updateZ(){
        float dz = (c + a*this.getZ() -  ((this.getZ() * this.getZ() * this.getZ()) / 3) - ((this.getX() * this.getX()) + (this.getY() * this.getY())) * (1 + e*this.getZ()) + f*this.getZ() * this.getX() * this.getX() * this.getX()) * this.dt;
        this.setZ(this.getZ() + dz);
    }
    
    void updateAll(){
        this.updateX();
        this.updateY();
        this.updateZ();
    }
    
    
    
}



int pointsNum = 10000;



Aizawa[] points = new Aizawa[pointsNum];

void setup(){
    size(displayWidth, displayHeight, P2D);
    background(0);
    
    
    
    for(int i = 0; i < pointsNum; i++){
        
        points[i] = new Aizawa(random(10), random(10), random(10));
  
    }
    
    
}

void draw(){
    background(0);
    translate(displayWidth / 2, displayHeight / 2);
    scale(100);
    noStroke();
    for(int i = 0; i < pointsNum; i++){
        points[i].drawPoint();
        points[i].updateAll();
    }
}
