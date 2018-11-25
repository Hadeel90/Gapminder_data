// init vars
PShape map;

void setup() {
  // canvas setup
  background(255);
  size(640, 325);
  
  // load map
  map = loadShape("world_map4.svg");
  map.disableStyle();
  strokeWeight(0.25);
  shape(map, 0, 0);
  
  // load data file
  Table data = loadTable("total_fertility_since_birth.csv", "header");  

  // find min & max number in 1990 & 2018 columns
  float[] birthYear = data.getFloatColumn("X1990");
  float minVal90 = min(birthYear);
  float maxVal90 = max(birthYear);
  
  float[] currentYear = data.getFloatColumn("X2018");
  float minVal18 = min(currentYear);
  float maxVal18 = max(currentYear);
  
  // 1990 data points
  stroke(0x904370ff);
  for (TableRow row : data.rows()) {
    // map country positions to canvas
    float x = map(row.getFloat("longitude"), -180, 180, -10, width-20);
    float y = map(row.getFloat("latitude"), 90, -90, -10, height);
    
    // vary size based on year values
    float size = map(row.getFloat("X1990"), minVal90, maxVal90, 3, 20);
    strokeWeight(size);
    point(x, y);
    
    // check country names in right position
    //pushStyle();
    //fill(0);
    ////text(row.getString("country"), x, y);
    //popStyle();
  }
  
  // 2018 data points
  stroke(255, 23, 0, 100);
  for (TableRow row : data.rows()) {
    // map country positions to canvas
    float x = map(row.getFloat("longitude"), -180, 180, -10, width-20);
    float y = map(row.getFloat("latitude"), 90, -90, -10, height);
    
    // vary size based on year values
    float size = map(row.getFloat("X2018"), minVal18, maxVal18, 3, 20);
    strokeWeight(size);
    point(x, y);
  }

}

void draw() {
  
}
