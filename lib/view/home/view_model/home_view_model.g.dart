// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$xValueAtom =
      Atom(name: '_HomeViewModelBase.xValue', context: context);

  @override
  double get xValue {
    _$xValueAtom.reportRead();
    return super.xValue;
  }

  @override
  set xValue(double value) {
    _$xValueAtom.reportWrite(value, super.xValue, () {
      super.xValue = value;
    });
  }

  late final _$yValueAtom =
      Atom(name: '_HomeViewModelBase.yValue', context: context);

  @override
  double get yValue {
    _$yValueAtom.reportRead();
    return super.yValue;
  }

  @override
  set yValue(double value) {
    _$yValueAtom.reportWrite(value, super.yValue, () {
      super.yValue = value;
    });
  }

  late final _$zValueAtom =
      Atom(name: '_HomeViewModelBase.zValue', context: context);

  @override
  double get zValue {
    _$zValueAtom.reportRead();
    return super.zValue;
  }

  @override
  set zValue(double value) {
    _$zValueAtom.reportWrite(value, super.zValue, () {
      super.zValue = value;
    });
  }

  late final _$startAtom =
      Atom(name: '_HomeViewModelBase.start', context: context);

  @override
  bool get start {
    _$startAtom.reportRead();
    return super.start;
  }

  @override
  set start(bool value) {
    _$startAtom.reportWrite(value, super.start, () {
      super.start = value;
    });
  }

  late final _$vibrationListAtom =
      Atom(name: '_HomeViewModelBase.vibrationList', context: context);

  @override
  ObservableList<VibrationModel> get vibrationList {
    _$vibrationListAtom.reportRead();
    return super.vibrationList;
  }

  @override
  set vibrationList(ObservableList<VibrationModel> value) {
    _$vibrationListAtom.reportWrite(value, super.vibrationList, () {
      super.vibrationList = value;
    });
  }

  late final _$clearUserDataAsyncAction =
      AsyncAction('_HomeViewModelBase.clearUserData', context: context);

  @override
  Future<void> clearUserData() {
    return _$clearUserDataAsyncAction.run(() => super.clearUserData());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  StreamSubscription<UserAccelerometerEvent> streamListening() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.streamListening');
    try {
      return super.streamListening();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStart() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeStart');
    try {
      return super.changeStart();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
xValue: ${xValue},
yValue: ${yValue},
zValue: ${zValue},
start: ${start},
vibrationList: ${vibrationList}
    ''';
  }
}
