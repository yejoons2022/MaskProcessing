char val;

void setup() {
  Serial.begin(9600);
  pinMode(8, OUTPUT);
}

void loop() {
  if(Serial.available())
  {
    val=Serial.read();

    if(val == 'a')
    {
      digitalWrite(8, LOW);
    }
    if(val == 'b')
    {
      digitalWrite(8, HIGH);
    }
  }
}
