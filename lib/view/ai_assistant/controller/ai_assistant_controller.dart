import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiAssistantController extends GetxController {
  final fnSearch = FocusNode();
  final tecSearch = TextEditingController();
  final tecMessage = TextEditingController();

  final ScrollController scrollController = ScrollController();
}
