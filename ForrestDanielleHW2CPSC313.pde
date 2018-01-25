/*
Author: Danielle Forrest
CPSC 313 HW 2
This program loads in weather information from a csv file and 
displays it graphically.
1/25/2018
*/
Table table;
String header;
int barHeight;
int barWidth;

//loads the graph information from the csv file
//and assigns values to global variables
void setup() {
  table = loadTable("table.csv", "header");
  size(500, 500);
  background(0);
  barHeight = height/findLargNum() ; 
  print(barHeight);
  barWidth = width/table.getRowCount();
}

//draws the graph to the sketch window
void draw() {
  int x = 0;
  for (TableRow row : table.rows()) {
    int id = row.getInt("Mean TemperatureF");    
    stroke(255, 0, 0);
    rect(x, (height - (id * barHeight)), barWidth, (id * barHeight));
    x+=(barWidth);
  }
  stroke(0, 0, 255);
  line(0, (height - (barHeight * 32)), width, (height - (barHeight * 32)));
}

//finds the largest number in the table and returns it
int findLargNum() {
  int largNum = 0;
  for (TableRow row : table.rows()) {
    int id = row.getInt("Mean TemperatureF");
    if (id > largNum) {
      largNum = id;
    }
  }
  return largNum;
}