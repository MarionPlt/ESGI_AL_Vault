class Book {
  Book(
      {this.id,
      required this.title,
      required this.author,
      required this.aquisitionDate,
      required this.parutionDate,
      this.imagePath,
      required this.state});

  int? id;
  final String title;
  final String author;
  final String aquisitionDate;
  final String parutionDate;
  String? imagePath;
  final String state;

  factory Book.fromJson(Map<String, dynamic> json) {
    int? id = json['id'];
    String title = json['title'];
    String author = json['author'];
    String aquisitionDate = json['aquisitionDate'];
    String parutionDate = json['parutionDate'];
    String? imagePath = json['imagePath'];
    String state = json['state'];

    DateTime date = DateTime.fromMillisecondsSinceEpoch(json['date']);
    return Book(
        id: id,
        title: title,
        author: author,
        aquisitionDate: aquisitionDate,
        parutionDate: parutionDate,
        imagePath: imagePath,
        state: state);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'aquisitionDate': aquisitionDate,
      'parutionDate': parutionDate,
      'imagePath': imagePath,
      'state': state
    };
  }
}
