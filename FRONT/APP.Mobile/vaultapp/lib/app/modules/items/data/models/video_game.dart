import 'package:vaultapp/app/modules/items/data/models/item.dart';

class VideoGame extends Item {
  VideoGame(
        {super.id,
        required super.label,
        required super.type,
        required super.releaseDate, 
        super.support,
        super.imageURL,
        required this.platform});
  
  final String platform;

  factory VideoGame.fromJson(Map<String, dynamic> json) {
    String? id = json['id'];
    String label = json['label'];
    String type = json['type'];
    String? support = json['support'];
    String? imageURL = json['imageURL'];
    String platform = json['platform'];
    DateTime releaseDate = DateTime.parse(json['releaseDate']);

    return VideoGame(
        id: id,
        label: label,
        type: type,
        releaseDate: releaseDate,
        support: support,
        imageURL: imageURL,
        platform: platform);
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
      'platform': platform
    };
  }
}