import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:sofgo/helpers/navigation_helper.dart';
import 'package:sofgo/mint/colors.dart';
import 'package:sofgo/pages/feature_page.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IconData notificationIcon = Icons.notifications_outlined;
  final ScrollController _controller = ScrollController();
  int currentPageIndex = 0;

  List<String> eventData = [
    "Бесплатная AZIZ осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
    "Бесплатная техический осмотр для постоянные клиентам до 1 декабря",
  ];

  Map<String, int> oilPriceData = {
    "BENZIN 80": 7600,
    "BENZIN 91": 9200,
    "BENZIN 92": 10000,
    "BENZIN 95": 12000,
    "BENZIN 98": 14500,
    "METAN": 2300,
  };

  Widget _buildFeatureItem(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, top: 4.w, bottom: 4.w),
      child: InkWell(
        onTap: () {
          changePage(context, FeaturePage());
        },
        child: SizedBox(
          width: 88.w,
          height: 88.w,
          child: Container(
            height: 88.w,
            width: 88.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                color: Colors.deepOrange),
          ),
        ),
      ),
    );
  }

  Widget _buildEventItems(BuildContext context, int index) {
    if (index == eventData.length) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: SizedBox(
        width: 50.w,
        height: 8.h,
        child: Center(
          child: Text(eventData[index],
              maxLines: 2, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }

  Widget _buildOilPriceItems(BuildContext context, int index) {
    if (index == oilPriceData.length) {
      return const Center(child: CircularProgressIndicator());
    }
    String tmpString = oilPriceData.values.elementAt(index).toString();
    if (oilPriceData.values.elementAt(index) > 1000) {
      tmpString = "${tmpString.substring(0, tmpString.length - 3)},000";
    }

    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 6.h,
            width: 22.w,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(2.w)),
            child: Center(
              child: Text(
                tmpString,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: "DS-DIGITAL",
                    color: Colors.white),
              ),
            ),
          ),
          Text(
            oilPriceData.keys.elementAt(index),
            style: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor
        ),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(color: Color(0xFFE5E5E5)),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 54.h,
                    decoration: const BoxDecoration(
                        color: Color(0xFF4D6F39),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 4.w, top: 4.w),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  width: 10.w,
                                  height: 10.w,
                                  child: Stack(
                                    children: [
                                      Icon(
                                        notificationIcon,
                                        size: 10.w,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, bottom: 5),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Visibility(
                                            visible: true,
                                            child: Container(
                                              height: 14,
                                              width: 14,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFFFFB001),
                                                  shape: BoxShape.circle),
                                              child: Center(
                                                  child: Text(
                                                "99+",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 6),
                                              )),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ), // Notification Icon
                            Padding(
                              padding: EdgeInsets.only(top: 4.w),
                              child: Column(
                                children: [
                                  Container(
                                    height: 6.h,
                                    width: 35.w,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(4))),
                                    child: Center(
                                        child: Text(
                                      "70 Z 543 PA",
                                      style: TextStyle(
                                          color: const Color(0xFF7D7D7D),
                                          fontSize: 14.sp),
                                    )),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.w, right: 4.w),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 14.w,
                                  width: 14.w,
                                  child: CircleAvatar(
                                    backgroundImage: const NetworkImage(
                                        "https://rustamov.uz/images/ruslan-rustamov.jpg"),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Здравствуйте Фаррух",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 8.0),
                          child: Container(
                            height: 75.w,
                            width: 75.w,
                            child: Center(
                              child: SizedBox(
                                  width: 70.w,
                                  height: 70.w,
                                  child: SfBarcodeGenerator(
                                    value: 'https://yemak.uz/',
                                    symbology: QRCode(),
                                  )),
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 8.h,
                            width: 8.h,
                            child: Image.asset("assets/images/icons/discount.png",
                                scale: 1.4),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFAD08),
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.5.w))),
                          ),
                          Container(
                            width: 70.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2.5.w)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 6.h,
                                  child: PageView.builder(
                                    onPageChanged: (newPage) => setState(() {
                                      currentPageIndex = newPage;
                                      double _offset;
                                      int _duration = 300;
                                      if (newPage > 2) {
                                        _offset =
                                            200 / eventData.length * newPage + 7;
                                      } else {
                                        _duration = 1000;
                                        _offset = 0.toDouble();
                                      }
                                      _controller.animateTo(_offset,
                                          duration:
                                              Duration(milliseconds: _duration),
                                          curve: Curves.fastOutSlowIn);
                                    }),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: eventData.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: _buildEventItems,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                  width: 50.w,
                                  child: SingleChildScrollView(
                                    controller: _controller,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        eventData.length,
                                        (index) => Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.w),
                                          height: 0.5.h,
                                          width: 2.w,
                                          decoration: BoxDecoration(
                                              color: currentPageIndex == index
                                                  ? const Color(0xFF4D6F39)
                                                  : const Color(0xFF9C9C9C),
                                              borderRadius:
                                                  BorderRadius.circular(0.5.h)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 12.h,
                    child: ListView(
                      controller: _controller,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: List.generate(oilPriceData.length,
                          (index) => _buildOilPriceItems(context, index)),
                    ),
                  ),
                  SizedBox(
                    height: 37.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          5, (index) => _buildFeatureItem(context, index)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.w),
                    child: InkWell(
                      focusColor: Colors.black,
                      onTap: () {},
                      child: Container(
                        height: 8.h,
                        width: 94.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Image.asset("assets/images/icons/marker.png",
                                  height: 4.h),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 2.w),
                              child: Text(
                                "Все наши филиалы",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color(0xFF4D6F39),
                                  Color(0xFF5E8448)
                                ])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
