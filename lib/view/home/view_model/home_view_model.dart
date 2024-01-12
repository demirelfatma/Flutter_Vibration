import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vibration_appp/core/base/view_model/base_view_model.dart';
import 'package:vibration_appp/view/home/model/vibration_model.dart';
import 'package:vibration_appp/view/home/service/home_service.dart';

part 'home_view_model.g.dart';



class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => viewModelContext = context;

  late HomeService _service;

  @observable
  double xValue = 0.0;

  @observable
  double yValue = 0.0;

  @observable
  double zValue = 0.0;

  @observable
  bool start = false;

  @observable
  ObservableList<VibrationModel> vibrationList = ObservableList<VibrationModel>();

  late StreamSubscription<UserAccelerometerEvent> _accelerometerEvents;

  final int desiredDataCount = 5000;
  int dataCounter = 0;

  @override
void init() {
  _service = HomeService();
  _accelerometerEvents = streamListening();
}

@action
StreamSubscription<UserAccelerometerEvent> streamListening() {
  Duration interval = const Duration(milliseconds: 1);
  return userAccelerometerEvents.transform(
    // Using throttleTime from rxdart instead of throttle
    ThrottleStreamTransformer<UserAccelerometerEvent>(
      (_) => TimerStream<bool>(true, interval),
    ),
  ).listen((event) {
      if (start && dataCounter < desiredDataCount) {
        xValue = event.x.abs();
        yValue = event.y.abs();
        zValue = event.z.abs();

        vibrationList.add(
          VibrationModel(
            x: double.parse(xValue.toStringAsFixed(3)),
            y: double.parse(yValue.toStringAsFixed(3)),
            z: double.parse(zValue.toStringAsFixed(3)),
          ),
        );

        dataCounter++;

        if (dataCounter == desiredDataCount) {
          _accelerometerEvents.cancel();
        }
      }
    });
  }

  @action
  void changeStart() {
    start = !start;
  }

  Future<void> addDataToFirestore() async {
    await _service.addDataForUser(vibrationList.toList());
  }

  @action
  Future<void> clearUserData() async {
    vibrationList.clear();
    xValue = 0;
    yValue = 0;
    zValue = 0;
    await _service.clearUserData();
  }
}
