import 'package:vibration/vibration.dart';

class VibrationUtils {
  static void buttonResponse() => Vibration.vibrate(duration: 30, amplitude: 100);
}
