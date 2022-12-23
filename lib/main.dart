import 'package:flutter/material.dart';
import 'controller/food_controller.dart';
import 'screen/home_screen.dart';
import 'package:get/get.dart';
import 'screen/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../controller/firebase_cls.dart';
import 'package:foodie_app/screen/login_screen.dart';
import 'package:foodie_app/screen/signup.dart';
import 'controller/notification_alert.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

final FoodController controller = Get.put(FoodController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseCls.initialize();
  runApp(const MyApp());
}
// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: controller.theme.value,
        home: const MyHomePage(title: 'Foodie App'),

        routes: <String, WidgetBuilder>{
          '/Signup': (BuildContext) => new SignupPage()
        },
        // home: HomeScreen(),
      );
    });
  }


  // Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  //   if (message.containsKey('data')) {
  //     // Handle data message
  //     final dynamic data = message['data'];
  //     String title = data['nt']??data['title'];
  //     String body = data['nm']??data['body'];
  //     String imageUrl = data['wzrk_bp']??'';
  //     return title.isEmpty? null : showNotification(title, body, imageUrl);
  //   }
  // }
  // showNotification(String title, String body, String image)async{
  //   await AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: id,
  //           channelKey: 'basic_test',
  //           title: title',
  //           bigPicture:
  //           'https://i0.wp.com/www.jornadageek.com.br/wp-content/uploads/2018/06/Looney-tunes.png?resize=696%2C398&ssl=1',
  //           notificationLayout: NotificationLayout.BigPicture,
  //           payload: {'uuid': 'uuid-test'}));
  // }
}