import 'package:flutter/cupertino.dart';

import 'package:vibration_appp/core/extension/context_extension.dart';
import 'package:vibration_appp/view/home/model/vibration_model.dart';

import '../../../../core/constant/app/color_constant.dart';
import 'fl_chart_vibration.dart';

class TelevisionScreen extends StatelessWidget {
  final double x;
  final double y;
  final double z;
  final List<VibrationModel> vibrationList;
  const TelevisionScreen({super.key, required this.x, required this.y, required this.z, required this.vibrationList});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const SizedBox(width: 30), buildScreenData(context), const SizedBox(width: 30)],
    );
  }

  Widget buildScreenData(BuildContext context) {
    return Expanded(
      child: Container(
        padding: context.paddingLow,
        // height: 300,
        height: context.dymaicHeight(0.33),
        color: ColorsConstant.instance.onPrimary,
        child: AspectRatio(aspectRatio: 2, child: FlChartVibration(vibrationData: vibrationList, xValue: x, yValue: y, zValue: z)),
      ),
    );
  }
}
