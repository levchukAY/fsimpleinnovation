import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../si_theme.dart';
import 'item_widget.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String? description;
  final void Function()? action;
  final bool bottomSeparator;

  const SettingsItem({
    required this.title,
    this.description,
    this.action,
    this.bottomSeparator = true,
  });

  @override
  Widget build(BuildContext context) {
    return ItemWidget(
      title: title,
      description: description,
      onTap: () {
        action?.call();
      },
      controls: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Image(
          color: SiTheme.get().primaryColor,
          image: const Svg(
            'assets/arrow.svg',
            size: Size(28.0, 28.0),
          ),
        ),
      ),
      bottomSeparator: bottomSeparator,
    );
  }
}
