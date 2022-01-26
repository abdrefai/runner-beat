class PlayListModel{
  int? id ;
  String? name;

  PlayListModel({
    this.name
});
  PlayListModel.withid({
    this.id,
    this.name
  });

  Map<String,dynamic> toMap(){
    final map = Map<String,dynamic>();
    if(id != null){
      map['id']= id;
    }

    map['name'] = name;

    return map;
  }

  factory PlayListModel.fromMap(Map<String,dynamic> map){
     return PlayListModel.withid(
       id: map['id'],
       name: map['name']
     );

  }
}