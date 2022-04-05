import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:runner_beat/models/Playlist.dart';
import 'package:runner_beat/models/exercise.dart';
import 'package:runner_beat/pages/playlistsChoose.dart';
import 'package:runner_beat/service/dataBaseHelper.dart';

import 'PlayListDetails.dart';

class ExerciseScreen extends StatefulWidget {

  final ExerciseModel exerciseModel;
  ExerciseScreen({required this.exerciseModel});


  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();



  late Future<List<PlayListModel>> _playlistData;

  var selectedvalue;
  var categoryies = <RadioListTile>[];

  _updatePlaylistData(){
    _playlistData =DatabaseConnection.instance.getPlayList();
  }

  _updateSongexercisetData(int id){
    _playlistData =DatabaseConnection.instance.getPlaylistsById(id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateSongexercisetData(widget.exerciseModel.id!);
    print(categoryies);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            size: 35,
          ),
        ),
        title: Text(
          ' ',
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder:
                (BuildContext context) => PlayListChooseScreen(exerciseModel: widget.exerciseModel,)
            ));
          }, icon: Icon(Icons.add,
            size: 35,
            color: Colors.grey,))
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
            Padding(
              padding: const EdgeInsets.fromLTRB(40,0,0,0),
              child: Row(
                children: [
                  Text(
                    'Name :',
                    style: TextStyle(color: Colors.white ,fontSize: 25),

                  ),
                  SizedBox(width: 15,),
                  Text(
                    ' ${widget.exerciseModel.name}',
                    style: TextStyle(color: Colors.white,fontSize: 25),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40,0,0,0),
              child: Row(
                children: [
                  Text(
                    'BPM :',
                    style: TextStyle(color: Colors.white ,fontSize: 25),

                  ),
                  SizedBox(width: 15,),
                  Text(
                    '',
                    style: TextStyle(color: Colors.white),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40,0,0,0),
              child: Row(
                children: [
                  Text(
                    'Duration :',
                    style: TextStyle(color: Colors.white ,fontSize: 25),

                  ),
                  SizedBox(width: 15,),
                  Text(
                    '',
                    style: TextStyle(color: Colors.white),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40,0,0,0),
              child: Row(
                children: [
                  Text(
                    'Description :',
                    style: TextStyle(color: Colors.white ,fontSize: 25),

                  ),
                  SizedBox(width: 15,),
                  Text(
                    ' ${widget.exerciseModel.description}',
                    style: TextStyle(color: Colors.white,fontSize: 25),

                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height*0.2,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
                SizedBox(width:5),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Latest Songs',
                      style: TextStyle(color: Colors.white,fontSize: 25),

                    ),
                    SizedBox(height: 5,),
                    Text(
                      '24 Track',
                      style: TextStyle(color: Colors.grey,fontSize: 20),

                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.23,
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
                            style: TextStyle(color: Colors.white,fontSize: 18),

                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
            //SizedBox(height: 20,),
            FutureBuilder(
                future: _playlistData,
                builder: (context ,AsyncSnapshot snapshot ) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                          color: Color.fromRGBO(3, 152, 158, 1)),
                    );
                  }
                  return Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.57,

                    child: ListView.builder(
                      itemCount: int.parse(snapshot.data!.length.toString()),
                      itemBuilder: (BuildContext context, int index) {
                        return ExerciseListForm(snapshot.data[index]);
                      },
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,

                    ),
                  );
                }),
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
  Widget ExerciseListForm(PlayListModel playListModel){
    return   Padding(
      padding: EdgeInsetsDirectional.fromSTEB(25, 0, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         /* IconButton(onPressed: (){},
            icon: Icon(Icons.pause_circle_outline,size: 35,color: Color.fromRGBO(3, 152, 158, 1),)
            ),
          SizedBox(width: 5,),*/
          GestureDetector(
            onTap: (){

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                  (BuildContext context) => PlayListScreen(playListModel:playListModel)
              ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.57,
              child: AutoSizeText(
                playListModel.name!,
                style: TextStyle(color: Colors.white,fontSize: 18),

              ),
            ),
          ),

          Icon(
            Icons.add_circle,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(width: 20,),
          Icon(
            Icons.remove_circle,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(width: 20,),
          Text(
            '20:20',
            style: TextStyle(color: Colors.white,fontSize: 17),

          ),
        ],
      ),
    );
  }
  Widget PlayListForm(PlayListModel playListModel){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder:
                (BuildContext context) => PlayListScreen(playListModel: playListModel,)
            ));},
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: AutoSizeText(
                      playListModel.name!,
                      minFontSize: 25,
                      maxFontSize: 30,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

}
