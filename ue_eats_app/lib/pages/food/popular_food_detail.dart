import 'package:flutter/material.dart';
import 'package:ue_eats_app/utils/colors.dart';
import 'package:ue_eats_app/utils/dimensions.dart';
import 'package:ue_eats_app/widgets/app_column.dart';
import 'package:ue_eats_app/widgets/app_icon.dart';
import 'package:ue_eats_app/widgets/big_text.dart';
import 'package:ue_eats_app/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          // icons widget
          Positioned(
            top: Dimensions.height45,
            right: Dimensions.width20,
            left: Dimensions.width20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          // introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(
                    text: "Special Biryani",
                  ),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              "This is a very special biryani that is made with the best ingredients. It is a must-try for all biryani lovers. This is a very special biryani that is made with the best ingredients. It is a must-try for all biryani lovers.This is a very special biryani that is made with the best ingredients. It is a must-try for all biryani lovers. This is a very special biryani that is made with the best ingredients. It is a must-try for all biryani lovers.This is a very special biryani that is made with the best ingredients.It is a must-try for all biryani lovers. This is a very special biryani that is made with the best ingredients. It is a must-try for all biryani loversThis is a very special biryani that is made with the best ingredients. It is a must-try for all biryani lovers. This is a very special biryani that is made with the best ingredients. It is a must-try for all biryani loversThis is a very special biryani that is made with the best ingredients. It is a must-try for all biryani lovers. This is a very special biryani that is made with the best ingredients. It is a must-try for all biryani lovers"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height:
            110, // as for now its  static height and working fine...i`ll make it dynamic later...
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10 / 2),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            // TODO: add to cart button....
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Second try => Code for better design.Making it dynamic to work on different screen sizes!
// import 'package:flutter/material.dart';
// import 'package:ue_eats_app/utils/colors.dart';
// import 'package:ue_eats_app/utils/dimensions.dart';
// import 'package:ue_eats_app/widgets/app_column.dart';
// import 'package:ue_eats_app/widgets/app_icon.dart';
// import 'package:ue_eats_app/widgets/big_text.dart';
// import 'package:ue_eats_app/widgets/icon_and_text_widget.dart';
// import 'package:ue_eats_app/widgets/small_text.dart';

// class PopularFoodDetail extends StatelessWidget {
//   const PopularFoodDetail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Ensure Dimensions is updated based on the current screen size
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     // Dynamically calculate dimensions based on the current screen size
//     Dimensions.screenHeight = screenHeight;
//     Dimensions.screenWidth = screenWidth;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Positioned(
//             left: 0,
//             right: 0,
//             child: Container(
//               width: double.maxFinite,
//               height: Dimensions.popularFoodImgSize,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage("assets/image/food0.png"),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: Dimensions.height45,
//             right: Dimensions.width20,
//             left: Dimensions.width20,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppIcon(icon: Icons.arrow_back_ios),
//                 AppIcon(icon: Icons.shopping_cart_outlined),
//               ],
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             top: Dimensions.popularFoodImgSize - 20,
//             child: Container(
//               padding: EdgeInsets.only(
//                 left: Dimensions.width20,
//                 right: Dimensions.width20,
//                 top: Dimensions.height20,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(Dimensions.radius20),
//                   topLeft: Radius.circular(Dimensions.radius20),
//                 ),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const AppColumn(
//                     text: "Special Biryani",
//                   ),
//                   SizedBox(height: Dimensions.height20),
//                   BigText(text: "Introduce")
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         height: Dimensions.bottomHeightBar, // Dynamically calculated height
//         padding: EdgeInsets.only(
//           top: Dimensions.height20,
//           bottom: Dimensions.height20,
//           left: Dimensions.width20,
//           right: Dimensions.width20,
//         ),
//         decoration: BoxDecoration(
//           color: AppColors.buttonBackgroundColor,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(Dimensions.radius20 * 2),
//             topRight: Radius.circular(Dimensions.radius20 * 2),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: Dimensions.height15,
//                 horizontal: Dimensions.width20,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimensions.radius20),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.remove,
//                     color: AppColors.signColor,
//                   ),
//                   SizedBox(width: Dimensions.width10 / 2),
//                   BigText(text: "0"),
//                   SizedBox(width: Dimensions.width10 / 2),
//                   const Icon(
//                     Icons.add,
//                     color: AppColors.signColor,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: Dimensions.height15,
//                 horizontal: Dimensions.width20,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimensions.radius20),
//                 color: AppColors.mainColor,
//               ),
//               child: BigText(
//                 text: "\$10 | Add to cart",
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
