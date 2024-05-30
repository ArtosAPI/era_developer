class Article {
  Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.read = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  bool read;
  final String? description;
}
