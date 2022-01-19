import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class PlayListScreen extends StatefulWidget {
  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.grey,
            size: 30,
          ),
        ),
        title: Text(
          ' ',

        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 30,color: Colors.grey,))
        ],
        backgroundColor: Color.fromRGBO(39, 36, 53, 1),

        centerTitle: true,
        elevation: 0,
      ),

      body: Container(

        color: Color.fromRGBO(39, 36, 53, 1),

        child: Column(

          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(70, 0, 10, 0),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
                SizedBox(width:15),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Latest Songs',
                      style: TextStyle(color: Colors.white,fontSize: 20),

                    ),
                    SizedBox(height: 5,),
                    Text(
                      '24 Track',
                      style: TextStyle(color: Colors.grey),

                    ),
                    SizedBox(height: 10,),
                    Container(
                     width: 110,
                     height: 40,
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),

                        border: Border.all(
                          color: Color.fromRGBO(3, 152, 158, 1),
                          width: 2
                        ),
                       color: Colors.transparent
                     ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline,size: 20,color: Colors.grey)),
                          Text(
                            'Play All',
                            style: TextStyle(color: Colors.white),

                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height*0.65,

              child:
              ListView(

                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline,size: 30,color: Colors.grey)),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Text(
                            'Hello World',
                            style: TextStyle(color: Colors.white),

                          ),
                        ),

                        Icon(
                          Icons.add_circle,
                          color: Colors.grey,
                          size: 24,
                        ),
                        SizedBox(width: 20,),
                        Icon(
                          Icons.remove_circle,
                          color: Colors.grey,
                          size: 24,
                        ),
                        SizedBox(width: 20,),
                        Text(
                          '20:20',
                          style: TextStyle(color: Colors.white),

                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline,size: 30,color: Colors.grey)),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Text(
                            'Hello World',
                            style: TextStyle(color: Colors.white),

                          ),
                        ),

                        Icon(
                          Icons.add_circle,
                          color: Colors.grey,
                          size: 24,
                        ),
                        SizedBox(width: 20,),
                        Icon(
                          Icons.remove_circle,
                          color: Colors.grey,
                          size: 24,
                        ),
                        SizedBox(width: 20,),
                        Text(
                          '20:20',
                          style: TextStyle(color: Colors.white),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              indent: 30,
              endIndent: 30,
              color: Color.fromRGBO(3, 152, 158, 1),
            ),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );

  }
}
