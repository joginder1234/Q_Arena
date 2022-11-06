import 'package:flutter/cupertino.dart';

import '../models/basic_models.dart';
import '../services/icons.dart';

class AppDataProvider extends ChangeNotifier {
  List<SportsCategoryClass> _category = [
    SportsCategoryClass(AppIcons.cricketIcon, "Cricket", false),
    SportsCategoryClass(AppIcons.footballIcon, "Football", false),
    SportsCategoryClass(AppIcons.golfIcon, "Golf", false),
    SportsCategoryClass(AppIcons.teninsIcon, "Tennis", false),
    SportsCategoryClass(AppIcons.vollyIcon, "Volleyball", false),
    SportsCategoryClass(AppIcons.rugbyIcon, "Rugby", false),
    SportsCategoryClass(AppIcons.cycleIcon, "Cycling", false),
    SportsCategoryClass(AppIcons.hokeyIcon, "Hockey", false),
    SportsCategoryClass(AppIcons.badmintonIcon, "Badminton", false),
    SportsCategoryClass(AppIcons.padelIcon, "Padel", false),
    SportsCategoryClass(AppIcons.basketballIcon, "Basketball", false),
    SportsCategoryClass(AppIcons.swimmingIcon, "Swimming", false),
    SportsCategoryClass(AppIcons.carromIcon, "Carrom", false),
    SportsCategoryClass(AppIcons.chessIcon, "Chess", false),
    SportsCategoryClass(AppIcons.archeryIcon, "Archery", false),
  ];

  List<SportsCategoryClass> get getSportsList => _category;
  markCategoryActive(String category, bool value) {
    _category.firstWhere((element) => element.title == category).isActive =
        value;
    notifyListeners();
  }
}
