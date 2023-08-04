import 'package:dio/dio.dart';
import 'package:social_app/models/success_stories.dart.dart';

class ApiProvider {
  final apiUrl = 'http://159.89.4.181:2000/api/v1';
  SuccessStories? successStories;

  Future<SuccessStories?> getStories() async {
    try {
      var response = await Dio().get('$apiUrl/success-stories');
      print(response.data);
      successStories = SuccessStories.fromMap(response.data);
      return successStories;
    } catch (e) {
      print('errrrooooeeee is $e');
    }
    return null;
  }

  // void getHello() async {
  //   try {
  //     Response response = await Dio().get('$apiUrl/success-stories');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void getHi() async {
  //   try {
  //     Response response = await Dio().get('$apiUrl/success-stories');
  //     print(response.data);
  //     print(response.statusCode);
  //     print('--------------------');
  //     print(response.data['model'][0]['title']);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
