
float[] v;
int max_value;

int i = 0;

void setup() {
  size(500, 500);

  max_value = height;
  v = new float[max_value];
  
  // Fill
  for (int n = 0; n < v.length; n++) {
    v[n] = random(0, v.length);
  }
}

void swap(float[] vector, int i, int j) {
  float temp = vector[i];
  vector[i] = vector[j];
  vector[j] = temp;
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
  int j_min = i;
  for (int j = i + 1; j < v.length; j++) { // Find min
    if (v[j] < v[j_min]) {
      j_min = j;
    }
  }
  swap(v, i, j_min);
  i++;
}

void draw() {
  if (i >= v.length - 1) {
    print("END!");
    
    paint_array(v);
    
    noLoop();
    return; // noLoop not ends current loop
  }
  step_sort();
  paint_array(v);
}
