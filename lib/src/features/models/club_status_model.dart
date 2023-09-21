// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';


class ClubStatusModel {
  String? name;
  String? icon;
  int? place;
  int? pts;
  int? pj;
  int? vit;
  int? e;
  int? der;
  int? gm;
  int? gc;
  int? sg;
  List<bool>? lasts;
  ClubStatusModel({
    this.name,
    this.icon,
    this.place,
    this.pts,
    this.pj,
    this.vit,
    this.e,
    this.der,
    this.gm,
    this.gc,
    this.sg,
    this.lasts,
  });


  ClubStatusModel copyWith({
    String? name,
    String? icon,
    int? place,
    int? pts,
    int? pj,
    int? vit,
    int? e,
    int? der,
    int? gm,
    int? gc,
    int? sg,
    List<bool>? lasts,
  }) {
    return ClubStatusModel(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      place: place ?? this.place,
      pts: pts ?? this.pts,
      pj: pj ?? this.pj,
      vit: vit ?? this.vit,
      e: e ?? this.e,
      der: der ?? this.der,
      gm: gm ?? this.gm,
      gc: gc ?? this.gc,
      sg: sg ?? this.sg,
      lasts: lasts ?? this.lasts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon,
      'place': place,
      'pts': pts,
      'pj': pj,
      'vit': vit,
      'e': e,
      'der': der,
      'gm': gm,
      'gc': gc,
      'sg': sg,
      'lasts': lasts,
    };
  }

  factory ClubStatusModel.fromMap(Map<String, dynamic> map) {
    return ClubStatusModel(
      name: map['name'] != null ? map['name'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      place: map['place'] != null ? map['place'] as int : null,
      pts: map['pts'] != null ? map['pts'] as int : null,
      pj: map['pj'] != null ? map['pj'] as int : null,
      vit: map['vit'] != null ? map['vit'] as int : null,
      e: map['e'] != null ? map['e'] as int : null,
      der: map['der'] != null ? map['der'] as int : null,
      gm: map['gm'] != null ? map['gm'] as int : null,
      gc: map['gc'] != null ? map['gc'] as int : null,
      sg: map['sg'] != null ? map['sg'] as int : null,
      lasts: map['lasts'] != null ? List<bool>.from((map['lasts'] as List<bool>)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClubStatusModel.fromJson(String source) => ClubStatusModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClubStatusModel(name: $name, icon: $icon, place: $place, pts: $pts, pj: $pj, vit: $vit, e: $e, der: $der, gm: $gm, gc: $gc, sg: $sg, lasts: $lasts)';
  }

  @override
  bool operator ==(covariant ClubStatusModel other) {
    if (identical(this, other)) return true;

    return
      other.name == name &&
      other.icon == icon &&
      other.place == place &&
      other.pts == pts &&
      other.pj == pj &&
      other.vit == vit &&
      other.e == e &&
      other.der == der &&
      other.gm == gm &&
      other.gc == gc &&
      other.sg == sg &&
      listEquals(other.lasts, lasts);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      icon.hashCode ^
      place.hashCode ^
      pts.hashCode ^
      pj.hashCode ^
      vit.hashCode ^
      e.hashCode ^
      der.hashCode ^
      gm.hashCode ^
      gc.hashCode ^
      sg.hashCode ^
      lasts.hashCode;
  }
}
