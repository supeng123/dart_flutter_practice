import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterForm'),
        elevation: 0.0,
      ),
      body: Container(
        child: Form(
          child: Column(
            children:<Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'username'
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password'
                ),
              ),
              SizedBox(height:32.0),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  elevation: 0.0,
                  onPressed: (){
                      Navigator.pushNamed(context, '/search', arguments: {"pid": 123});
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