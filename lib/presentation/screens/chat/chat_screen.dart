import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

import '../../widgets/chat/her_message_bubble.dart';

void main() => runApp(const ChatScreen());

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
          backgroundImage: NetworkImage('https://i.namu.wiki/i/oWoB2ySFz7tsEH86rs2IG-xFRcETLQV_1s2HNf9_asUEivmigOvQB4FCg1AJGIoAWBtWLZVnFU6_Fhgm5QXefl0fQP41YtsfmGd2nAfgvornbtXnnYLqmCbiqiGzsZNT4BlCBAHHno-bHX0TBcwTNSP0f3lZvEp3-Fi1tN7mXbA.webp'),
          ),
        ),
        title: const Text('Chat Screen'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return  (index % 2 == 0) ? const MyMessageBubble() : const HerMessageBubble();
              },
            )),
            MessageFieldBox(),
          ],
        ),
      ),
    );

  }
}
