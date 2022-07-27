
import 'package:flutter/material.dart';
import 'body.dart';

class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> with SingleTickerProviderStateMixin {
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('agumbys');
  final TextEditingController _filter = new TextEditingController();

  void _searchh() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          controller: _filter,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Cari '),
        );
      } else {
        _searchIcon = const Icon(Icons.search);
        _appBarTitle = const Text('agumbys');
        _filter.clear();
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: body(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: _appBarTitle,
      actions: [
        IconButton(
          icon: _searchIcon,color: Colors.black,
          onPressed: _searchh,
        ),
        IconButton(
          icon: Image.asset("assets/images/vidcall.png" , width: 35,),
          onPressed: () {},
        ),
      IconButton(
     icon: Image.asset("assets/images/pesan.png",width: 25,),
      onPressed: () {},
      )
      ],

    );

  }
}
