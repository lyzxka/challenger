import 'package:flutter/material.dart';

import 'ChangeNotifierProvider.dart';

/// author：zzxka
/// date：2020-01-31 22:11
/// description: 便捷通知类
class Consumer<T> extends StatelessWidget {
  Consumer({
    Key key,
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);

  final Widget child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context), //自动获取Model
    );
  }
}