import 'package:flutter/material.dart';

class Services extends ChangeNotifier{
List<User> defaultList = [];
void updateListener(User user, BuildContext context) {
  if (!defaultList.contains(user)) {
    try {
      defaultList.add(user);
      notifyListeners();
    } catch (e) {
      print('failed because $e');
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text(
          'Post already added',
        ),
      ),
    );
  }
  print(defaultList.length);
}

void deleteListener(User user, BuildContext context) {
  try {
    defaultList.remove(user);
    notifyListeners();
  } catch (e) {
    print('failed because $e');
  }
}
}
class User {
  final String capt, akun, image;

  User({
    required this.image,
    required this.capt,
    required this.akun,
  });
}