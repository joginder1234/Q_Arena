import 'package:flutter/animation.dart';

class BottomNavItemsClass {
  String icon;
  BottomNavItemsClass(this.icon);
}

class SettingsBtnClass {
  String icon, title;
  SettingsBtnClass(this.icon, this.title);
}

class MessageClass {
  String name, message, time, image;
  bool isOnline, isSeen;
  MessageClass(this.name, this.message, this.time, this.image, this.isOnline,
      this.isSeen);
}
