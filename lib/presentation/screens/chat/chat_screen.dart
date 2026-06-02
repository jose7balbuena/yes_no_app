import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_anwser.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.wallpapersden.com/image/download/megan-fox-hd-wallpapers_amVpbGuUmZqaraWkpJRnamtlrWZtbWc.jpg'),
          ),
        ),
        title: const Text('Chat Screen'),
      ),
      body: _ChatView(),
    );
  }
}


/// Este widget se encarga de mostrar la vista del chat, es decir, la lista de mensajes y el campo de texto para enviar nuevos mensajes.
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder( 
                  controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];
                
                return (message.fromWho == FromWho.other)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),
             MessageFieldBox(
              onValue:  chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
