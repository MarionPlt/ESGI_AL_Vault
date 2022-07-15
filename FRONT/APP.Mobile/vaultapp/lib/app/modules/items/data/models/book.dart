import 'package:vaultapp/app/modules/items/data/models/item.dart';

class Book extends Item {
  Book(
      {super.id,
      required super.label,
      required super.type,
      required super.releaseDate, 
      super.support,
      super.imageURL,
      required this.editor,
      required this.authors,
      this.volume});

  final String editor;
  final String authors;
  final int? volume;

  factory Book.fromJson(Map<String, dynamic> json) {
    String? id = json['id'];
    String label = json['label'];
    String type = json['type'];
    String? support = json['support'];
    String? imageURL = json['imageURL'];
    String editor = json['editor'];
    String authors = json['authors'];
    int? volume = json['volume'];

    DateTime releaseDate = DateTime.parse(json['releaseDate']);
    return Book(
        id: id,
        label: label,
        type: type,
        releaseDate: releaseDate,
        support: support,
        imageURL: imageURL,
        editor: editor,
        authors: authors,
        volume: volume);
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
      'editor': editor,
      'authors': authors,
      'volume': volume
    };
  }
}
