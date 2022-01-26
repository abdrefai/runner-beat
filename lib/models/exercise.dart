class ExerciseModel{
  int? id ;
  String? name;
  String? description;

  ExerciseModel({
    this.name,
    this.description
  });
  ExerciseModel.withid({
    this.id,
    this.name,
    this.description
  });

  Map<String,dynamic> toMap(){
    final map = Map<String,dynamic>();
    if(id != null){
      map['id']= id;
    }

    map['name'] = name;
    map['description'] = description;

    return map;
  }

  factory ExerciseModel.fromMap(Map<String,dynamic> map){
    return ExerciseModel.withid(
        id: map['id'],
        name: map['name'],
        description: map['description']
    );

  }
}