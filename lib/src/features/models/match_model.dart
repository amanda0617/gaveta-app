// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'club_match_model.dart';

class MatchModel {
  ClubMatchModel? home;
  ClubMatchModel? visitant;
  bool? finish;
  String? winner;
  String? date;
  MatchModel({
    this.home,
    this.visitant,
    this.finish,
    this.winner,
    this.date,
  });

  MatchModel copyWith({
    ClubMatchModel? home,
    ClubMatchModel? visitant,
    bool? finish,
    String? winner,
    String? date,
  }) {
    return MatchModel(
      home: home ?? this.home,
      visitant: visitant ?? this.visitant,
      finish: finish ?? this.finish,
      winner: winner ?? this.winner,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'home': home?.toMap(),
      'visitant': visitant?.toMap(),
      'finish': finish,
      'winner': winner,
      'date': date,
    };
  }

  factory MatchModel.fromMap(Map<String, dynamic> map) {
    return MatchModel(
      home: map['home'] != null
          ? ClubMatchModel.fromMap(map['home'] as Map<String, dynamic>)
          : null,
      visitant: map['visitant'] != null
          ? ClubMatchModel.fromMap(map['visitant'] as Map<String, dynamic>)
          : null,
      finish: map['finish'] != null ? map['finish'] as bool : null,
      winner: map['winner'] != null ? map['winner'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MatchModel.fromJson(String source) =>
      MatchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MatchModel(home: $home, visitant: $visitant, finish: $finish, winner: $winner, date: $date)';
  }

  @override
  bool operator ==(covariant MatchModel other) {
    if (identical(this, other)) return true;

    return other.home == home &&
        other.visitant == visitant &&
        other.finish == finish &&
        other.winner == winner &&
        other.date == date;
  }

  @override
  int get hashCode {
    return home.hashCode ^
        visitant.hashCode ^
        finish.hashCode ^
        winner.hashCode ^
        date.hashCode;
  }
}
