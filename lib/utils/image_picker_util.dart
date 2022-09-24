import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:tech_buy/utils/di.dart';

class ImagePickerUtil {
  static Future<List<File>> pickImages() async {
    List<File> images = [];

    try {
      var files = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (files != null && files.files.isNotEmpty) {
        for (var file in files.files) {
          images.add(File(file.path!));
        }
      }
    } catch (e) {
      logger.i("Didn't Pick image");
      rethrow;
    }
    return images;
  }
}
