import 'package:flutter/cupertino.dart';
import 'package:ue_eats_app/utils/dimensions.dart';
import 'package:ue_eats_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  //final Color color;
  final Color iconColor;
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      //required this.color,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24),
        const SizedBox(
          width: 5,
        ),
        SmallText(text: text),
      ],
    );
  }
}
