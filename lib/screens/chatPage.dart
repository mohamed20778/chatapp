import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/cubits/chat_/cubit/chat_cubit.dart';
import 'package:scholar_chat/models/messageModel.dart';
import 'package:scholar_chat/reusable-component/chatBubble.dart';

class chatPage extends StatefulWidget {
  static String id = 'chatPage';

  chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  List<Message> messageList = [];
  var chatController = TextEditingController();
  var scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    // ignore: unused_local_variable
    String? userMessage;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              width: 50,
              height: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Chat',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatCubitCubit, ChatCubitState>(
                listener: (context, state) {
                  if (state is ChatSuccess) {
                    messageList = state.messages;
                  }
                },
                builder: (context, state) {
                  return ListView.builder(
                      padding: EdgeInsets.all(5),
                      reverse: true,
                      controller: scrollController,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return messageList[index].id == email
                            ? chatbubble(
                                message: messageList[index],
                              )
                            : chatbubbleforfriend(message: messageList[index]);
                      });
                },
              ),
            ),
            TextFormField(
              controller: chatController,
              onFieldSubmitted: (data) {
                BlocProvider.of<ChatCubitCubit>(context)
                    .sendMessage(message: data, email: email.toString());
              },
              onChanged: (data) {
                userMessage = data;
              },
              decoration: InputDecoration(
                  label: Text('Send Message'),
                  suffixIcon: IconButton(
                    onPressed: () {
                      chatController.clear();
                      scrollController.jumpTo(0);
                    },
                    icon: Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ],
        ),
      ),
    );
  }
}
  


//ال snapshot بتاعت الbuilder دي الحاجه الى بتحتوى البيانات
//ال future حاجه بنستخدمها عشان نجيب البيانات
//بما بنخلى سطر الfuture يعمل get بس من غيري الdocument كده نوع البيانات الى هترجع هتتغير وهتبقا querysnapshot