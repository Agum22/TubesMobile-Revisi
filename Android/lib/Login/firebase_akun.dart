import 'package:firebase_auth/firebase_auth.dart';

class Firebase_akun {
  final FirebaseAuth firebaseauth;
  Firebase_akun (this.firebaseauth);
  Future<bool> login({required String email, required String password}) async {
    try{
      await firebaseauth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e){
      print(e.message ?? "Unknown Error");
      return false ;
    }
  }

  Future<bool> create({required String email, required String password}) async {
    try{
      await firebaseauth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e){
      print(e.message ?? "Unknown Error");
      return false ;
    }
  }
}

