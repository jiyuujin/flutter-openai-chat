import 'package:my_chat_app/utils/constants.dart';

UseSupabase useSupabase() {
  void sendMessage(String myUserId, String message) async {
    await supabase.from('messages').insert({
      'profile_id': myUserId,
      'content': message,
    });
  }

  return UseSupabase(sendMessage: sendMessage);
}

class UseSupabase {
  final void Function(String myUserId, String message) sendMessage;
  UseSupabase({required this.sendMessage});
}
