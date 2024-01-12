import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vibration_appp/core/constant/app/color_constant.dart';
import 'package:vibration_appp/core/extension/context_extension.dart';
import 'package:vibration_appp/view/home/view/widget/television_screen.dart';
import 'package:vibration_appp/view/home/view/widget/vase_container_row.dart';
import 'package:vibration_appp/view/home/view_model/home_view_model.dart';

import '../../../core/base/view/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.init();
        viewmodel.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => Scaffold(
        backgroundColor: ColorsConstant.instance.primary,
        body: buildBody(context, viewModel),
      ),
    );
  }

  Widget buildBody(BuildContext context, HomeViewModel viewModel) {
    return Column(
      children: [
        SizedBox(height: AppBar().preferredSize.height + 20),
        buildTelevisionRow(context, viewModel),
        const SizedBox(height: 50),
        Expanded(child: buildControlTelevision(viewModel, context)),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget buildTelevisionRow(BuildContext context, HomeViewModel viewModel) {
    return Observer(builder: (_) {
      return Column(
        children: [
          VaseContainerRow(x: viewModel.xValue, y: viewModel.yValue, z: viewModel.zValue),
          TelevisionScreen(x: viewModel.xValue, y: viewModel.yValue, z: viewModel.zValue, vibrationList: viewModel.vibrationList),
          
        ],
      );
    });
  }

  Widget buildTelevisionRowBottom() {
    return Container(
      height: 30,
      width: 200,
      decoration: BoxDecoration(
        color: ColorsConstant.instance.onSecondary,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
    );
  }

  Widget buildControlTelevision(HomeViewModel viewModel, BuildContext context) => Container(
        width: context.dymaicWidth(0.25),
        decoration: BoxDecoration(color: ColorsConstant.instance.onSecondary, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTopIconControl(context),
            const SizedBox(height: 30),
            buildStartControl(viewModel, context),
            const Spacer(),
            buildClearControl(viewModel, context),
            const Spacer(),
            buildQuitControl(context),
            const Spacer(),
          ],
        ),
      );
  Widget buildTopIconControl(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.paddingLow,
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: const Center(child: Icon(Icons.radio_button_checked_rounded)),
          ),
        ),
      ),
    );
  }

  Widget buildStartControl(HomeViewModel viewModel, BuildContext context) {
    return Expanded(
      flex: 2,
      child: Observer(builder: (_) {
        return InkWell(
          onTap: () async {
            viewModel.streamListening();
            viewModel.changeStart();
            if (!viewModel.start) {
              await viewModel.addDataToFirestore();
            }
          },
          child: buildStartControllerTxt(context, viewModel),
        );
      }),
    );
  }

  Widget buildStartControllerTxt(BuildContext context, HomeViewModel viewModel) {
    return Container(
      width: context.dymaicWidth(0.20),
      decoration: BoxDecoration(color: ColorsConstant.instance.primary, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          viewModel.start ? "Durdur" : "Başla",
          style: context.textThem.titleLarge?.copyWith(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildClearControl(HomeViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return viewModel.start
          ? const SizedBox()
          : Expanded(
              flex: 2,
              child: InkWell(onTap: () => viewModel.clearUserData(), child: buildClearControlTxt(context)),
            );
    });
  }

  Widget buildClearControlTxt(BuildContext context) {
    return Container(
      width: context.dymaicWidth(0.20),
      decoration: BoxDecoration(color: ColorsConstant.instance.primary, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text("Temizle", style: context.textThem.titleLarge?.copyWith(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  Widget buildQuitControl(BuildContext context) {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: () => exit(0),
        child: Container(
          width: context.dymaicWidth(0.20),
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text("Çıkış", style: context.textThem.titleLarge?.copyWith(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
