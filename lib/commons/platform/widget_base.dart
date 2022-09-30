import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'platform.dart';

abstract class PlatformWidgetBase<I extends Widget, A extends Widget>
    extends StatelessWidget {
  const PlatformWidgetBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isCupertino) {
      return createIosWidget(context);
    } else {
      return createAndroidWidget(context);
    }
  }

  I createIosWidget(BuildContext context);
  A createAndroidWidget(BuildContext context);
}

Size platformScreenSize({BuildContext? context}) =>
    MediaQuery.of(context!).size;
