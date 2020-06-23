

class Edge{
  
   Point p0,p1;
      
   Edge(Point _p0, Point _p1 ){
     p0 = _p0; p1 = _p1;
   }
   
   void draw(){
     line( p0.p.x, p0.p.y, 
           p1.p.x, p1.p.y );
   }
   
   
   boolean onLineSegment (Point p0, Point p1, Point p2) 
   { 
    if (p1.p.x <= max(p0.p.x, p2.p.x) && p1.p.x >= min(p0.p.x, p2.p.x) && 
          p1.p.y <= max(p0.p.y, p2.p.y) && p1.p.y >= min(p0.p.y, p2.p.y)) 
       return true; 
    else return false; 
   } 
   
   int crossProduct(Point p0, Point p1, Point p3){
     
     
     float result = (p1.p.y - p0.p.y) * (p3.p.x - p1.p.x) - 
              (p1.p.x - p0.p.x) * (p3.p.y - p1.p.y); 
  
    if (result == 0) 
        return 0;   
  
    return (result > 0) ? 1: 2;
     
   }
   
   boolean intersectionTest( Edge other ){
     
     
     
     int orientationP1 = crossProduct(p0, p1,other.p0);
     int orientationP2 = crossProduct(p0, p1,other.p1);
     int orientationP3 = crossProduct(other.p0, other.p1,p0);
     int orientationP4 = crossProduct(other.p0, other.p1,p1);
     
     if(orientationP1 != orientationP2 && orientationP3 != orientationP4)
           return true;
           
           
     if (orientationP1 == 0 && onLineSegment(p0, p1, other.p0) ||
         orientationP2 == 0 && onLineSegment(p0,other.p1,other.p0 ) ||
         orientationP3 == 0 && onLineSegment(p1,p0,other.p0) ||
         orientationP4 == 0 && onLineSegment(p1,other.p0,other.p1))
               return true;
               
     return false;
     
     
     
     
     
   }
   
  
   
   boolean isParallel(Edge other){
     
     float slope1, slope2;
     
     slope1 = (p0.p.y - p1.p.y ) / (p0.p.x - p1.p.y);
     slope2 = (other.p0.p.y - other.p1.p.y ) / (other.p0.p.x - other.p1.p.y);
     
     if (slope1 == slope2)
       return true;
       
     return false;
     
   }
   
   
   
   Point intersectionPoint( Edge other ){
     
     
     // TODO: Implement A Method To Find The Edge Intersection Point
     // Care should be taken to make the implementation CORRECT. Speed doesn't matter.
        
     
     
     
     
     //starting point 1
     float p0x = p0.p.x;
     float p0y = p0.p.y;
     
     //ending point 1
     float p1x = p1.p.x - p0.p.x;
     float p1y = p1.p.y - p0.p.y;
     
     //starting point 2
     float otherp0x = other.p0.p.x;
     float otherp0y = other.p0.p.y;
     
     //ending point 2
     float otherp1x = other.p1.p.x - other.p0.p.x;
     float otherp1y = other.p1.p.y - other.p0.p.y;
     
     
     //solving for t
     
     float t = (otherp1x * (p0y-otherp0y) + otherp1y * (otherp0x-p0x)) / (p1x * otherp1y - p1y*otherp1x);
     //getting intersection point
     
     float x = p0.p.x + t * (p1.p.x - p0.p.x);
     float y = p0.p.y + t * (p1.p.y - p0.p.y);
     
     
     Point answer = new Point(x,y);
     
     if(t>=0 && t<=1)
       return answer;
     
     return null;
     
     
}
   
   Point optimizedIntersectionPoint( Edge other ){
   
   /*
     
   float slope1 = (p0.p.y - p1.p.y ) / (p0.p.x - p1.p.y);
   float slope2 = (other.p0.p.y - other.p1.p.y ) / (other.p0.p.x - other.p1.p.y);
    
   
   
   float midpointX1 = (p0.p.x+p1.p.x) / 2;
   float midpointY1 = (p0.p.y+p1.p.y) / 2;
   
   float midpointX2 = (other.p0.p.x+other.p1.p.x) / 2;
   float midpointY2 = (other.p0.p.y+other.p1.p.y) / 2;
   
   float yIntercept1 = midpointY1/(slope1*midpointX1);
   float yIntercept2 = midpointY2/(slope2*midpointX2);
   
   float x = (yIntercept2 - yIntercept1) / (slope1 - slope2);
   
   float y = (slope1*x) + yIntercept1;
   
   
  Point answer = new Point(x,y);
  return answer;
    
  

 */
   // TODO: Implement A Method To Find The Edge Intersection Point
     // Care should be taken to make the implementation CORRECT. Speed doesn't matter.
        
     
     
     
     
     //starting point 1
     float p0x = p0.p.x;
     float p0y = p0.p.y;
     
     //ending point 1
     float p1x = p1.p.x - p0.p.x;
     float p1y = p1.p.y - p0.p.y;
     
     //starting point 2
     float otherp0x = other.p0.p.x;
     float otherp0y = other.p0.p.y;
     
     //ending point 2
     float otherp1x = other.p1.p.x - other.p0.p.x;
     float otherp1y = other.p1.p.y - other.p0.p.y;
     
     
     //solving for t
     
     float t = (otherp1x * (p0y-otherp0y) + otherp1y * (otherp0x-p0x)) / (p1x * otherp1y - p1y*otherp1x);
     //getting intersection point
     
     float x = p0.p.x + t * (p1.p.x - p0.p.x);
     float y = p0.p.y + t * (p1.p.y - p0.p.y);
     
     
     Point answer = new Point(x,y);
     
     if(t>=0 && t<=1)
       return answer;
     
     return null;
 
  }

}
