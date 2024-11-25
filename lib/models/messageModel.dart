import 'package:scholar_chat/constants.dart';

class Message
{
  final String message;
  final String id;
  Message(this.message, this.id);
  
  factory Message.fromJson(jsondata)
  {
    return Message(jsondata[kMessages],jsondata['id']);
}
}
