class PlayListModel{
  int? id ;
  String? name;
  int? exerciseid ;
  PlayListModel({
    this.name,
    this.exerciseid
});
  PlayListModel.withid({
    this.id,
    this.name,
    this.exerciseid
  });

  Map<String,dynamic> toMap(){
    final map = Map<String,dynamic>();
    if(id != null){
      map['id']= id;
    }

    map['name'] = name;
    map['exerciseid'] = exerciseid;

    return map;
  }

  factory PlayListModel.fromMap(Map<String,dynamic> map){
     return PlayListModel.withid(
       id: map['id'],
       name: map['name'],
         exerciseid: map['exerciseid']
     );

  }
}