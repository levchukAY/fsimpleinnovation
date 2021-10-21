import 'package:flutter/material.dart';
import 'package:fsimpleinnovation/si_theme.dart';
import 'package:fsimpleinnovation/util/screen_density_utils.dart';

class SimpleInnovationApp extends StatefulWidget {
  final Widget app;

  const SimpleInnovationApp({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<SimpleInnovationApp> createState() => _SimpleInnovationAppState();
}

class _SimpleInnovationAppState extends State<SimpleInnovationApp> {
  @override
  void initState() {
    super.initState();

    ScreenDensityUtils.get().init(context);
    SiTheme.get().setColor(Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return widget.app;
  }
}
