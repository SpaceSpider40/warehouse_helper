class Note {
  final int id;
  final String title;
  final String part;
  final String warehouse;
  final String img;

  const Note(
      {required this.id,
      required this.title,
      required this.part,
      required this.warehouse,
      required this.img});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'part': part,
      'warehouse': warehouse,
      'img': img
    };
  }

  @override
  String toString() {
    return 'Note:{id:$id, title:$title, part:$part, warehouse:$warehouse, img:$img}';
  }
}
