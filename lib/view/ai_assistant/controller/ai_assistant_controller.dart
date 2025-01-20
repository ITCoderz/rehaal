import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiAssistantController extends GetxController {
  final tecMessage = TextEditingController();

  final ScrollController scrollController = ScrollController();

  RxList<Map<String, Object?>> messages = <Map<String, Object?>>[].obs;

  void sendMessage(String userMessage) {
    if (userMessage.trim().isEmpty) return;

    messages.add({'text': userMessage, 'isMe': true});
    scrollToBottom();

    Future.delayed(const Duration(milliseconds: 500), () {
      String aiResponse = getAIResponse(userMessage);
      messages.add({'text': aiResponse, 'isMe': false});
      scrollToBottom();
    });

    tecMessage.clear();
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  String getAIResponse(String userMessage) {
    if (userMessage.toLowerCase().contains('restaurant')) {
      return 'Are you looking for Italian, Chinese, or something else?';
    } else if (userMessage.toLowerCase().contains('breakfast')) {
      return 'How about a nice café with pancakes and coffee?';
    } else {
      return 'Could you provide more details?';
    }
  }
}
