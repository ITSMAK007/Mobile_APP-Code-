import 'package:flutter/material.dart';
import 'package:ue_eats_app/utils/colors.dart';
import 'package:ue_eats_app/utils/dimensions.dart';
import 'package:ue_eats_app/widgets/big_text.dart';
import 'package:ue_eats_app/widgets/icon_and_text_widget.dart';
import 'package:ue_eats_app/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.fontSize26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SmallText(text: "4.5"),
            const SizedBox(width: 10),
            SmallText(text: "12"),
            const SizedBox(width: 10),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "1.7km",
              iconColor: AppColors.mainColor,
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "32min",
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
