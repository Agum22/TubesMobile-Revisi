
import 'package:android/DM/List.dart';
import 'package:android/Modul6/Dio.dart';
import 'package:android/Modul6/Model.dart';
import 'package:android/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<User> listUser = [
      User(image: 'assets/images/avatar.png', capt: 'Malang,Jawa timur', akun: 'agumbys'),
      User(image: 'assets/images/post4.jpg', capt: 'Malang,Jawa timur', akun: 'agumbys1'),
      User(image: 'assets/images/post2.jpg', capt: 'Malang,Jawa timur', akun: 'agumbys2'),
      User(image: 'assets/images/post3.jpg', capt: 'Malang,Jawa timur', akun: 'agumbys3'),
      User(image: 'assets/images/post3.jpg', capt: 'Malang,Jawa timur', akun: 'agumbys3'),
    ];

    return FutureBuilder<Welcome>(
      future: DioClass().getData(),
      builder: (context, snapshot) {
        List<Post> uList = snapshot.data!.posts;
        return Consumer<Services>(
          builder: (context, services, child) {
            return ListView.builder(
              itemCount: uList.length,
              itemBuilder:(context,index){
                return Column(
                  children: [
                    ListTile(
                      // onTap: (){
                      //   DioClass().delete(uList[index].id.toString());
                      // },
                      leading: Container(
                        width: 50,
                        height:50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(),

                            image: DecorationImage(
                              image: AssetImage('assets/images/avatar.png'),
                            )
                        ),

                      ),
                      title: Text(uList[index].nama),
                      subtitle: Text(uList[index].tampil),
                      trailing: IconButton(onPressed: (){
                          DioClass().delete(uList[index].id.toString());
                          // initstate();
                      },
                          icon: Icon(
                              Icons.more_vert,
                          )
                      ),
                    ),

                    Container(
                        height: 300,
                        decoration: BoxDecoration(

                          image:DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(uList[index].img),
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
                          services.updateListener(listUser[index], context);
                          // DioClass().delete(uList[index].id.toString());
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
        );
      },
    );
  }
}
