import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:sofgo/helpers/navigation_helper.dart';
import 'package:sofgo/mint/colors.dart';

class FeaturePage extends StatefulWidget {
  const FeaturePage({Key? key}) : super(key: key);

  @override
  _FeaturePageState createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  final ScrollController _controller = ScrollController();
  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 38.h,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                PageView(
                  children:
                      List.generate(3, (index) => _buildFeatureImages(index)),
                  onPageChanged: (newPage) {
                    currentImageIndex = newPage;
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: SizedBox(
                      height: 0.5.h,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _controller,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(3, (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                              height: 0.5.h,
                              width:  index == currentImageIndex ? 9.w : 3.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.5.h))),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w, top: 12.w),
                    child: BackButton(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureImages(int index) {
    String _imageUrl = '';
    switch (index) {
      case 0:
        _imageUrl =
            'https://i.pinimg.com/originals/c8/ff/8e/c8ff8e08981728760150e7de881139e0.jpg';
        break;
      case 1:
        _imageUrl =
            'https://supermarketdesign.com.au/images/projects/tt_mart/TT-3.jpg';
        break;
      case 2:
        _imageUrl =
            'https://bigtheme.co/wp-content/uploads/2015/05/8-1024x683.jpg';
        break;
    }
    return Container(
      height: 38.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: NetworkImage(_imageUrl), fit: BoxFit.cover),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    );
  }
}

Widget BackButton(BuildContext context) {
  return SizedBox(
    height: 12.w,
    width: 12.w,
    child: RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: Colors.white,
      onPressed: () {
        navigateBack(context);
      },
      child: Icon(
        Icons.arrow_back_ios_sharp,
        size: 8.w,
        color: AppColors.mainColor,
      ),
    ),
  );
}
