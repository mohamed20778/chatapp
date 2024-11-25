part of 'chat_cubit.dart';

@immutable
sealed class ChatCubitState {}

final class ChatCubitInitial extends ChatCubitState {}

// ignore: must_be_immutable
final class ChatSuccess extends ChatCubitState {
  List<Message> messages;

  ChatSuccess({required this.messages});
}
