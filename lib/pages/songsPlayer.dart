import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:runner_beat/models/song.dart';


class PlayerScreen extends StatefulWidget {

  final SongModel songModel;
  List<SongModel> songsdata;
  PlayerScreen({required this.songModel,required this.songsdata});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  Icon Playicon =  Icon(Icons.pause_circle_outline,size: 75,color: Color.fromRGBO(3, 152, 158, 1,),) ;
  bool isplaying = true;
  bool isrepaet = false;

  String speed = "X1";

  AudioPlayer audioPlayer = AudioPlayer();

   List<SongModel> songslist = [] ;

  int currentIndex = 0;
  Duration duration = Duration();
  Duration position = Duration();

  String image = 'assets/images/playon.png';

  String songName='';


  playLocal() async {
    int result = await audioPlayer.play(widget.songModel.path!, isLocal: true);
    print ("sucsess");
    return result;
  }

  playLocalNext() async {
    int result = await audioPlayer.play(songslist[currentIndex].path!, isLocal: true);
    print ("sucsess");
    return result;
  }

  playLocalFirst() async {
    int result = await audioPlayer.play(songslist[0].path!, isLocal: true);
    print ("sucsess");
    return result;
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  void ChangeTrack(bool isNext){
    if(isNext){
      if(currentIndex==songslist.length-1){
        print("end");
        audioPlayer.stop();
        currentIndex = 0;
        setState(() {
          songName = songslist[currentIndex].name!;
        });
        playLocalNext();
      }
     else if(currentIndex!=songslist.length-1){
        print("not end");
        currentIndex++;
        setState(() {
          songName = songslist[currentIndex].name!;
        });
        playLocalNext();
      }

    } else {
      if(currentIndex ==0){
        audioPlayer.stop();
        setState(() {
          songName = songslist[currentIndex].name!;
        });
         playLocalNext();
      }
      if(currentIndex !=0){
        currentIndex--;
        setState(() {
          songName = songslist[currentIndex].name!;
        });
        playLocalNext();
      }
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    songName = widget.songModel.name!;
      playLocal();

      songslist = widget.songsdata;
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration =dd;
      });
    });

    print("this is list of music${songslist[0].path}");
    print(songslist.length);
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        position = Duration(seconds: 0);
        Playicon = Icon(Icons.play_circle_outline,size: 75,color: Color.fromRGBO(3, 152, 158, 1,));
        isplaying = false;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
    //openFile(widget.songModel);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        '${songName} ',

      ),

        backgroundColor: Color.fromRGBO(39, 36, 53, 1),
      centerTitle: true,
      elevation: 0,
    ),
      body: Container(
        color:   Color.fromRGBO(39, 36, 53, 1),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 50),
              child: Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.width*0.5,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Image.asset(
                  image,
                ),
              ),
            ),
            SizedBox(height: 25,),
            Text('data',style: TextStyle(
                color: Colors.white),
            ),
            SizedBox(height: 10,),
            Text('data',style: TextStyle(
                color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.15),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('data',style: TextStyle(
                        color: Colors.white),
                    ),
                    Text('data',style: TextStyle(
                        color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('data',style: TextStyle(
                        color: Colors.white),
                    ),
                    Text('data',style: TextStyle(
                        color: Colors.white),
                    ),
                  ],
                )
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle,size: 30,color: Colors.grey,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,size: 30,color: Colors.grey))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               GestureDetector(
                 onTap:(){
                   if(speed == "X1") {
                     audioPlayer.setPlaybackRate(1.1);
                     setState(() {
                       speed = "X1.1";
                     });
                   }
                  else if(speed == "X1.1") {
                     audioPlayer.setPlaybackRate(1.2);
                     setState(() {
                       speed = "X1.2";
                     });
                   }
                   else if(speed == "X1.2") {
                     audioPlayer.setPlaybackRate(1.3);
                     setState(() {
                       speed = "X1.3";
                     });
                   }
                   else if(speed == "X1.3") {
                     audioPlayer.setPlaybackRate(1);
                     setState(() {
                       speed = "X1";
                     });
                   }
                 } ,
                   child: Text(speed,style: TextStyle(
                       fontSize: 30,color:  Color.fromRGBO(3, 152, 158, 1,)
                   ),)),
                IconButton(onPressed: (){ChangeTrack(false);}, icon: Icon(Icons.skip_previous,size: 35,color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,30,40),
                  child: IconButton(onPressed: (){
                    if(isplaying == false){
                         audioPlayer.resume();
                          setState(() {
                            Playicon =  Icon(Icons.pause_circle_outline,size: 75,color: Color.fromRGBO(3, 152, 158, 1,));
                            isplaying = true;
                            image = 'assets/images/playon.png';
                          });
                    }
                    else if(isplaying ==true){
                      audioPlayer.pause();
                      setState(() {
                        Playicon =  Icon(Icons.play_circle_outline,size: 75,color: Color.fromRGBO(3, 152, 158, 1,));
                        isplaying = false;
                        image = 'assets/images/playoff.png';
                    });
                    }

                    audioPlayer.onDurationChanged.listen((Duration dd) {
                      setState(() {
                        duration =dd;
                      });
                    });

                    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
                      setState(() {
                        position = dd;
                      });
                    });

                  }, icon: Playicon),
                ),
                IconButton(onPressed: (){ChangeTrack(true);}, icon: Icon(Icons.skip_next,size: 35,color: Colors.grey)),
                IconButton(onPressed: (){
                  if(isrepaet==false){
                    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
                    setState(() {
                      isrepaet = true;
                    });
                  }
                  else if (isrepaet == true){
                    audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
                    setState(() {
                      isrepaet = false;
                    });
                  }

                }, icon:isrepaet==false? Icon(Icons.repeat,size: 35,color: Colors.grey):Icon(Icons.repeat,size: 35,color:Color.fromRGBO(3, 152, 158, 1)))
              ],
            ),

            SliderTheme(data: SliderThemeData(
                thumbColor: Colors.white,
                activeTrackColor: Color.fromRGBO(3, 152, 158, 1),
                inactiveTickMarkColor: Color.fromRGBO(3, 152, 158, 1),
                inactiveTrackColor: Colors.grey,
            ), child: Slider(
              min: 0.0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (double v){
                  setState(() {
                    audioPlayer.seek(new Duration(seconds: v.toInt()));
                  });
              },
             )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25,5,25,5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(_formatDuration(position),style: TextStyle(
                      color: Colors.white,fontSize: 20),
                  ),
                  Text(_formatDuration(duration),style: TextStyle(
                      color: Colors.white,fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05)
          ],
        ),
      ),

    );
  }




  String _formatDuration(Duration d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }
}
