// import 'package:flutter/material.dart';
// import 'package:pet_project/src/common/constants/global_variables.dart';
// import 'package:pet_project/src/common/widget/custom_text_field.dart';

// import '../constants/app_colors.dart';
// import '../constants/app_images.dart';

// class CustomComment extends StatefulWidget {
//   final List<Map<String, dynamic>> comments;
//   final Function(int index) onLikeTapped;
//   final Function(String comment) onSendComment;

//   const CustomComment({
//     super.key,
//     required this.comments,
//     required this.onLikeTapped,
//     required this.onSendComment,
//   });

//   @override
//   CustomCommentState createState() => CustomCommentState();
// }

// class CustomCommentState extends State<CustomComment> {
//   final TextEditingController _commentController = TextEditingController();

//   @override
//   void dispose() {
//     _commentController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       expand: false,
//       initialChildSize: 0.7,
//       minChildSize: 0.3,
//       maxChildSize: 1.0,
//       builder: (context, scrollController) {
//         return Scaffold(
//           resizeToAvoidBottomInset: true,
//           body: Column(
//             children: [
//               const SizedBox(height: 10),
//               Container(
//                 width: 40,
//                 height: 5,
//                 decoration: BoxDecoration(
//                   color: AppColor.hintText,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 child: Text(
//                   "Comments",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   controller:
//                       scrollController, // Use the provided scrollController
//                   itemCount: widget.comments.length,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     final comment = widget.comments[index];
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: AssetImage(AppImages.pinkCat),
//                       ),
//                       title: Row(
//                         children: [
//                           Text(comment['user'],
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               )),
//                           if (comment['isAuthor'] == true)
//                             const Padding(
//                               padding: EdgeInsets.only(left: 4.0),
//                               child: Text(
//                                 'Author',
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     color: AppColor.hintText,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                         ],
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(comment['comment']),
//                           Row(
//                             children: [
//                               Text(comment['timeAgo'],
//                                   style: const TextStyle(
//                                       color: AppColor.hintText, fontSize: 12)),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'Reply',
//                                 style: TextStyle(
//                                     color: AppColor.hintText, fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       trailing: Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 widget.onLikeTapped(index);
//                               });
//                             },
//                             child: Icon(
//                               comment['isLiked']
//                                   ? Icons.favorite
//                                   : Icons.favorite_border,
//                               color: comment['isLiked']
//                                   ? AppColor.appRed
//                                   : AppColor.hintText,
//                             ),
//                           ),
//                           Text("${comment['likes']}"),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const Divider(),
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: AssetImage(AppImages.whiteDog),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: CustomTextFormField(
//                       controller: _commentController,
//                       hint: 'Add a comment...',
//                       borderColor:
//                           colorScheme(context).outline.withOpacity(0.4),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   GestureDetector(
//                     onTap: () {
//                       if (_commentController.text.isNotEmpty) {
//                         setState(() {
//                           widget.onSendComment(_commentController.text);
//                         });
//                         _commentController.clear(); // Clear the input field
//                       }
//                     },
//                     child: const Icon(Icons.send),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
