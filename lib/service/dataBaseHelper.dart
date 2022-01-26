

import 'dart:math';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:runner_beat/models/Playlist.dart';
import 'package:runner_beat/models/exercise.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection{
static final DatabaseConnection instance = DatabaseConnection._instance();

static Database? _database =null;

DatabaseConnection._instance();

Future<Database> setDatabase() async{
   var directory = await getApplicationDocumentsDirectory();
   var path = join(directory.path,"db_runnerbeats_sqflite");
   var database = await openDatabase(path, version: 1,onCreate:_onCreatingDatabase );

   return database;
 }

 _onCreatingDatabase(Database database,int version) async {
   await database.execute("CREATE TABLE playlist(id INTEGER PRIMARY KEY,name TEXT)");
   await database.execute("CREATE TABLE exercise(id INTEGER PRIMARY KEY,name TEXT,description TEXT)");
 }

Future<Database?> get database async {
  if (_database == null ){
    _database = await setDatabase();
  }
    return _database;
}


Future<List<Map<String,dynamic>>> getPlaylistMapList() async{
  Database? database = await this.database;
  final List<Map<String,dynamic>> result = await database!.query("playlist");
  return result;
}

Future<List<PlayListModel>> getPlayList ()async{
  final List<Map<String,dynamic>> playListList = await getPlaylistMapList();

  final List<PlayListModel> playlist = [];

  playListList.forEach((element) {
    playlist.add(PlayListModel.fromMap(element));
  });

  return playlist;

}

Future<List<Map<String,dynamic>>> getExerciseMapList() async{
  Database? database = await this.database;
  final List<Map<String,dynamic>> result = await database!.query("exercise");
  return result;
}

Future<List<ExerciseModel>> getExercise ()async{
  final List<Map<String,dynamic>> ExerciseList = await getExerciseMapList();

  final List<ExerciseModel> exercise = [];

  ExerciseList.forEach((element) {
    exercise.add(ExerciseModel.fromMap(element));
  });
  return exercise;
}

Future<int> insertPlaylist(PlayListModel playListModel)async{
  Database? database = await this.database;
  final int result  = await database!.insert('playlist', playListModel.toMap());

  return result;
}

Future<int> insertExercise(ExerciseModel exerciseModel)async{
  Database? database = await this.database;
  final int result  = await database!.insert('exercise', exerciseModel.toMap());

  return result;
}


/*insertData(table,data) async{
  var connection = await database ;
  return await connection.insert(table, data);
}*/
}