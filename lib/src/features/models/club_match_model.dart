// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class ClubMatchModel {
  int? id;
  String? name;
  String? state;
  int? score;
  String? icon;
  bool? won;
  ClubMatchModel({
    this.id,
    this.name,
    this.state,
    this.score,
    this.icon,
    this.won,
  });

  ClubMatchModel copyWith({
    int? id,
    String? name,
    String? state,
    int? score,
    String? icon,
    bool? won,
  }) {
    return ClubMatchModel(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      score: score ?? this.score,
      icon: icon ?? this.icon,
      won: won ?? this.won,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'state': state,
      'score': score,
      'icon': icon,
      'won': won,
    };
  }

  factory ClubMatchModel.fromMap(Map<String, dynamic> map) {
    return ClubMatchModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      score: map['score'] != null ? map['score'] as int : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      won: map['won'] != null ? map['won'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClubMatchModel.fromJson(String source) => ClubMatchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClubMatchModel(id: $id, name: $name, state: $state, score: $score, icon: $icon, won: $won)';
  }

  @override
  bool operator ==(covariant ClubMatchModel other) {
    if (identical(this, other)) return true;

    return
      other.id == id &&
      other.name == name &&
      other.state == state &&
      other.score == score &&
      other.icon == icon &&
      other.won == won;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      state.hashCode ^
      score.hashCode ^
      icon.hashCode ^
      won.hashCode;
  }
}
