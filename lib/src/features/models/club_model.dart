// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'club_status_model.dart';
import 'player_model.dart';

class ClubModel {
  int? id;
  String? name;
  String? state;
  String? icon;
  ClubStatusModel? status;
  List<PlayerModel>? players;
  ClubModel({
    this.id,
    this.name,
    this.state,
    this.icon,
    this.status,
    required this.players,
  });

  ClubModel copyWith({
    int? id,
    String? name,
    String? state,
    String? icon,
    ClubStatusModel? status,
    List<PlayerModel>? players,
  }) {
    return ClubModel(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      icon: icon ?? this.icon,
      status: status ?? this.status,
      players: players ?? this.players,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'state': state,
      'icon': icon,
      'status': status?.toMap(),
      'players':
          players != null ? players!.map((x) => x.toMap()).toList() : null,
    };
  }

  factory ClubModel.fromMap(Map<String, dynamic> map) {
    return ClubModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      status: map['status'] != null
          ? ClubStatusModel.fromMap(map['status'] as Map<String, dynamic>)
          : null,
      players: map['players'] != null
          ? List<PlayerModel>.from(
              (map['players'] as List<Map<String, dynamic>>).map<PlayerModel?>(
                (x) => PlayerModel.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClubModel.fromJson(String source) =>
      ClubModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClubModel(id: $id, name: $name, state: $state, icon: $icon, status: $status, players: $players)';
  }

  @override
  bool operator ==(covariant ClubModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.state == state &&
        other.icon == icon &&
        other.status == status &&
        listEquals(other.players, players);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        state.hashCode ^
        icon.hashCode ^
        status.hashCode ^
        players.hashCode;
  }
}
