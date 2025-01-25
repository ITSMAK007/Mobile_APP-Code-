import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ue_eats_app/utils/colors.dart';
import 'package:ue_eats_app/utils/dimensions.dart';
import 'package:ue_eats_app/widgets/app_column.dart';
import 'package:ue_eats_app/widgets/big_text.dart';
import 'package:ue_eats_app/widgets/icon_and_text_widget.dart';
import 'package:ue_eats_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewConatiner;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        //dots
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
        //list of images
        // for now its working and within SizedBox as well no need to use ListView builder separately ok! if error occurs i`ll changes it at (TM=3:16:01)
        SizedBox(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true, // not needed for now error fixed now😊
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height10,
                      bottom: Dimensions.height10),
                  child: Row(children: [
                    //image section
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: const DecorationImage(
                          image: AssetImage("assets/image/food0.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //text container
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius20),
                            bottomLeft: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                  text: "Nutritious fruit meal in Pakistan"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SmallText(text: "with Pakistani characteristics"),
                              SizedBox(height: Dimensions.height10),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          ),
                        ),
                      ),
                    )
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(Dimensions.radius20),),
                    //     color: Colors.white38,
                    //     image:DecorationImage(
                    //       image: AssetImage("assets/image/food0.jpg"),
                    //       fit: BoxFit.cover,),
                    // ),
                  ]),
                );
              }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                // Rmbr:here i had repalce the column manual data with "AppColumn() so it becomes more simple and easy to reuse from that function ok"
                //     Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     BigText(text: "Special Biryani"),
                //     SizedBox(height: Dimensions.height10),
                //     Row(
                //       children: [
                //         Wrap(
                //           children: List.generate(
                //             5,
                //             (index) => const Icon(
                //               Icons.star,
                //               color: AppColors.mainColor,
                //               size: 15,
                //             ),
                //           ),
                //         ),
                //         const SizedBox(width: 10),
                //         SmallText(text: "4.5"),
                //         const SizedBox(width: 10),
                //         SmallText(text: "12"),
                //         const SizedBox(width: 10),
                //         SmallText(text: "comments"),
                //       ],
                //     ),
                //     SizedBox(height: Dimensions.height20),
                //     const Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         IconAndTextWidget(
                //           icon: Icons.circle_sharp,
                //           text: "Normal",
                //           iconColor: AppColors.iconColor1,
                //         ),
                //         IconAndTextWidget(
                //           icon: Icons.location_on,
                //           text: "1.7km",
                //           iconColor: AppColors.mainColor,
                //         ),
                //         IconAndTextWidget(
                //           icon: Icons.access_time_rounded,
                //           text: "32min",
                //           iconColor: AppColors.iconColor2,
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                child: const AppColumn(
                  text: "Special Biryani",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Removing the The fixed height of 900 has been removed to allow dynamic sizing using the ShrinkWrap ok second code base for the app
