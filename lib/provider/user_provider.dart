import 'package:flutter/material.dart';

class UserProfile extends ChangeNotifier {
  String _avatarImagePath = "assets/images/img_image_21.png";

  String get avatarImagePath => _avatarImagePath;

  void updateAvatar(String imagePath) {
    _avatarImagePath = imagePath;
    notifyListeners();
  }
}
