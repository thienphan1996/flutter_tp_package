import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TpMaterialApp {
  static Widget builder(BuildContext context, Widget? widget) {
    return ResponsiveWrapper.builder(
      BouncingScrollWrapper.builder(context, widget!),
      defaultScale: true,
      breakpoints: <ResponsiveBreakpoint>[
        const ResponsiveBreakpoint.resize(450, name: MOBILE),
        const ResponsiveBreakpoint.autoScale(800, name: TABLET),
        const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
      ],
    );
  }
}