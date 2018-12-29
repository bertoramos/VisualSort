
float[] v;
int max_value;

int i = 1;
int j;
float clave;

void setup() {
  size(500, 500);

  max_value = height;
  v = new float[max_value];
  
  // Fill
  for (int n = 0; n < v.length; n++) {
    v[n] = random(0, v.length);
  }
}

void paint_array(float[] vector) {
  translate(0, vector.length);
  background(0,204,255);
  for (int i = 0; i < vector.length; i++) {
    stroke(0,255,204);
    line(i, v.length, i, -vector[i]);
  }
}

void step_sort() {
  clave = v[i];
  j = i - 1;
  
  while( j >= 0 && v[j] > clave) {
    v[j+1] = v[j];
    j--;
  }
  v[j+1] = clave;
  
  i++;
}

void draw() {
  if (i >= v.length) {
    print("END!");
    
    paint_array(v);
    
    noLoop();
    return; // noLoop not ends current loop
  }
  step_sort();
  paint_array(v);
}
