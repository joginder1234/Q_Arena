class DisabilitySwitchClass {
  String text;
  bool isActive;
  DisabilitySwitchClass(this.text, this.isActive);
}

class SportsCategoryClass {
  String icon, title;
  bool isActive;
  SportsCategoryClass(this.icon, this.title, this.isActive);
}

class FacilityClass {
  String icon, facility;
  FacilityClass(this.icon, this.facility);
}

class TimingsClass {
  String time;
  bool isAvailable, isSelected;
  TimingsClass(this.time, this.isAvailable, this.isSelected);
}

class MessageClass {
  String name, message, time, image;
  bool isOnline, isSeen;
  MessageClass(this.name, this.message, this.time, this.image, this.isOnline,
      this.isSeen);
}

class ExperienceClass {
  String text, image;
  ExperienceClass(this.text, this.image);
}
