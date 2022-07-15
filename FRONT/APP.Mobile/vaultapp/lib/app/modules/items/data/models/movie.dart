import 'package:vaultapp/app/modules/items/data/models/item.dart';

class Movie extends Item {
  Movie(
    {super.id,
    required super.label,
    required super.type,
    required super.releaseDate, 
    super.support,
    super.imageURL,
    required this.director,
    required this.editor});

  final String director;
  final String editor;

  factory Movie.fromJson(Map<String, dynamic> json) {
    String? id = json['id'];
    String label = json['label'];
    String type = json['type'];
    String? support = json['support'];
    String? imageURL = json['imageURL'];
    String director = json['director'];
    String editor = json['editor'];

    DateTime releaseDate = DateTime.parse(json['releaseDate']);
    return Movie(
        id: id,
        label: label,
        type: type,
        releaseDate: releaseDate,
        support: support,
        imageURL: imageURL,
        director: director,
        editor: editor);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'type': type,
      'releaseDate': releaseDate.toIso8601String(),
      'support': support,
      'imageURL': imageURL,
      'director': director,
      'editor': editor
    };
  }
}