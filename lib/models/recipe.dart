class Recipe {
  final String title;
  final String description;
  final String assetUrl;

  const Recipe({
    required this.title,
    required this.description,
    required this.assetUrl,
  });

  factory Recipe.fromDocument(Map<String, dynamic> map) {
    return Recipe(
      title: map['title'],
      description: map['description'],
      assetUrl: map['assetUrl'],
    );
  }
}
