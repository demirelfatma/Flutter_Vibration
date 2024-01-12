import 'package:flutter/material.dart';
import 'package:vibration_appp/core/extension/context_extension.dart';

class VaseContainerRow extends StatelessWidget {
  final double x;
  final double y;
  final double z;
  const VaseContainerRow({super.key, required this.x, required this.y, required this.z});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildVaseContainer("X", x, Colors.red, context),
        buildVaseContainer("Y", y, Colors.orange, context),
        buildVaseContainer("Z", z, const Color.fromRGBO(2, 109, 197, 1), context),
      ],
    );
  }

  Widget buildVaseContainer(String axis, double value, Color color, BuildContext context) {
    return Column(
      children: [buildColorContainer(context, color, axis, value), buildBottom()],
    );
  }

  Widget buildColorContainer(BuildContext context, Color color, String axis, double value) {
    return Column(
      children: [
        Container(
          width: context.dymaicWidth(0.20),
          height: context.dymaicHeight(0.08),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
          child: buildColorContainerTxt(axis, value, context),
        ),
      ],
    );
  }

  Widget buildColorContainerTxt(String axis, double value, BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          axis,
          style: context.textThem.titleLarge?.copyWith(fontWeight: FontWeight.normal, fontSize: 16),
        ),
        Text(value.toStringAsFixed(2), style: context.textThem.titleLarge?.copyWith(fontWeight: FontWeight.normal, fontSize: 16))
      ],
    ));
  }

  Widget buildBottom() {
    return SizedBox(width: 80, height: 10, child: Divider(color: Colors.grey[400], height: 5, thickness: 5));
  }
}
