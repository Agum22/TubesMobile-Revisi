import 'package:android/Bookmark.dart';
import 'package:android/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:android/bottombar_widget.dart';
import 'package:android/postWidget.dart';
import 'DM/Search.dart';
import 'story.dart';
import 'package:android/Login/dummy_data.dart';
import 'package:android/Login/CobaLogin.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int idUser = 0;
  Widget _namaUser = const Text('');

  getLocalData() async {
    final prefis = await SharedPreferences.getInstance();
    idUser = prefis.getInt('id')!;
    ambilData();
    setState(() {});
  }
  void ambilData() {
    for (int i = 0; i < DummyData.data.length; i++) {
      if (idUser == (DummyData.data[i]['id'])) {
        _namaUser = Text(DummyData.data[i]['nama']);
      }
    }
  }
  Future clearLogin() async {
    final prefis = await SharedPreferences.getInstance();
    await prefis.setInt('id', 0);
    idUser = prefis.getInt('id')!;
  }
  void logout() {
    clearLogin();
    if (idUser == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>  CobaLogin()),
      );
    }

  }
  @override
  void initState(){

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });

    getLocalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title: Text('Instagram',
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: 'Billabong',
          fontSize: 35,
          ),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            iconSize: 30,
            onPressed: logout
          ),

          IconButton(icon: Icon(Icons.add,
          size: 35,
          ), onPressed: (){},),

          IconButton(
            icon: Icon(Icons.bookmark_border_outlined),
          iconSize: 30,
          onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=> bookmark()
                  ),
              );
          }),

          IconButton(
            icon: Icon(Icons.send),
            iconSize: 30,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return chat();
              }));
            },),



        ],),

      body: Column(children:[
      StoryWidget(),
      Container(
        child: _namaUser,
      ),
      Divider(color: Colors.grey),
        Expanded(child: PostWidget(),)
      ]


          ),


      bottomNavigationBar: BottombarWidget(),

    );
  }
}

