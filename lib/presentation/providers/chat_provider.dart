
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_anwser.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnwser getYesNoAnwser = GetYesNoAnwser();

  List<Message> messages = [
    Message(text: 'Hola amor!', fromWho: FromWho.mine),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.mine),
  ];

  Future<void> herReply() async {
    final herMessage = await getYesNoAnwser.getAnwser();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }


  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messages.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();

  }

  void moveScrollToBottom() async {
     await Future.delayed(const Duration(milliseconds: 100));
    
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
  
}