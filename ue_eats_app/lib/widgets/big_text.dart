// import 'package:flutter/cupertino.dart';
//
// class BigText extends StatelessWidget {
//   final Color? color;
//   final String text;
//   double size;
//   TextOverflow overflow;
//   const BigText({super.key, this.color, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:ue_eats_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size == 0 ? Dimensions.fontSize20 : size,
      ),
    );
  }
}
