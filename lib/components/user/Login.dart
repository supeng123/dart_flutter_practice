import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autoValidate = false;

  submitRegisterForm(context) { 
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('username: $username');
      Navigator.pushNamed(context, '/search', arguments: {"pid": 123});
    } else {
      setState(() {
        autoValidate = true;
      });
    }     
  }

  String validateUsername(value) {
    if (value.isEmpty){
      return 'username is required.';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty){
      return 'password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterForm'),
        elevation: 0.0,
      ),
      body: Container(
        child: Form(
          key: registerFormKey,
          child: Column(
            children:<Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'username',
                  helperText: ''
                ),
                onSaved: (value){
                  this.username = value;
                },
                validator: validateUsername,
                autovalidate: autoValidate,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password',
                  helperText: ''
                ),
                onSaved: (value){
                  this.password = value;
                },
                validator: validatePassword,
                autovalidate: autoValidate,
              ),
              SizedBox(height:32.0),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  elevation: 0.0,
                  onPressed: (){
                    this.submitRegisterForm(context);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white))
                )
              )
            ]
          )
        ),
      ),
    );
  }
}