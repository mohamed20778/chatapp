import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/messageModel.dart';

part 'chat_state.dart';

class ChatCubitCubit extends Cubit<ChatCubitState> {
  ChatCubitCubit() : super(ChatCubitInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessages);
  // List<Message> messagesList = [];
  void sendMessage({required String message, required String email}) {
    try {
      messages.add({
        'message': message,
        kCreatedAt: DateTime.now(),
        'id': email,
      });
    } on Exception {}
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messagesList = [];
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
