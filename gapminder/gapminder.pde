void setup() {
  background(255);
  size(500, 500);
  strokeWeight(5);
  
  Table data = loadTable("total_fertility_since_birth.csv", "header");
  for (TableRow row : data.rows()) {
    float x = map(row.getFloat("longitude"), -180, 180, 0, width);
    float y = map(row.getFloat("latitude"), 0, 90, 0, height);
    point(x, y);
  }

}

void draw() {
  
}
