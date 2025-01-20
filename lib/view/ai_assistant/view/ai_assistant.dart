import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rehaal/components/custom_text_form_field.dart';
import 'package:rehaal/utils/app_icons.dart';
import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/ai_assistant/components/chat_message_tile.dart';
import 'package:rehaal/view/ai_assistant/controller/ai_assistant_controller.dart';

class AiAssistant extends StatelessWidget {
  const AiAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AiAssistantController>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.chatBg), fit: BoxFit.fill)),
        child: Column(
          children: [
            verticalSpace(50),
            Container(
              width: 125.w,
              height: 125.h,
              decoration: BoxDecoration(
                  color: Color(0xffF9FDFC),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        color: AppTheme.blackColor.withOpacity(0.1))
                  ],
                  border: Border.all(
                    color: AppTheme.whiteColor,
                    width: 2,
                  )),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: AppTheme.purpleColor,
                  size: 50,
                ),
              ),
            ),
            verticalSpace(10),
            AppText(
              text: 'AI Assistant',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppTheme.darkPurple,
            ),
            verticalSpace(30),
            Container(
              width: 70.w,
              height: 28.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppTheme.chatColor),
              child: Center(
                child: AppText(
                  text: 'Today',
                  fontSize: 12.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            verticalSpace(30),
            Expanded(
              child: Obx(() => ListView.builder(
                    reverse: false,
                    controller: controller.scrollController,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller.messages[index];
                      return ChatMessage(
                        text: message['text'] as String,
                        isMe: message['isMe'] as bool,
                        lastMessageStatus: 'seen',
                        showStatus: false,
                      );
                    },
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ChatFieldWidget(
                        hintText: "Type Message",
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: controller.tecMessage,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        controller.sendMessage(controller.tecMessage.text);
                      },
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Icon(
                          Icons.send,
                          color: AppTheme.darkPurple,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
