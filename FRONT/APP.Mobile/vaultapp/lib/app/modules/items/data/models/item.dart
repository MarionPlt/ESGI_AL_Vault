class Item {
  Item(
      {this.id,
      required this.label,
      required this.type,
      required this.releaseDate,
      this.support,
      this.imageURL});

  String? id;
  final String label;
  final String type;
  final DateTime releaseDate;
  final String? support;
  final String? imageURL;

  factory Item.fromJson(Map<String, dynamic> json) {
    String? id = json['id'];
    String label = json['label'];
    String type = json['type'];
    String? support = json['support'];
    String? imageURL = json['imageURL'];

    DateTime releaseDate = DateTime.parse(json['releaseDate']);

    return Item(
        id: id,
        label: label,
        type: type,
        releaseDate: releaseDate,
        support: support,
        imageURL: imageURL);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'type': type,
      'releaseDate': releaseDate.toIso8601String(),
      'support': support,
      'imageURL': imageURL
    };
  }
}
