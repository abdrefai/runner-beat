
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:runner_beat/models/Playlist.dart';
import 'package:runner_beat/models/song.dart';
import 'package:runner_beat/pages/songsPlayer.dart';
import 'package:runner_beat/service/dataBaseHelper.dart';



class PlayListScreen extends StatefulWidget {

  final PlayListModel playListModel;
  PlayListScreen({required this.playListModel});


  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {


  AudioPlayer audioPlayer = AudioPlayer();
  late Future<int> songslistlength;

  List<SongModel> temddata = [];

  Icon Playicon =  Icon(Icons.play_circle_outline,size: 30,color: Colors.grey,) ;
  bool isplaying = false;


  late Future<List<SongModel>> _songData;
  late int listlength=0;
   List<SongModel> _songDataForNext=[];

  @override
  void dispose() {
    audioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  @override
  void initState(){
    super.initState();

    _updateSonglistData(widget.playListModel.id!);
   // Future.delayed(Duration(seconds: 1));
  }

  _updateSonglistData(int id){
    _songData =DatabaseConnection.instance.getSongById(id);
    songslistlength = DatabaseConnection.instance.getSongByIdlength(id) ;
    songslistlength.then((value){
      setState(() {
        listlength = value;
      });

    });
  }

  _addSong(String name,String path,int playlistid){
    SongModel songModel = SongModel(name: name,path: path,playlistId: playlistid);
    DatabaseConnection.instance.insertSong(songModel);
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
          widget.playListModel.name!,

        ),
        actions: [
          IconButton(onPressed: ()async{
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.audio,

                );
                if (result==null) return ;

                final file = result.files.first;

                print("name: ${file.name}");
                print("path: ${file.path}");

                final newfile=  await saveFile(file);
                _addSong(file.name,newfile.path,widget.playListModel.id!);
                print("new path:${newfile.path}");
                Navigator.pushReplacement(context, MaterialPageRoute(builder:
                    (BuildContext context) => PlayListScreen(playListModel: widget.playListModel)
                ));

          }, icon: Icon(Icons.add,size: 35,color: Colors.grey,))
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
                      '${listlength} Track',
                      style: TextStyle(color: Colors.grey,fontSize: 20),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
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
                            IconButton(onPressed: (){
                              Navigator.pushReplacement(context,MaterialPageRoute(builder:
                                  (BuildContext context) => PlayerScreen(songModel: _songDataForNext.first,songsdata:_songDataForNext,)
                              ));
                            }, icon: Icon(Icons.play_circle_outline,size: 20,color: Colors.grey)),
                            AutoSizeText(
                              'Play All',
                              style: TextStyle(color: Colors.white,fontSize: 18),

                            ),
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            FutureBuilder(
              future: _songData,
              builder: (context ,AsyncSnapshot snapshot ) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                        color: Color.fromRGBO(3, 152, 158, 1)),
                  );
                }
                _songDataForNext=snapshot.data;
                return Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.65,

                  child: ListView.builder(
                    itemCount: int.parse(snapshot.data!.length.toString()),
                    itemBuilder: (BuildContext context, int index) {

                      return SongListForm(snapshot.data[index]);

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

  Widget SongListForm(SongModel songModel){

    playLocal() async {
      int result = await audioPlayer.play(songModel.path!, isLocal: true);
      print ("sucsess");
      return result;
    }

    return   Padding(
      padding: EdgeInsetsDirectional.fromSTEB(25, 15, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: (){

             if(isplaying == false ) {
               temddata.add(songModel);
               playLocal();
               print(temddata);
                setState(() {
                  isplaying = true;
                });
              }

              else if(isplaying ==true && temddata.contains(songModel)){

                temddata.remove(songModel);
                print(temddata);
                audioPlayer.stop();
                setState(() {
                  isplaying = false;
                });
              }
          }, icon: temddata.contains(songModel)?Playicon = Icon(Icons.pause_circle_outline,size: 35,color: Color.fromRGBO(3, 152, 158, 1),)
              : Playicon=
          Icon(Icons.play_circle_outline,size: 35,color: Colors.grey,)
          ),
          SizedBox(width: 5,),
          GestureDetector(
            onTap: (){
              audioPlayer.stop();
              temddata.clear();
              Navigator.pushReplacement(context,MaterialPageRoute(builder:
                  (BuildContext context) => PlayerScreen(songModel: songModel,songsdata:_songDataForNext,)
              ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.57,
              child: AutoSizeText(
                songModel.name!,
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


  Future<File> saveFile(PlatformFile file) async{
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);

  }
}
