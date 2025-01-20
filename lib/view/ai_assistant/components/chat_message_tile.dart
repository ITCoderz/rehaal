import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/text_styles.dart';
import 'package:rehaal/utils/ui_gaps.dart';

import '../../../utils/app_theme.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  //final Timestamp time;
  final String lastMessageStatus;
  final bool showStatus;

  const ChatMessage(
      {super.key,
      required this.text,
      required this.isMe,
      //  required this.time,
      required this.lastMessageStatus,
      required this.showStatus});
  //String _formatTime(Timestamp timestamp) {
  //DateTime dateTime = timestamp.toDate();
  //String formattedTime = DateFormat('h:mm a').format(dateTime);
  //return formattedTime;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                isMe == true ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: isMe == true
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      if (isMe) horizontalSpace(10),
                      ChatBubble(
                          elevation: 0,
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          clipper: isMe
                              ? ChatBubbleClipper5(
                                  type: BubbleType.sendBubble,
                                  radius: 32,
                                )
                              : ChatBubbleClipper5(
                                  type: BubbleType.receiverBubble,
                                  radius: 32,
                                ),
                          margin: EdgeInsets.only(bottom: 20),
                          backGroundColor:
                              isMe ? AppTheme.whiteColor : Color(0xffF8F8F8),
                          child: Container(
                              constraints: BoxConstraints(
                                maxWidth: Get.width * 0.55,
                              ),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 4,
                                    color: isMe
                                        ? AppTheme.blackColor.withOpacity(0.01)
                                        : Color(0xff4735E2).withOpacity(0.005))
                              ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          text: isMe ? 'You' : 'AI Assistant',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: isMe
                                              ? AppTheme.sendUserChatColor
                                              : AppTheme.sendAiChatColor,
                                        ),
                                        AppText(
                                          text: '14:22',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.sendUserChatColor
                                              .withOpacity(0.4),
                                        ),
                                      ],
                                    ),
                                    verticalSpace(10),
                                    Text(text,
                                        style: TextStyles.labelTextStyle
                                            .copyWith(
                                                fontSize: 14.sp,
                                                fontWeight: isMe
                                                    ? FontWeight.w500
                                                    : FontWeight.w500,
                                                color: AppTheme.chatColor)),
                                  ],
                                ),
                              ))),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
