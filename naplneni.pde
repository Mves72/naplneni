int prumer = 30;
int prumermin = 20;
int prumermax = 50;
Table tabulka;
void setup() {
  size(400, 300);
  tabulka = new Table();
  
  tabulka.addColumn("id", Table.INT);
  tabulka.addColumn("kod", Table.INT);
  tabulka.addColumn("x", Table.INT);
  tabulka.addColumn("y", Table.INT);
  tabulka.addColumn("r", Table.INT);
  
}
void draw() {
background(0);
for (int i=0; i<tabulka.getRowCount(); i = i+1){
TableRow aktivni = tabulka.findRow(str(i), "id");
  ellipse(aktivni.getInt("x"), aktivni.getInt("y"),aktivni.getInt("r"),aktivni.getInt("r"));
}
ellipse(mouseX, mouseY,prumer,prumer); 
} 

void mouseWheel(MouseEvent event) {
  int e = event.getCount();
  prumer = prumer + e;
  if (prumer>prumermax){prumer = prumer -1;}
  if (prumer<prumermin){prumer = prumer +1;}

}

void mouseClicked() {
  if (mouseButton==RIGHT){konec();}
 else{
   if (mouseButton==LEFT){
 TableRow zaznam = tabulka.addRow();
  zaznam.setInt("id", tabulka.lastRowIndex());
  zaznam.setInt("x", mouseX);
  zaznam.setInt("y", mouseY);
  zaznam.setInt("r", prumer);}
 }

}

void konec(){
  saveTable(tabulka, "new.csv");
  exit();
}
