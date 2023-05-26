// To parse this JSON data, do
//
//     final creditsReesponse = creditsReesponseFromMap(jsonString);

import 'dart:convert';

class CreditsReesponse {
    int id;
    List<Cast> cast;
    List<Cast> crew;

    CreditsReesponse({
        required this.id,
        required this.cast,
        required this.crew,
    });

    factory CreditsReesponse.fromJson(String str) => CreditsReesponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CreditsReesponse.fromMap(Map<String, dynamic> json) => CreditsReesponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
        "crew": List<dynamic>.from(crew.map((x) => x.toMap())),
    };
}

class Cast {
    bool adult;
    int gender;
    int id;
    String knownForDepartment;
    String name;
    String originalName;
    double popularity;
    String? profilePath;
    int? castId;
    String? character;
    String creditId;
    int? order;
    String? department;
    String? job;  

    get fullprofilePath{
        if(profilePath !=  null){
              return 'https://image.tmdb.org/t/p/w500$profilePath';
          }
          return 'https://via.placeholder.com/150x300';
    }

    Cast({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        required this.creditId,
        this.order,
        this.department,
        this.job,
    });

    factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
    };
}
