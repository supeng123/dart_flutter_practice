import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WidgetName'),
          elevation: 0.0,
        ),
        body: StreamDemoHome());
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamDemoSubscription =  _streamDemo.listen(onData, onError: onError, onDone: onDone);

    // _streamDemo = StreamController<String>();

    _streamDemo = StreamController.broadcast();
    //add multiple subscription
    _sinkDemo = _streamDemo.sink;

    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    // _streamDemo.stream.listen(onDataSecond, onError: onError, onDone: onDone);
  }

  void onData(String data) {
    print("$data");
  }

  // void onDataSecond(String data) {}

  void onError(String error) {
    print("Error: $error");
  }

  void onDone() {
    print("Done:");
  }

  void _addDataToStream() async {
    print('Add data to stream:');
    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  void _pauseStream() {
    print('Pause subscription:');
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subscription:');
    _streamDemoSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel subscription:');
    _streamDemoSubscription.cancel();
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'Hello slogan';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemoHome'),
        elevation: 0.0,
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // StreamBuilder(
            //   stream: _streamDemo.stream,
            //   initialData: '...',
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     return Text('data: ${snapshot.data}');
            //   },
            // ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              FlatButton(
                child: Text('Add'),
                onPressed: _addDataToStream,
              ),
              FlatButton(
                child: Text('Pause'),
                onPressed: _pauseStream,
              ),
              FlatButton(
                child: Text('Resume'),
                onPressed: _resumeStream,
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: _cancelStream,
              )
            ]),
          ],
        )),
      ),
    );
  }
}
