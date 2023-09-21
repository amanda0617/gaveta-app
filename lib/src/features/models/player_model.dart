// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class PlayerModel {
  int? id;
  String? name;
  String? position;
  int? age;
  String? about;
  String? club;
  String? image;
  PlayerModel({
    this.id,
    this.name,
    this.position,
    this.age,
    this.about,
    this.club,
    this.image,
  });

  PlayerModel copyWith({
    int? id,
    String? name,
    String? position,
    int? age,
    String? about,
    String? club,
    String? image,
  }) {
    return PlayerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
      age: age ?? this.age,
      about: about ?? this.about,
      club: club ?? this.club,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'position': position,
      'age': age,
      'about': about,
      'club': club,
      'image': image,
    };
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      position: map['position'] != null ? map['position'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      about: map['about'] != null ? map['about'] as String : null,
      club: map['club'] != null ? map['club'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerModel.fromJson(String source) => PlayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlayerModel(id: $id, name: $name, position: $position, age: $age, about: $about, club: $club, image: $image)';
  }

  @override
  bool operator ==(covariant PlayerModel other) {
    if (identical(this, other)) return true;

    return
      other.id == id &&
      other.name == name &&
      other.position == position &&
      other.age == age &&
      other.about == about &&
      other.club == club &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      position.hashCode ^
      age.hashCode ^
      about.hashCode ^
      club.hashCode ^
      image.hashCode;
  }
}
