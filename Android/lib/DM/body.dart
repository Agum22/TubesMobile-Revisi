import 'package:flutter/material.dart';
import 'package:android/DM/List.dart';

import 'insert.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index)  {
                return ListTile (
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(list[index]['img'].toString()),
                  ),

                  title: Text(list[index]['name'].toString()),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => insert(str: list[index]['name'].toString(),),
                      ),
                    );

                  },
                );

              }
          ),
        ),
      ],
    );
  }
}
