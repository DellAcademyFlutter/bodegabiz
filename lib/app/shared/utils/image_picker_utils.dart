import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  /// Retorna uma imagem em tipo [File].
  static Future<File> getImageFile({ImageSource imageSource}) async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: imageSource, imageQuality: 100);
    return File(pickedFile.path);
  }

  /// Retorna uma imagem codificada em base 64 de uma imagem [File] dada.
  static String getBase64ImageFromFileImage({File pickedFile}) {
    final bytes = pickedFile.readAsBytesSync();
    return base64Encode(bytes);
  }

  /// Retorna uma imagem dada em base 64 em formato bytes
  static Uint8List getBytesImage({String base64Image}) {
    return base64Decode(base64Image);
  }

  /// Retorna uma [MemoryImage] dado uma imagem em base 64.
  static getMemoryImageProvider({String base64Image}) {
    return MemoryImage(base64Decode(base64Image));
  }
}
