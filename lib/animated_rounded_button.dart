import 'package:flutter/material.dart';
import 'package:fsimpleinnovation/vibration_utils.dart';

const Duration buttonTapAnimationDuration = Duration(milliseconds: 40);

class AnimatedRoundedButton extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final double? height;
  final Function onPressed;
  final Color backgroundColor;
  final bool enabled;

  const AnimatedRoundedButton({
    required this.text,
    required this.textStyle,
    this.height,
    required this.onPressed,
    required this.backgroundColor,
    this.enabled = true,
  });

  @override
  _AnimatedRoundedButtonState createState() => _AnimatedRoundedButtonState();
}

class _AnimatedRoundedButtonState extends State<AnimatedRoundedButton> with TickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // TODO: double height = widget.height ?? ScreenDensityUtils.get().scaleSize(48.0);
    double height = widget.height ?? 48.0;
    Widget result = LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: height,
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: buttonTapAnimationDuration,
            width: _isPressed ? constraints.maxWidth - 2.0 : constraints.maxWidth,
            height: _isPressed ? height - 2.0 : height,
            alignment: Alignment.center,
            child: Text( // TODO: PeriodText
              widget.text,
              textAlign: TextAlign.center,
              style: _isPressed ? widget.textStyle.copyWith(
                fontSize: widget.textStyle.fontSize != null ? widget.textStyle.fontSize! - 0.3: null,
              ) : widget.textStyle,
            ),
            decoration: BoxDecoration(
              color: !widget.enabled || _isPressed ? widget.backgroundColor.withOpacity(0.4) : widget.backgroundColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );

    if (widget.enabled) {
      result = GestureDetector(
        onTapDown: (_) {
          setState(() => _isPressed = true);
        },
        onTapCancel: () {
          setState(() => _isPressed = false);
        },
        onTapUp: (_) {
          setState(() => _isPressed = false);
          VibrationUtils.buttonResponse();
          widget.onPressed();
        },
        child: result,
      );
    }

    return result;
  }
}
