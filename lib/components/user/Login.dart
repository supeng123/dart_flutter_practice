import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/tim.jpeg"),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black87
          ),
          Theme(
            data: ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.tealAccent, fontSize: 25.0)
              ),
            ),
            isMaterialAppTheme: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(size: _iconAnimation.value * 140.0),
                Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                    autovalidate: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(
                            color:Colors.white
                          ),
                          decoration: InputDecoration(
                            labelText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color:Colors.white
                          ),
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                        ),
                        Padding(padding: EdgeInsets.only(top: 60.0)),
                        MaterialButton(
                          height: 50.0,
                          minWidth: 150.0,
                          color: Colors.green,
                          splashColor: Colors.teal,
                          textColor: Colors.white,
                          child: Icon(FontAwesomeIcons.signInAlt),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                        )
                      ]
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}