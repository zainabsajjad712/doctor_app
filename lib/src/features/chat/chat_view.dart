import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import 'chat_controller.dart';
import 'message_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(child: _buildMessageList(controller, size)),
            _buildInputArea(controller, context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF2563EB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Container(
                width: 44,
                height: 44,
                color: const Color(0xFFE8EFF9),
                child: Icon(
                  Icons.person,
                  color: AppColor.primaryButton,
                  size: 28,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dr. Anthony',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: const BoxDecoration(
                        color: Color(0xFF4ADE80),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Text(
                      'Online',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(ChatController controller, Size size) {
    return Obx(
      () => ListView.builder(
        controller: controller.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: controller.messages.length,
        itemBuilder: (context, index) {
          final message = controller.messages[index];
          return _buildMessageBubble(message, size);
        },
      ),
    );
  }

  Widget _buildMessageBubble(MessageModel message, Size size) {
    return Align(
      alignment: message.isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: size.width * 0.72),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: message.isSent
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: message.imagePath != null
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: message.isSent ? const Color(0xFF2563EB) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(message.isSent ? 18 : 4),
                  bottomRight: Radius.circular(message.isSent ? 4 : 18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: message.imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(18),
                        topRight: const Radius.circular(18),
                        bottomLeft: Radius.circular(message.isSent ? 18 : 4),
                        bottomRight: Radius.circular(message.isSent ? 4 : 18),
                      ),
                      child: Image.file(
                        File(message.imagePath!),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Text(
                      message.text ?? '',
                      style: TextStyle(
                        color: message.isSent
                            ? Colors.white
                            : const Color(0xFF1E293B),
                        fontSize: 14.5,
                        height: 1.4,
                      ),
                    ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.time,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 11,
                  ),
                ),
                if (message.isSent) ...[
                  const SizedBox(width: 4),
                  Icon(
                    message.isRead ? Icons.done_all : Icons.done,
                    size: 14,
                    color: message.isRead
                        ? const Color(0xFF2563EB)
                        : const Color(0xFF94A3B8),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea(ChatController controller, BuildContext context) {
    return Container(
      color: const Color(0xFFF0F4FF),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 10 : 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: controller.messageController,
                      style: const TextStyle(fontSize: 14.5),
                      decoration: const InputDecoration(
                        hintText: 'Write message...',
                        hintStyle: TextStyle(
                          color: Color(0xFFB0BEC5),
                          fontSize: 14.5,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      onSubmitted: (_) => controller.sendMessage(),
                      textInputAction: TextInputAction.send,
                    ),
                  ),
                  // Image attachment button
                  IconButton(
                    onPressed: () => _showImageOptions(controller, context),
                    icon: const Icon(
                      Icons.attach_file,
                      color: Color(0xFF94A3B8),
                      size: 22,
                    ),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: controller.sendMessage,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFF2563EB),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x332563EB),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showImageOptions(ChatController controller, BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFEEF2FF),
                child: Icon(Icons.photo_library, color: Color(0xFF2563EB)),
              ),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Get.back();
                controller.pickImage();
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFEEF2FF),
                child: Icon(Icons.camera_alt, color: Color(0xFF2563EB)),
              ),
              title: const Text('Take a Photo'),
              onTap: () {
                Get.back();
                controller.pickCamera();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
