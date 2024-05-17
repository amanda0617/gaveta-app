import 'dart:convert';

class NewsModel {
  final int? id;
  final String? image;
  final String? link;
  final String? title;
  final String? description;
  NewsModel({
    this.id,
    this.image,
    this.link,
    this.title,
    this.description,
  });

  NewsModel copyWith({
    int? id,
    String? image,
    String? link,
    String? title,
    String? description,
  }) {
    return NewsModel(
      id: id ?? this.id,
      image: image ?? this.image,
      link: link ?? this.link,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_noticia': id,
      'img_noticia': image,
      'link_noticia': link,
      'titulo_noticia': title,
      'texto_noticia': description,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id_noticia'] != null ? map['id_noticia'] as int : null,
      image: map['img_noticia'] != null ? map['img_noticia'] as String : null,
      link: map['link_noticia'] != null ? map['link_noticia'] as String : null,
      title: map['titulo_noticia'] != null
          ? map['titulo_noticia'] as String
          : null,
      description:
          map['texto_noticia'] != null ? map['texto_noticia'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsModel(id: $id, image: $image, link: $link, title: $title, description: $description)';
  }

  @override
  bool operator ==(covariant NewsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.link == link &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        link.hashCode ^
        title.hashCode ^
        description.hashCode;
  }
}
