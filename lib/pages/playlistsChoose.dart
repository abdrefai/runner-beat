
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:runner_beat/models/Playlist.dart';
import 'package:runner_beat/models/exercise.dart';
import 'package:runner_beat/models/song.dart';
import 'package:runner_beat/pages/ExerciseDetails.dart';
import 'package:runner_beat/pages/songsPlayer.dart';
import 'package:runner_beat/service/dataBaseHelper.dart';



class PlayListChooseScreen extends StatefulWidget {

  final ExerciseModel exerciseModel;
  PlayListChooseScreen({required this.exerciseModel});

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListChooseScreen> {


  AudioPlayer audioPlayer = AudioPlayer();

  late Future<List<PlayListModel>> _playlistData;

  _updatePlaylistData(){
    _playlistData =DatabaseConnection.instance.getPlayList();
  }

  _updateplaylist(id,name,exid){
    PlayListModel playListModel = PlayListModel(exerciseid:exid,name: name);
    DatabaseConnection.instance.updatePlaylist(playListModel,id);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    print(widget.exerciseModel.id);
    _updatePlaylistData();
  }


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
            size: 35,
          ),
        ),
        title: Text(
         "Add playlist",

        ),

        backgroundColor: Color.fromRGBO(39, 36, 53, 1),

        centerTitle: true,
        elevation: 0,
      ),

      body: Container(

        color: Color.fromRGBO(39, 36, 53, 1),

        child:  FutureBuilder(
          future: _playlistData,
          builder: (context ,AsyncSnapshot snapshot ){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(color: Color.fromRGBO(3, 152, 158, 1)),
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
      ),
    );

  }

  Widget PlayListForm(PlayListModel playListModel){

    return   Padding(
      padding: EdgeInsetsDirectional.fromSTEB(25, 15, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                _updateplaylist(playListModel.id,playListModel.name,widget.exerciseModel.id);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (BuildContext context) => ExerciseScreen(exerciseModel:widget.exerciseModel)
                    ));
              },
              child: Container(color: Color.fromRGBO(3, 152, 158, 1),width: MediaQuery.of(context).size.width*0.7,height: MediaQuery.of(context).size.height*0.08,
                  alignment: Alignment.center,

                  child: AutoSizeText(playListModel.name!,minFontSize: 25,style: TextStyle(color: Colors.white)
                    ,)),
            ),
          )
        ],
      ),
    );
  }


  Future<File> saveFile(PlatformFile file) async{
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }
}
