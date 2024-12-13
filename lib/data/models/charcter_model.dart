class CharacterModel {
   int? charId;
   String? name;
   String? nickName;
   String? image;
   List<dynamic>? jobs;
   String? statusIfDeadOrAlive;
   String? gender;
   String? species;
   String? created;
   String? url;


  CharacterModel.fromJson(Map<String, dynamic> json) {
    charId = json["id"];
    name = json["name"];
    nickName = json["nickname"];
    image = json["image"];
    jobs = json["occupation"];
    statusIfDeadOrAlive = json["status"];
    gender = json["gender"];
    species = json["species"];
    created = json["created"];
    url = json["url"];

  }
}