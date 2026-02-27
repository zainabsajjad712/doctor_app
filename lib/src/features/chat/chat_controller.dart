import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'message_model.dart';

class ChatController extends GetxController {
  final RxList<MessageModel> messages = <MessageModel>[].obs;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final RxBool isTyping = false.obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // Add initial messages to simulate the design
    _loadInitialMessages();
  }

  void _loadInitialMessages() {
    messages.addAll([
      MessageModel(
        text: 'Good afternoon, Doc',
        isSent: true,
        time: '11:45 PM',
        isRead: true,
      ),
      MessageModel(
        text: 'Good afternoon too, is there anything I can help you with',
        isSent: false,
        time: '11:48 PM',
      ),
      MessageModel(
        text: 'Yes i want to consult about my illness.',
        isSent: true,
        time: '11:50 PM',
        isRead: true,
      ),
      MessageModel(
        text: 'So want to consult yes, what disease do you have?',
        isSent: false,
        time: '11:55 PM',
      ),
      MessageModel(
        text: 'So these few days i often have stomachache and dizziness.',
        isSent: true,
        time: '11:57 PM',
        isRead: true,
      ),
    ]);
  }

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    messages.add(
      MessageModel(
        text: text,
        isSent: true,
        time: _getCurrentTime(),
        isRead: false,
      ),
    );
    messageController.clear();
    _scrollToBottom();

    // Simulate reply after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      messages.add(
        MessageModel(
          text: 'I understand. I will look into that for you.',
          isSent: false,
          time: _getCurrentTime(),
        ),
      );
      _scrollToBottom();
    });
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (image != null) {
      messages.add(
        MessageModel(
          isSent: true,
          time: _getCurrentTime(),
          isRead: false,
          imagePath: image.path,
        ),
      );
      _scrollToBottom();
    }
  }

  Future<void> pickCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );
    if (image != null) {
      messages.add(
        MessageModel(
          isSent: true,
          time: _getCurrentTime(),
          isRead: false,
          imagePath: image.path,
        ),
      );
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _getCurrentTime() {
    final now = TimeOfDay.now();
    final hour = now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
