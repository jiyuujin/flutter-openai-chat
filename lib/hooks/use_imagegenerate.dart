import 'package:dio/dio.dart';

String OPENAI_IMAGE_GENERATIONS_API =
    'https://api.openai.com/v1/images/generations';
String OPENAI_API_KEY = 'OPENAI_API_KEY';

UseImageGeneration useImageGeneration() {
  Future<String> requestImageGeneration(String message) async {
    Dio dio = Dio();
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $OPENAI_API_KEY'
    };

    Response response = await dio.post(
      OPENAI_IMAGE_GENERATIONS_API,
      data: {
        'prompt': message,
        'n': 1,
        'size': '1024x1024',
      },
    );

    String result = response.data['data'][0]['url'];
    return result;
  }

  return UseImageGeneration(requestImageGeneration: requestImageGeneration);
}

class UseImageGeneration {
  final Future<String> Function(String messages) requestImageGeneration;
  UseImageGeneration({required this.requestImageGeneration});
}
