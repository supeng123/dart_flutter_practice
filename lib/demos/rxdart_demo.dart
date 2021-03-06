import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,

      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Observable<String> _observable = 
    // // Observable(Stream.fromIterable(['elements', 'suloan']));
    // Observable.fromFuture(Future.value("slogan ..."));

    // _observable.listen(print);

    PublishSubject<String> _subject = PublishSubject<String>();

    _subject.listen((data) => print("listen 1: $data"));
    _subject.add('hello');
    _subject.listen((data) => print("listen 2: ${data.toUpperCase()}"));

    _subject.close();
  }

  void onData() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemoHome'),
        elevation: 0.0,
      ),
    );
  }
}