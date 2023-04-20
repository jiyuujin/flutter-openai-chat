import 'package:dio/dio.dart';

String OPENAI_CHAT_COMPLETIONS_API =
    'https://api.openai.com/v1/chat/completions';
String OPENAI_API_KEY = 'OPENAI_API_KEY';

UseChatGPT useChatGPT() {
  Future<String> requestChatGPT(List<Map<String, String>> messages) async {
    Dio dio = Dio();
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $OPENAI_API_KEY'
    };

    Response response = await dio.post(
      OPENAI_CHAT_COMPLETIONS_API,
      data: {
        'model': 'gpt-3.5-turbo',
        'messages': messages,
      },
    );

    String result = response.data['choices'][0]['message']['content'];
    return result;
  }

  return UseChatGPT(requestChatGPT: requestChatGPT);
}

class UseChatGPT {
  final Future<String> Function(List<Map<String, String>> messages)
      requestChatGPT;
  UseChatGPT({required this.requestChatGPT});
}
