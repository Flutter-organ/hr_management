import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../../config/app_constant.dart';

class ImagePickerHelper {
  static const int compressionQuality = 50;

  ImagePickerHelper._();

  static Future<File?> pickImageFromGallery() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        compressionQuality: compressionQuality,
      );

      if (result == null || result.files.isEmpty) {
        return null;
      }

      final filePath = result.files.single.path;
      if (filePath == null || filePath.isEmpty) {
        return null;
      }

      final file = File(filePath);
      if (!file.existsSync()) {
        return null;
      }

      return file;
    } catch (e) {
      return null;
    }
  }

  static Future<List<File>> pickMultipleImages({int? maxImages}) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
        compressionQuality: compressionQuality,
      );

      if (result == null || result.files.isEmpty) {
        return [];
      }

      var files = result.files
          .where((file) => file.path != null && file.path!.isNotEmpty)
          .map((file) => File(file.path!))
          .where((file) => file.existsSync())
          .toList();

      if (maxImages != null && files.length > maxImages) {
        files = files.take(maxImages).toList();
      }

      return files;
    } catch (e) {
      return [];
    }
  }

  static Future<File?> pickImageWithExtensions({
    List<String> allowedExtensions = const ['jpg', 'jpeg', 'png', 'gif', 'webp'],
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: false,
        compressionQuality: 50,
      );

      if (result == null || result.files.isEmpty) {
        return null;
      }

      final filePath = result.files.single.path;
      if (filePath == null || filePath.isEmpty) {
        return null;
      }

      return File(filePath);
    } catch (e) {
      return null;
    }
  }

  static double getFileSizeInMB(File file) {
    final bytes = file.lengthSync();
    return bytes / (1024 * 1024);
  }

  static bool isFileSizeValid(File file, {double maxSizeMB = AppConstant.maxImageSizeMB}) {
    return getFileSizeInMB(file) <= maxSizeMB;
  }

  static String getFileExtension(File file) {
    return file.path.split('.').last.toLowerCase();
  }

  static bool isValidImageExtension(File file) {
    final validExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
    return validExtensions.contains(getFileExtension(file));
  }
}