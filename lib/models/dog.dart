class Dog {
  final String imageUrl;

  Dog({
    required this.imageUrl,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    if (json['message'] is String) {
      return Dog(
        imageUrl: json['message'],
      );
    } else {
      throw const FormatException('Erro ao obter cachorro!');
    }
  }
}