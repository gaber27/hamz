class Article {
  final String title;
  final String slugName;
  final String url;
  final String imageUrl;

  Article({
    required this.title,
    required this.slugName,
    required this.url,
    required this.imageUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    // Extract the multimedia array from the JSON data
    final List<dynamic> multimedia = json['multimedia'] ?? [];

    // Find the first item in the multimedia array with a non-null and non-empty URL
    final multimediaWithUrl = multimedia.firstWhere(
          (element) => element['url'] != null && element['url'].isNotEmpty,
      orElse: () => null,
    );

    // Extract the image URL from the multimedia item if available
    final imageUrl = multimediaWithUrl != null ? multimediaWithUrl['url'] : '';

    return Article(
      title: json['title'] ?? '',
      slugName: json['slug_name'] ?? '',
      url: json['url'] ?? '',
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'slug_name': slugName,
      'url': url,
      'imageUrl': imageUrl,
    };
  }
}
