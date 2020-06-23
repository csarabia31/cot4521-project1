

public static void NaiveLineSegmentSetIntersection( ArrayList<Edge> input_edges, ArrayList<Point> output_intersections ){
  // TODO: Implement the naive O(n^2) method for calucating the intersections of a set of line segments.  
  // Take care that the output is CORRECT. Speed doesn't matter. 
  
  
  for(int i = 0; i<input_edges.size(); i++)
  {
     for(int j=0;j<input_edges.size();j++)
     {
        if(i==j)
          continue;
        
        Point p;
        p=input_edges.get(i).intersectionPoint(input_edges.get(j));
        
        
        if(input_edges.get(i).intersectionTest(input_edges.get(j))==true)  
          output_intersections.add(p);
     }
  }
  
  
  
  
  
  
}


public static void OptimizedLineSegmentSetIntersection( ArrayList<Edge> input_edges, ArrayList<Point> output_intersections ){
  // TODO: Implement an optimized method for calucating the intersections of a set of line segments.  
  
  // The output should be correct, but SPEED MATTERS. 
  
  
  
  for(int i = 0; i<input_edges.size(); i++)
  {
     for(int j=0;j<input_edges.size();j++)
     {
        if(i==j)
          continue;
        
        if(input_edges.get(i).isParallel(input_edges.get(j))==true)
           continue;
        else if(input_edges.get(i).intersectionTest(input_edges.get(j))==true)
        
        {
          Point p;
          p=input_edges.get(i).optimizedIntersectionPoint(input_edges.get(j));
          output_intersections.add(p);
          
        }
        
        
        
     }
  }
  
  
  
}
