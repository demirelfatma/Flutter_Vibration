// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


class BaseView<T extends Store> extends StatefulWidget {
  final T viewModel;
  final Function(T viewModel) onModelReady;
  final Function(T viewModel)? onDispose;
  final Function(T viewModel)? didChange;
  final Widget Function(BuildContext context, T viewModel) onPageBuilder;

  const BaseView({Key? key, required this.viewModel, required this.onModelReady, this.onDispose, this.didChange, required this.onPageBuilder})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    widget.onModelReady(viewModel);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!(viewModel);
  }

  @override
  void didChangeDependencies() {
    if (widget.didChange != null) widget.didChange;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, viewModel);
  }
}
