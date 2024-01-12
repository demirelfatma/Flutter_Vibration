import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

enum LottiePathEnum { splash, flower }

extension LottiePathEnumExtension on LottiePathEnum {
  String? get rawValue {
    switch (this) {
      case LottiePathEnum.flower:
        return _pathValue("flower");
      case LottiePathEnum.splash:
        return _pathValue("splash");
      default:
    }
    return null;
  }

  Widget get toWidgetLottie => Lottie.asset(
        rawValue!,
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
        repeat: true,
      );

  String _pathValue(String path) {
    return "assets/lottie/$path.json";
  }
}
