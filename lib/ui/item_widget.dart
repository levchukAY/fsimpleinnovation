import 'package:flutter/material.dart';
import 'package:fsimpleinnovation/si_theme.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final String? description;
  final int? descriptionMaxLines;
  final Widget? controls;
  final Widget? leftControls;
  final Widget? additionalInfo;
  final VoidCallback? onTap;
  final bool bottomSeparator;

  const ItemWidget({
    required this.title,
    this.titleTextStyle,
    this.description,
    this.descriptionMaxLines,
    this.controls,
    this.leftControls,
    this.additionalInfo,
    this.onTap,
    this.bottomSeparator = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget result = Text( // TODO: PeriodText
      title,
      style: titleTextStyle ?? SiTheme.get().titleTextStyle(),
      //shouldShift: false,
    );

    if (description != null) {
      result = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          result,
          const SizedBox(
            height: 2.0,
          ),
          Text( // TODO: PeriodText
            description!,
            style: SiTheme.get().subtitleTextStyle(),
            maxLines: descriptionMaxLines,
            overflow: descriptionMaxLines == null ? null : TextOverflow.ellipsis,
          ),
        ],
      );
    }

    if (controls != null || leftControls != null) {
      result = Row(
        children: <Widget>[
          if (leftControls != null)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: leftControls,
            ),
          Expanded(
            child: result,
          ),
          if (controls != null)
            controls!,
        ],
      );
    }

    result = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: result,
          ),
        ),
      ),
    );

    if (additionalInfo != null || bottomSeparator) {
      result = Column(
        children: <Widget>[
          result,
          if (additionalInfo != null)
            additionalInfo!,
          if (bottomSeparator)
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: SiTheme.get().separatorColor,
                  ),
                ),
              ),
            ),
        ],
      );
    }

    return result;
  }
}

class SwitchItem extends StatelessWidget {
  final String name;
  final String? description;
  final int? descriptionMaxLines;
  final TextStyle? headerTextStyle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget? additionalInfo;
  final bool bottomSeparator;

  const SwitchItem({
    required this.name,
    this.description,
    this.descriptionMaxLines,
    this.headerTextStyle,
    required this.value,
    required this.onChanged,
    this.additionalInfo,
    this.bottomSeparator = true,
  });

  @override
  Widget build(BuildContext context) {
    return ItemWidget(
      title: name,
      description: description,
      descriptionMaxLines: descriptionMaxLines,
      titleTextStyle: headerTextStyle,
      controls: Switch(
        value: value,
        onChanged: onChanged,
      ),
      additionalInfo: additionalInfo,
      onTap: () => onChanged(!value),
      bottomSeparator: bottomSeparator,
    );
  }
}
