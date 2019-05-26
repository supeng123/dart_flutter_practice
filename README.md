
Dart 类型声明和推断

函数和变量的类型都要申明在名称之前

    void main(){}
    var bbb = 'this is the variable'
    var ccc = 17
    int myNumber = 7
    String str = 'nobody cares'
    List listone = new List<String>(['zhangsan','lisi'])

final和const的区别

    final PI=3.143445
    const ppp =111
    final a = new DataTime.now()
    const a != new DataTime.now()//会报错

不同类型数据的其他定义方式

    bool flag = true;
    double fff = 23.555 //double 类型可以赋值成整形
    
    字符换行
    string str2 = ''' 
    one line
    two line
    
    three line
    '''

类型判断写法

    var str2 = 'wangwu'
    if (str2 is String) print("str2 is a String type and value is $str2")
    else if (str2 is Int) print("str2 is a Int type")
    elese if (str2 is double) print("str2 is a double type")
    else if (str2.isEmpty) print("str2 is empty")
    else if (str2 == null) print("str2 is null")
    else if (str2.isNaN) print("str2 is NaN")

??的用法

    var b = 12；
    b?? = 20 //这表示如果变量b如果是空，那么就价格b赋值成20

三元运算

    bool flag= true
    String charOne = flag ? 'I am true' : 'I am false'

字符和数字相互转化

    toString将int和double类型转换成字符类型
    var num2 = 12 
    var words = num2.toString()
    
    int.parse() or double.parse()将字符串数字变成对应的类型
    int.parse(words)

赋值运算中如果++ -- 写在前面，先运算再赋值，如果写在后面是先赋值后运算

    var a=10
    var b = a++ //a=11, b=10
    
    var a=10
    var b = ++a //a=11 b=11

continue略过当前循环条件，继续执行，break是跳出当前循环，返回上一层的循环

    for (var i =0; i< 5; i++) {
     	print ('outside:'+ i)
     	for (var j=0; j < 5; j++){
     		if (j ==2 ) break;
    		print('inside:'+ j)
     	}
     }



dart list 操作

list 声明

    var listone = new List<String>();
    List listone = ['sugang']

list 属性

    properties
    listone.isEmpty
    listone.isNotEmpty
    listone.reversed.toList()

list 方法

    methods
    listone.add('supeng')
    listone.addAll(['suyan','sujian'])
    listone.indexOf('suyan') //return -1 when parameter can not be found
    listone.remove('sujian')
    listone.removeAt(index)
    
    listone.fillRange(1, 2, 'sssss') //like splice in Javascript
    listone.insert(1, 'abc')
    listone.insertAll(1, ['ccc', 'ddd'])
    
    String result = listone.join(',')
    List listTwo = result.split(',')

set 用法

    Set s = new Set()
    s.add('apple')

list 其他操作方法

    for (var item in listone) {
      print(item)
    }
    
    listone.forEach((value) {
      print("$value")
    })
    
    listone.map((value){
      return value*2
    })
    
    listone.where((value){
      return value > 5;
    }) //return a list
    
    list.any(func)
    list.every(func)
    和javascript相同

Dart Map操作

    var p = new Map()
    p['name'] = 'su'
    p["age"] = 123
    
    properties
    p.keys
    p.values
    p.isEmpty
    p.isNotEmpty
    p.keys.toList()
    
    methods
    p.addAll({
      "work": ["one", "two"],
      "job": "nothing"
    })
    p.remove("job")
    p.containsValue("nothing")

Dart 函数

函数定义

    void printInfo(){
      print('personalized method')
    }
    int getNum() {
      var myNum = 123;
      return myNum;
    }
    
    List getList() {
      return new List(['s','u'])
    }
    
    String printUserInfo(String username, int age){
      return "username:$username---age:$age"
    }

函数可选参数

    //optional parameters, use parenthesis in the last position
    String printUserInfo(String username, int age, [String school, int salary]){
      return "school:$school---salary:$salary"
    }

函数默认参数

    //default paramters salary
    String printUserInfo(String username, int age, [int salary = 2000, String school]){
      return "school:$school---salary:$salary"
    }

函数命名参数

    //defined name parameters
    String printUserInfo(String username, {int salary = 2000, String school}){
      return "school:$school---salary:$salary"
    }
    print(printUserInfo('supeng'，school:'WUHAN'))

函数调用函数

    //use callback in function
    void fun1(callback, String name) {
      callback(name)
    }

arrow 只能用于一行

    //arrow function only be allowed use in one line
    var newList = listone.map((value) => value>2 ? value*2 : value)

匿名函数写法

    //anonymous function
    var printName=(int a){
      print(a +2)
    }
    printName(12)

自调用函数和尾部调用

    //self invoked funciton
    ((num){
      print("this is $num")
    })(12)
    
    //iterator funciton
    int fn(n){
      sum *= n;
      if (n==1){
        return;
      }
      fn(n-1);
    }

函数闭包

    //closure
    closureFunciton(){
      var a = 123;
      return(){
        a++;
        print(a)
      }
    }
    
    var closureInstance = closureFunciton();
    closureInstance();
    closureInstance();
    closureInstance();

Dart 类

constructor函数调用

    class Person{
      String name;
      int age;
      Person(String name, int age) {
      	this.name = name;
      	this.age = age;
        print('this is the constructor, invoking it automatically when it is initialized')
      }
      
      //alternative
       Person(this.name, this.age)
       
      void getInfo() {
        print("${this.name}---${this.age}")
      }
      void setInfo(int age) {
        this.age = age
      }
     }

初始化默认参数

    class Person{
      String name;
      int age;
      Person():name='suuuu',age=13{}
    }

用_表示私有属性和方法，只能在文件是独立时生效

    class Person{
      String name;
      int age;
      Person(this.name, this.age)；
      //define private property and method
      String _info='Nokia'
      
      String _getCompany() {
        return this._info;
      }

setter和getter

    class Person{
      String name;
      int age;
      Person(this.name, this.age)；
      
      //define get/set property and can be invoked like p.getCompany without parenthesis
      get getCompany {
        return this._getCompany()
      }
      //eg p.setCompany='Google'
      set setCompany(String company){
        this._info = company
      }

命名方法

    //defined name contructor function
      Person.now(String name, int age) {
      	this.name = "$name --- ";
      	this.name = "$age --- ";
        print('this function can be inovke like this way:new Person.now('supeng', 12)')
      }
      
      new Person.now('supeng', 12)

静态属性和方法

    class Person{
      String name;
      int age;
      Person(this.name, this.age)；
      //define static property and method, Person.school,Person.getSchool
      static String school = "jianglin"
      
      static getSchool(){
        //get get the non static property
        print(this.age)//will get an error
        //can get the static property and method
        print(school)
      }
      
      void getSchool(){
        //get the static peroperty
        print("this is the static property $school")
        //get the property of instance
        print("this is the ${this.age} of instance")
      }
    }

调用..和？用法

    //how to use .. to continously invoke the properties and methods
    (p1..name='lisi'
      ..age=50
      ..getSchool();)
    this formular is same as
    (p1.name='lisi'
    p1.age=50
    p1.getSchool())
    
    p1?.getSchool() //invoke when p1 is not null
    if(p1 is Person) p1?.getSchool() 

import用法

    //put class into a separate file under filedirectory/classfile.dart , and import it using 'import filedirectory/classfile.dart'

函数继承

    //inheritance
    class Son extends Person{
    	String sex;
    	//father's constructor can not be inheritanted,needs to modify
    	 Son(String name, num age, String sex) : super(name,age){
           this.sex = sex
    	 }
    	 
    	 @override
    	 void printInfo(){
           print("this is child override father method")
           //then invoke father class's method
           super.getSchool()
    	 }
    }
    
    
    //multiple inheritance using with
    class D extends C with A, B{
      
    }

Dart 抽象类

抽象类继承

    //abstract class use to define the criteria, the child class can inheritant the abstract class, or write its own abstract interface
    
    abstract class Animal{
    //define abstract method ,needs descendants to override
      eat()
      printInfo(){
        print('this is the normal function')
      }
    }
    
    class Dog extends Animal{
      @override
      eat(){
        print('dog is eating')
      }
    }
    
    Dog d = new Dog()
    d.eat();
    d.printInfo()

抽象类作为接口

    //asbract class as interface
    abstract class DB{
      add();
      save();
      delete();
    }
    
    abstract class Jian{
      String word;
    }
    
    class msSql implements DB, Jian{
    @override
    	word = 'jjjj'
    
      @override
      add(){
        
      }
      @override
      save(){
        
      }
      @override
      delete(){
        
      }
    }

dart 泛型

    T getData<T>(T value){
      return value
    }
    
    getData<String>('char fu')
    getData<num>(123)
    getData<List>([1,2,3])
    
    class PrintList<T>{
      List listTwo = new List<T>();
      
      void add(T value){
        this.listTwo.add(value);
      }
      
      void printInfo(){
        listTwo.forEach((value){
          print(value)
        })
      }
    }
    
    PrintList p1 = new PrintList<String>();
    PrintList p2 = new PrintList<int>();
    
    //T type interface
    abstract class Cache<T>{
      getByKey(String key);
      void setByKey(String key, T value)
    }
    
    class FileCache<T> implements Cache<T>{
      @override
      getByKey(String key){
        return 'dddd'
      }
      
      @setByKey(String key, T value){
        print('I am the file cache in the rom')
      }
    }
    
    FileCache fi1 = new FileCache<String>()
    FileCache fi2 = new FIleCache<Map>()
    
    


