import 'package:flutter/material.dart';
import 'package:runner_beat/pages/ExerciseDetails.dart';
import 'package:runner_beat/pages/PlayListDetails.dart';
import 'package:runner_beat/pages/songsPlayer.dart';


class DrawerPage extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.topLeft,
        color:Color.fromRGBO(39, 36, 53, 0.97),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(

                      child: Image.asset('assets/images/logo.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text('username',style: TextStyle(fontSize: 25,color: Colors.white)),
                ],
              ),
              Divider(),
              SizedBox(height: 50,),
              GestureDetector(
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (BuildContext context) => PlayerScreen()
                  ));
                },
                child: Row(
                  children: [
                    Icon(Icons.play_circle_outline,color: Color.fromRGBO(3, 152, 158, 1)),
                    SizedBox(width: 10,),
                    Text('Media Player',style: TextStyle(fontSize: 25,color: Colors.white)),
                  ],
                ),
              ),
              Divider(),

              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (BuildContext context) => PlayListScreen()
                  ));
                },
                child: Row(
                  children: [
                    Icon(Icons.favorite_border_outlined,color: Color.fromRGBO(3, 152, 158, 1)),
                    SizedBox(width: 10,),
                    Text('PlayList',style: TextStyle(fontSize: 25,color: Colors.white)),
                  ],
                ),
              ),
              Divider(),

              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (BuildContext context) => ExerciseScreen()
                  ));
                },
                child: Row(
                  children: [
                    Icon(Icons.person_outline,color:Color.fromRGBO(3, 152, 158, 1)),
                    SizedBox(width: 10,),
                    Text('Exercise',style:TextStyle(fontSize: 25,color: Colors.white)),
                  ],
                ),
              ),
              Divider(),

              SizedBox(height: 10,),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Theme.of(context).splashColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("test",style: TextStyle(fontSize: 20,color: Colors.white),),
                      SizedBox(width: 10),
                   /*   ElevatedButton(

                  *//*      onPressed: () async{
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:
                              (BuildContext context) => BottomNav()
                          ));
                          await context.setLocale(Locale('en'));
                        },*//*

                        child: Text(
                          "test",style: TextStyle(fontSize: 12,color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary :Color.fromRGBO(233, 57, 69, 1)
                        ),

                      ),*/
                      SizedBox(width: 10),
                 /*     ElevatedButton(
                     *//*   onPressed: ()async{
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:
                              (BuildContext context) => BottomNav()
                          ));
                          await context.setLocale(Locale('ar'));
                        },*//*
                        child: Text(
                            "test"
                        ),
                        style: ElevatedButton.styleFrom(
                            primary :Color.fromRGBO(233, 57, 69, 1)
                        ),
                      ),
*/

                    ],
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 10,),
            /*  GestureDetector(
                onTap: () async{
                  var test = await WooCommerceApi.prodMode.logUserOut();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginWidget(),
                    ),
                    // result: () => print("Done")
                  );
                  return test;
                },
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app_outlined,color: Color.fromRGBO(233, 57, 69, 1),),
                    SizedBox(width: 10,),
                    Text('logout',style: TextStyle(fontSize: 25,color: Colors.white)),
                  ],
                ),
              ),*/
              Divider(),

            ],
          ),
        ),
      ),
    );
  }
}
