import 'package:flutter/material.dart';
import 'package:vibration_appp/core/init/navigation/navigation_service.dart';


mixin BaseViewModel {
  NavigationService navigation = NavigationService.instance;
  late BuildContext viewModelContext;
  void init();
}
