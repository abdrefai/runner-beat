import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:runner_beat/models/Playlist.dart';
import 'package:runner_beat/models/exercise.dart';

import 'package:runner_beat/pages/drawerPage.dart';
import 'package:runner_beat/service/dataBaseHelper.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {



  double xOffset = 0;
  double yOffset = 0;
  Icon drawerIcon =  Icon(Icons.menu,size: 30,color: Colors.grey,) ;


  bool isDrawerOpen = false ;

  int currentTab = 0 ;


  late Future<List<PlayListModel>> _playlistData;

  late Future<List<ExerciseModel>> _ExerciseData;

  @override
  void initState(){
     super.initState();
     _updatePlaylistData();
     _updateExerciseData();
  }

  _updatePlaylistData(){
    _playlistData =DatabaseConnection.instance.getPlayList();
  }

  _updateExerciseData(){
    _ExerciseData =DatabaseConnection.instance.getExercise();
  }

  Widget PlayListForm(PlayListModel playListModel){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: AutoSizeText(
                    playListModel.name!,
                    minFontSize: 22,
                    maxFontSize: 25,
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),
          ),


          Container(
            width: MediaQuery.of(context).size.width*0.3,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  '00:00',
                  style: TextStyle(color: Colors.white),

                ),
                Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: 24,
                ),
                Icon(
                  Icons.play_circle_fill,
                  color: Colors.grey,
                  size: 24,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
  Widget ExerciseForm(ExerciseModel exerciseModel){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: AutoSizeText(
                    exerciseModel.name!,
                    minFontSize: 22,
                    maxFontSize: 25,
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),
          ),


          Container(
            width: MediaQuery.of(context).size.width*0.3,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  '00:00',
                  style: TextStyle(color: Colors.white),

                ),
                Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: 24,
                ),
                Icon(
                  Icons.play_circle_fill,
                  color: Colors.grey,
                  size: 24,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
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
                                drawerIcon = Icon(Icons.arrow_back_outlined,size: 30,color: Colors.grey,);
                                });
                            }
                            else
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                isDrawerOpen = false;
                                drawerIcon = Icon(Icons.menu,size: 30,color: Colors.grey,);

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
                   // IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 30,color: Colors.grey,))
                    PopupMenuButton<int>(color: Color.fromRGBO(39, 36, 53, 1),itemBuilder: (context)=>[
                       PopupMenuItem<int>(
                           value: 0,
                           child: Text('add playlist', style: TextStyle(color: Colors.white))
                       ),
                      PopupMenuItem<int>(
                          value: 1,
                          child: Text('add Exercise', style: TextStyle(color: Colors.white))
                      )
                    ],
                      onSelected: (item)=>SelectedItem(context,item),
                    )
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
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.grey,
                          indicatorWeight: 1.5,
                          tabs: [

                            Tab(
                              child: Text('My playlists',style: TextStyle(fontSize: 20)),
                            ),
                            Tab(
                              child: Text('My Exercise',style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [

                              FutureBuilder(
                                future: _playlistData,
                                builder: (context ,AsyncSnapshot snapshot ){
                                  if(!snapshot.hasData){
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                    itemCount: int.parse(snapshot.data!.length.toString()),
                                    itemBuilder: (BuildContext context,int index){
                                        return PlayListForm(snapshot.data[index]);
                                    },
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                  ),
                                );
                                },
                              ),
                              FutureBuilder(
                                future: _ExerciseData,
                                builder: (context ,AsyncSnapshot snapshot ){
                                  if(!snapshot.hasData){
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      itemCount: int.parse(snapshot.data!.length.toString()),
                                      itemBuilder: (BuildContext context,int index){
                                        return ExerciseForm(snapshot.data[index]);
                                      },
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                    ),
                                  );
                                },
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
var _playlistName = TextEditingController();
var _exerciseName = TextEditingController();
var _exerciseDesc = TextEditingController();


var _playList = PlayListModel();
var _exercise = ExerciseModel();

_addplaylist(){
  PlayListModel playListModel = PlayListModel(name: _playlistName.text);
  DatabaseConnection.instance.insertPlaylist(playListModel);
}

_addexercise(){
  ExerciseModel exerciseModel = ExerciseModel(name: _exerciseName.text,description: _exerciseDesc.text);
  DatabaseConnection.instance.insertExercise(exerciseModel);
}


_showPlaylistDialog(BuildContext context){
  return showDialog(context : context , barrierDismissible: true,builder: (param){
    return AlertDialog(
      actions: [
        FlatButton(onPressed: (){
          _playList.name = _playlistName.text;
          _addplaylist();
          _playlistName.text = "";
          Navigator.pushReplacement(context,MaterialPageRoute(builder:
              (BuildContext context) => home()
          ));

        }, child: Text(
          "Add"
        ))
      ],
      title: Text("Add Playlist"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _playlistName,
              decoration: InputDecoration(
                hintText: "type the name here",
                labelText: "Playlist Name"
              ),
            )
          ],
        ),
      ),
    );
  });
}
_showExerciseDialog(BuildContext context){
  return showDialog(context : context , barrierDismissible: true,builder: (param){
    return AlertDialog(
      actions: [
        FlatButton(onPressed: (){
          _exercise.name = _exerciseName.text;
          _exercise.description = _exerciseDesc.text;
          _addexercise();
          _exerciseName.text= "";
          _exerciseDesc.text= "";

          Navigator.pushReplacement(context,MaterialPageRoute(builder:
              (BuildContext context) => home()
          ));
        }, child: Text(
            "Add"
        ))
      ],
      title: Text("Add Exercise"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _exerciseName,
              decoration: InputDecoration(
                  hintText: "type the name here",
                  labelText: "Exercise Name"
              ),
            ),
            TextField(
              controller: _exerciseDesc,
              decoration: InputDecoration(
                  hintText: "type the name here",
                  labelText: "Exercise Description"
              ),
            )
          ],
        ),
      ),
    );
  });
}
SelectedItem(BuildContext context,  item) {
  switch(item){
    case 0:_showPlaylistDialog(context);
    break;
    case 1:_showExerciseDialog(context);
    break;

  }
}
