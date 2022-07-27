import 'package:android/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bookmark extends StatefulWidget {
  const bookmark({Key? key}) : super(key: key);

  @override
  State<bookmark> createState() => _bookmarkState();
}

class _bookmarkState extends State<bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          title: Text(
            'Bookmark',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Billabong',
              fontSize: 35,
            ),
          ),
        ),

      body: Consumer<Services>(
        builder: (context, services, child) {
          return ListView.builder(
            itemCount: services.defaultList.length,
            itemBuilder:(context,index){
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 50,
                      height:50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(),

                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/avatar.png'),
                          )
                      ),

                    ),
                    title: Text(services.defaultList[index].akun),
                    subtitle: Text(services.defaultList[index].capt),
                    trailing: Icon(Icons.more_vert),
                  ),

                  Container(
                      height: 300,
                      decoration: BoxDecoration(

                        image:DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(services.defaultList[index].image),
                        ),


                      )
                  ),
                  ListTile(
                    leading: Wrap(
                      spacing: 10,
                      children: [
                        Icon(Icons.favorite,color: Colors.red,
                          size: 30,
                        ),

                        Icon(Icons.comment_outlined,color: Colors.black,
                          size: 28,
                        ),

                        Icon(Icons.share,color: Colors.black,
                          size: 28,
                        ),

                      ],),




                    trailing: IconButton(
                      onPressed: () {
                        services.deleteListener(services.defaultList[index], context);
                      },

                      icon: Icon(
                        Icons.bookmark_border_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  )

                  ,Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.only(left:18.0),
                          child: Text('Disukai oleh Daimo_huisand dan lainnya',
                              style:TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ]),
                  Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.only(left:18.0),
                          child: Text('Harta Tahta Nilai A',
                              style:TextStyle(
                                fontWeight: FontWeight.w700,

                              )),
                        ),

                      ]),

                  Row(
                      children:[
                        Padding(
                          padding: const EdgeInsets.only(left:18.0),
                          child: Text('Lihat semua 1.232 komentar',
                              style:TextStyle(
                              )),
                        ),
                      ]),

                ],

              );
            },

          );
        },
      ),
    );
    
  }
}
