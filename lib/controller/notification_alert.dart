import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notifications/notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyAppNoti());

class MyAppNoti extends StatefulWidget {
  const MyAppNoti({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppNoti> {
  Notifications? _notifications;
  StreamSubscription<NotificationEvent>? _subscription;
  List<NotificationEvent> _log = [];
  bool started = false;

  String messageTitle = "Empty";
  String notificationAlert = "alert";

  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    startListening();
  }

  void onData(NotificationEvent event) {
    setState(() {
      _log.add(event);
    });
    print(event.toString());
  }

  void example() {
    Notifications().notificationStream!.listen((event) => print(event));
  }

  void startListening() {
    _notifications = Notifications();
    try {
      _subscription = _notifications!.notificationStream!.listen(onData);
      setState(() => started = true);
    } on NotificationException catch (exception) {
      print(exception);
    }
  }

  void stopListening() {
    _subscription?.cancel();
    setState(() => started = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testinggg"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              notificationAlert,
            ),
            Text(
              messageTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );

    // return new MaterialApp(
    //   home: new Scaffold(
    //     appBar: new AppBar(
    //       title: const Text('Notifications Example app'),
    //     ),
    //     body: new Center(
    //         child: new ListView.builder(
    //             itemCount: _log.length,
    //             reverse: true,
    //             itemBuilder: (BuildContext context, int idx) {
    //               final entry = _log[idx];
    //               return ListTile(
    //                   leading:
    //                   Text(entry.timeStamp.toString().substring(0, 19)),
    //                   trailing:
    //                   Text(entry.packageName.toString().split('.').last));
    //             })),
    //     floatingActionButton: new FloatingActionButton(
    //       onPressed: started ? stopListening : startListening,
    //       tooltip: 'Start/Stop sensing',
    //       child: started ? Icon(Icons.stop) : Icon(Icons.play_arrow),
    //     ),
    //   ),
    // );
  }
}