import 'dart:io';

import 'package:doctor_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  // Function to capture an image from the camera
  static Future<XFile?> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      return image;
    } catch (e) {
      rethrow;
    }
  }

  // Function to pick single image from gallery
  static Future<XFile?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      return image;
    } catch (e) {
      rethrow;
    }
  }

  // Function to pick multiple images
  static Future<List<XFile>> pickMultipleImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      return images;
    } catch (e) {
      rethrow;
    }
  }

  // 🔹 Image source dialog (theme removed)
  static void showImageSourceSelection(
    BuildContext context, {
    required void Function() onTapCamera,
    required void Function() onTapGallery,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Choose an option',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.black            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Capture Image',
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onTapCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image_outlined, color: Colors.blue),
                title: const Text(
                  'Upload from Gallery',
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onTapGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔹 Full screen preview (theme removed)
  static void showFullScreenImage({
    required BuildContext context,
    required XFile image,
    required void Function() onDelete,
  }) {
    final imagePath = image.path;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: AppColor.black  ,        body: Stack(
            children: [
              Center(
                child: Hero(
                  tag: imagePath,
                  child: Image.file(File(imagePath), fit: BoxFit.contain),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: IconButton.styleFrom(backgroundColor: Colors.blue),
                      icon: const Icon(
                        Icons.close,
                        color: AppColor.white,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onDelete();
                      },
                      style: IconButton.styleFrom(backgroundColor: Colors.blue),
                      icon: const Icon(
                        Icons.delete,
                        color: AppColor.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
