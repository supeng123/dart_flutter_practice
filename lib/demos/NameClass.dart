main(List<String> args) {
  Pug p = new Pug.small('Duffy');
  print(p.name);
  print(p.age);
  print(Dog.newBorn());
  
}
 
class Dog {
  String name;
  int age;
 
  Dog(this.name, this.age);
 
  Dog.newBorn() {
    name = 'Doggy';
    print(age);
    age = 0;
    print(this.age);
  }
}
 
class Pug extends Dog {
  Pug(String name, int age): super(name, age);
 
  Pug.small(String name): this(name, 1);
 
  Pug.large(String name): this(name, 3);
}