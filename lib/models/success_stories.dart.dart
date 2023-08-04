import 'model.dart';

class SuccessStories {
  final success;
  final message;
  final model;
  final statueCode;

  SuccessStories({
    this.message,
    this.model,
    this.statueCode,
    this.success,
  });
  factory SuccessStories.fromMap(Map<String, dynamic> json) => SuccessStories(
        message: json['message'],
        success: json['success'],
        statueCode: json['statusCode'],
        model: json['model'] == null
            ? null
            : List<Model>.from(
                json['model'].map(
                  (x) => Model.fromMap(x),
                ),
              ),
      );
}
