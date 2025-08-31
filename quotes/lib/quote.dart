class Quote {
  final String text;
  final String author;
  final String category;
  final DateTime createdAt;

  Quote({
    required this.text,
    required this.author,
    this.category = 'General',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
