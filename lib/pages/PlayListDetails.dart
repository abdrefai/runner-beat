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
            color: Color(0xFF8B97A2),
            size: 24,
          ),
        ),
        title: Text(
          ' ',

        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 30,))
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://picsum.photos/seed/318/600',
                    ),
                  ),
                ),
                SizedBox(width:25),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Hello World',
                      style: TextStyle(color: Colors.white),

                    ),
                    Text(
                      'Hello World',
                      style: TextStyle(color: Colors.white),

                    ),

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
                    padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(
                            'Hello World',
                            style: TextStyle(color: Colors.white),

                          ),
                        ),

                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 20,),
                        Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Hello World',
                          style: TextStyle(color: Colors.white),

                        ),
                        Text(
                          'Hello World',
                          style: TextStyle(color: Colors.white),

                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 24,
                        ),
                        Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 24,
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
