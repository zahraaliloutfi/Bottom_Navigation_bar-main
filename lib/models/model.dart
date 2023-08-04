class Model {
  final id;
  final title;
  final image;
  final creadedAt;
  Model({
    this.creadedAt,
    this.id,
    this.image,
    this.title,
  });
  factory Model.fromMap(Map<String, dynamic> json) => Model(
        id: json['id'],
        image: json['image'],
        title: json['title'],
        creadedAt: json['creadedAt'] == null
            ? null
            : DateTime.parse(
                json['creadedAt'],
              ),
      );
}
