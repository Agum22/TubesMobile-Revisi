import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_akun.dart';

class CobaLogin extends StatefulWidget {
  const CobaLogin({Key? key}) : super(key: key);

  @override
  State<CobaLogin> createState() => _CobaLoginState();
}

class _CobaLoginState extends State<CobaLogin> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  late int userid = 0;
  int buttonColor = 0xff26A9FF;

  @override
  void initState() {
    getData();
    super.initState();
  }


  void hasil()async{
    Firebase_akun service = Firebase_akun(FirebaseAuth.instance);
    if (await service.login(email: user.text, password: pass.text)){
      login();
    }
    // for(int i=0; i < DummyData.data.length; i++){
    //   if(user.text.contains(DummyData.data[i]['username']) && pass.text.contains(DummyData.data[i]['password'])){
    //     saveToLocal(DummyData.data[i]['id']); initState();
    //     // initState();
    //   }
    // }
  }

  saveToLocal(int id) async {
    final prefis = await SharedPreferences.getInstance();
    await prefis.setInt('id', id);
  }

  Future getData() async{
    final prefis = await SharedPreferences.getInstance();
    userid = prefis.getInt('id')!;
    if(userid != 0){
      login();
    }
  }

  void login(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>   HomeScreen()),);
  }

  @override
  Widget build(BuildContext context) {
    double deviseWidth = MediaQuery.of(context).size.width;
    return Scaffold(

      body: SafeArea(
          child: SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 90,
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset('assets/images/instagramlogo.png',
    height: deviseWidth * .20,
    ),
    SizedBox(height: deviseWidth * .05,),
      Container(
          width: deviseWidth * .90,
          height: deviseWidth * .14,
          decoration: BoxDecoration(
            color: Color(0xffE8E8E8),
            borderRadius: BorderRadius.all(Radius.circular(5)),),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Username'
                ),
                controller: user,
                style: TextStyle(
                  fontSize: deviseWidth * .040,
                ),
              ),
          ),
         ),
      SizedBox(height: deviseWidth * .04,),
      Container(
        width: deviseWidth * .90,
        height: deviseWidth * .14,
        decoration: BoxDecoration(
          color: Color(0xffE8E8E8),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Password'),
                ),
                ),

              ),

          ),
      FlatButton(
        onPressed: (){
          //TODO FORGOT PASSWORD SCREEN GOES HERE
        },
        child: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
      ),
      Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: FlatButton(
          onPressed: hasil,
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => const Homescreen()));

          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: const Text('New User? Create Account'),
      ),

      SizedBox(height: deviseWidth * .06,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/facebook.png',
            height: deviseWidth * .060,
          ),
          SizedBox(width: 5,),
          Text('Login with facebook',
            style: TextStyle(
              color: Color(0xff1877f2),
              fontSize: deviseWidth * .040,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ]

          ),

      ]
    ),),
    ),),
    );


  }
}
