class  SongModel{
  int? id ;
  String? name;
  String? path;
  int? playlistId ;
  SongModel({
    this.name,
    this.path,
    this.playlistId
  });
  SongModel.withid({
    this.id,
    this.name,
    this.path,
    this.playlistId
  });

  Map<String,dynamic> toMap(){
    final map = Map<String,dynamic>();
    if(id != null){
      map['id']= id;
    }

    map['name'] = name;
    map['path'] = path;
    map['playlistId'] = playlistId;
    return map;
  }

  factory SongModel.fromMap(Map<String,dynamic> map){
    return SongModel.withid(
        id: map['id'],
        name: map['name'],
        path: map['path'],
        playlistId: map['playlistId']
    );

  }
}