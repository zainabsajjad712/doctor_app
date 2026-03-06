class MessageModel {
  final String? text;
  final bool isSent;
  final String time;
  final bool isRead;
  final String? imagePath;

  MessageModel({
    this.text,
    required this.isSent,
    required this.time,
    this.isRead = false,
    this.imagePath,
  });
}
