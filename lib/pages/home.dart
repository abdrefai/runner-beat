import 'package:flutter/material.dart';

import 'package:runner_beat/pages/drawerPage.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {



  double xOffset = 0;
  double yOffset = 0;
  Icon drawerIcon =  Icon(Icons.menu) ;


  bool isDrawerOpen = false ;

  int currentTab = 0 ;




  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          DrawerPage(),
          AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset,0)..scale(isDrawerOpen ? 0.79: 1.00),
            duration: Duration(milliseconds: 250),
            child: Scaffold(
              appBar: AppBar(
                  leading: Builder(
                    builder: (BuildContext context) {

                      return IconButton(

                        icon: drawerIcon,
                        onPressed: (){
                          if(isDrawerOpen == false){
                                setState(() {
                                xOffset = 280;
                                yOffset = 80;
                                isDrawerOpen = true;
                                drawerIcon = Icon(Icons.arrow_forward_outlined,size: 30);
                                });
                            }
                            else
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                isDrawerOpen = false;
                                drawerIcon = Icon(Icons.menu,size: 30);

                              });


                        },
                      );
                    },
                  ),
                  title: Image(
                    image: AssetImage('assets/images/logo.png',),
                    width:60,

                  ),
                  actions: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 30,))
                  ],
                  centerTitle: true,

                  backgroundColor: Color.fromRGBO(39, 36, 53, 1)
              ),
              body:Container(
                color: Color.fromRGBO(39, 36, 53, 1),
                child:  DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Color.fromRGBO(3, 152, 158, 1),
                          unselectedLabelColor: Colors.white,
                          indicatorColor: Colors.white,
                          indicatorWeight: 1.5,
                          tabs: [

                            Tab(
                              text: 'My PlayLists',
                            ),
                            Tab(
                              text: 'My Exercises',
                            )
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    children: [
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
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    children: [
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
                              ),
                            ],
                          ),

                        ),

                      ],
                    ),
                  ),
                ),
              )

            ),
          ),
        ]);
  }
}
