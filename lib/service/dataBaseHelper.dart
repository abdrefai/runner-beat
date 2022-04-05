

import 'dart:math';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:runner_beat/models/Playlist.dart';
import 'package:runner_beat/models/exercise.dart';
import 'package:runner_beat/models/song.dart';
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
   await database.execute("CREATE TABLE playlist(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,exerciseid INTEGER)");
   await database.execute("CREATE TABLE exercise(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,description TEXT)");
   await database.execute("CREATE TABLE song(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,path TEXT,playlistid INTEGER)");
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

Future<List<Map<String,dynamic>>> getPlaylistByIdMapList(int id) async{
  Database? database = await this.database;
  final List<Map<String,dynamic>> result = await database!.query("playlist",where: "exerciseid=?",whereArgs: [id]);
  return result;
}


Future<List<PlayListModel>> getPlaylistsById(int id)async{
  final List<Map<String,dynamic>> PlaylistList = await getPlaylistByIdMapList(id);

  final List<PlayListModel> playlist = [];

  PlaylistList.forEach((element) {
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



Future<List<Map<String,dynamic>>> getSongByIdMapList(int id) async{
  Database? database = await this.database;
  final List<Map<String,dynamic>> result = await database!.query("song", where: "playlistid=?",
      whereArgs: [id]);
  return result;
}

Future<List<Map<String,dynamic>>> getSongMapList(int id) async{
  Database? database = await this.database;
  final List<Map<String,dynamic>> result = await database!.query("song");
  return result;
}
Future<List<SongModel>> getSong(int id)async{
  final List<Map<String,dynamic>> SongList = await getSongMapList(id);

  final List<SongModel> song = [];

  SongList.forEach((element) {
    song.add(SongModel.fromMap(element));
  });
  return song;
}

Future<List<SongModel>> getSongById(int id)async{
  final List<Map<String,dynamic>> SongList = await getSongByIdMapList(id);

  final List<SongModel> song = [];

  SongList.forEach((element) {
    song.add(SongModel.fromMap(element));
  });
  return song;
}

Future<int> getSongByIdlength(int id)async{
  final List<Map<String,dynamic>> SongList = await getSongByIdMapList(id);

  final List<SongModel> song = [];

  SongList.forEach((element) {
    song.add(SongModel.fromMap(element));
  });
  return song.length;
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

Future<int> insertSong(SongModel songModel)async{
  Database? database = await this.database;
  final int result  = await database!.insert('song', songModel.toMap());

  return result;
}

Future<int> updatePlaylist(PlayListModel playListModel,int id)async{
  Database? database = await this.database;
  final int result  = await database!.update('playlist',
   playListModel.toMap(),
   where: "id=?",
   whereArgs: [id]);

  return result;
}

Future<int> updateExercise(ExerciseModel exerciseModel,int id)async{
  Database? database = await this.database;
  final int result  = await database!.update('exercise',
      exerciseModel.toMap(),
      where: "id=?",
      whereArgs: [id]);

  return result;
}

Future<int> updateSong(SongModel songModel,int id)async{
  Database? database = await this.database;
  final int result  = await database!.update('song',
      songModel.toMap(),
      where: "id=?",
      whereArgs: [id]);

  return result;
}

Future<int> deletePlaylist(int id)async{
  Database? database = await this.database;
  final int result  = await database!.delete('playlist',
   where: "id=?",
   whereArgs: [id]);

  return result;
}

Future<int> deleteExercise(int id)async{
  Database? database = await this.database;
  final int result  = await database!.delete('exercise',
      where: "id=?",
      whereArgs: [id]);

  return result;
}

Future<int> deleteSong(int id)async{
  Database? database = await this.database;
  final int result  = await database!.delete('song',
      where: "id=?",
      whereArgs: [id]);

  return result;
}


}