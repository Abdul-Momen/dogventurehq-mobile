import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/helper/dialog_helper.dart';
import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/cartRequestModel.dart';
import 'package:dogventurehq/states/models/product_favorite_model.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/my_cart/my_cart.dart';
import 'package:dogventurehq/ui/widgets/custom_image_network.dart';
import 'package:dogventurehq/ui/widgets/custom_product_item.dart';
import 'package:dogventurehq/ui/widgets/custom_adress_text.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_rech_text.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/html_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../states/controllers/addToCartController.dart';
import '../../../../states/models/product_review_request_model.dart';

class StoreDetails extends StatefulWidget {
  static String routeName = '/store_product_details';

  const StoreDetails({Key? key}) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails>
    with TickerProviderStateMixin {
  final StoreController _storeController = Get.find<StoreController>();
  final AddToCartController _addToCartController =
      Get.put(AddToCartController());

  final TextEditingController _userInputReview = TextEditingController();
  final TextEditingController _userInputTitle = TextEditingController();

  bool isRateVisible = false;
  bool isDesVisible = true;
  var _index = 0;
  late double ratingValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    //get data previous page
    var productMasterId = Get.arguments;

    _storeController.getProductDetails(productMasterId);
    _storeController.getProductDetailsFeatureList(productMasterId.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#F98C10"),
        ),
        toolbarHeight: 129.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
          title: 'Store Details',
          img_bg: 'assets/images/store_bg.png',
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (_storeController.productDetailsLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_storeController.productDetails == null) {
              return const Text('no data found');
            } else {
              return Column(
                children: [
                  Container(
                    color: HexColor("#ffff"),
                    height: 350.h,
                    width: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Positioned(
                          top: 40.h,
                          right: 28.w,
                          child: SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: Obx(() {
                              if (_storeController
                                  .isFavoriteLoadingFlag.value) {
                                return const CircularProgressIndicator();
                              } else {
                                return InkWell(
                                  onTap: () {
                                    if (!Preference.getLoggedInFlag()) {
                                      return DialogHelper.showToast(
                                          'You have must login');
                                    }
                                    _storeController.productDetails!.isWished
                                        ? methodCall()
                                        : methodCall();
                                    setState(
                                      () => _storeController
                                              .productDetails!.isWished =
                                          !_storeController
                                              .productDetails!.isWished,
                                    );
                                  },
                                  child: Icon(
                                    _storeController.productDetails!.isWished
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: _storeController
                                            .productDetails!.isWished
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                );
                              }
                            }),
                          ),
                        ),
                        Positioned(
                          top: 40.h,
                          left: 28.w,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 60.w,
                                height: 300.h,
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.keyboard_arrow_up,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                      height: 200.h,
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: _storeController
                                              .productDetails!
                                              .productMasterMediaViewModels
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5.0),
                                                child: SizedBox(
                                                  height: 50.h,
                                                  width: 65.w,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _index = index;
                                                        setState(() {});
                                                      },
                                                      child: CustomImageNetwork(
                                                          imageUrl: _storeController
                                                              .productDetails!
                                                              .productMasterMediaViewModels[
                                                                  index]
                                                              .fileLocation),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              addW(30.w),
                              SizedBox(
                                width: 200.w,
                                height: 250.h,
                                child: CustomImageNetwork(
                                    imageUrl: _storeController
                                        .productDetails!
                                        .productMasterMediaViewModels[_index]
                                        .fileLocation),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  _storeController.productDetails!.productName,
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      fontFamily: ConstantStrings.kAppFont),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'NES: 629110375',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily:
                                          ConstantStrings.kAppFontPoppins),
                                ),
                              ),
                            ],
                          ),
                          addH(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  "${_storeController.productDetails!.productDetailsRequestModel.weight} gm",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily:
                                          ConstantStrings.kAppFontPoppins),
                                ),
                              ),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.orangeAccent,
                                    ),
                                    height: 30.h,
                                    width: 50.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: SizedBox(
                                            height: 10.h,
                                            width: 10.w,
                                            child: SvgPicture.asset(
                                              'assets/svg/star.svg',
                                              height: 20.h,
                                              color: HexColor('#FFFFFF'),
                                            ),
                                          ),
                                        ),
                                        addW(5.w),
                                        Flexible(
                                          child: Text(
                                            _storeController
                                                .productDetails!.totalRating
                                                .toString(),
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          addH(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomRichText(
                                      text: 'AED ',
                                      textRich: _storeController
                                          .productDetails!.productDecimal
                                          .toString(),
                                      textRichSize: 22.sp,
                                      textRichColor: '#155D84',
                                    ),
                                    Text(
                                      '(All prices include VAT)',
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily:
                                              ConstantStrings.kAppFontPoppins),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: HexColor('#E4EEF7'),
                                    ),
                                    height: 61.h,
                                    width: 210.w,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Flexible(
                                            child: CustomRichText(
                                              text: 'Get it by',
                                              textRich: 'Today 4 PM - 6 PM',
                                            ),
                                          ),
                                          addW(5.w),
                                          const Flexible(
                                            child: CustomRichText(
                                              text:
                                                  'Free delivery above for groceries.',
                                              textRich: ' 30 AED',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          addH(10.h),
                          // Text(
                          //   'Select weight:',
                          //   style: TextStyle(
                          //       fontSize: 30.sp,
                          //       fontFamily: ConstantStrings.kAppFont),
                          // ),
                          // addH(10.h),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     CustomBtn(
                          //       btnFn: () {
                          //         // Get.to(DogFoodPage());
                          //       },
                          //       btnText: '50 gm',
                          //       btnBgClr: Colors.green.shade800,
                          //       txtSize: 13.sp,
                          //       btnSize: Size(80.w, 38.h),
                          //     ),
                          //     addW(5.w),
                          //     CustomBtn(
                          //       btnFn: () {},
                          //       btnText: '100 gm',
                          //       btnBgClr: Colors.white,
                          //       txtColor: Colors.black,
                          //       borderColor: Colors.grey.shade200,
                          //       txtSize: 13.sp,
                          //       btnSize: Size(80.w, 38.h),
                          //     ),
                          //     addW(5.w),
                          //     CustomBtn(
                          //       btnFn: () {},
                          //       btnText: '250 gm',
                          //       btnBgClr: Colors.white,
                          //       txtColor: Colors.black,
                          //       borderColor: Colors.grey.shade200,
                          //       txtSize: 13.sp,
                          //       btnSize: Size(80.w, 38.h),
                          //     ),
                          //     addW(5.w),
                          //     CustomBtn(
                          //       btnFn: () {},
                          //       btnText: '500 gm',
                          //       btnBgClr: Colors.white,
                          //       txtColor: Colors.black,
                          //       borderColor: Colors.grey.shade200,
                          //       txtSize: 13.sp,
                          //       btnSize: Size(80.w, 38.h),
                          //     ),
                          //   ],
                          // ),
                          addH(20.h),
                          CustomIconWithText(
                            address: 'Country of Origin: India',
                            logo: "assets/svg/location.svg",
                            fontSize: 15.sp,
                            logoSize: 20.h,
                          ),
                          addH(10.h),
                          Row(
                            children: [
                              Text(
                                'Sold by:',
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    fontFamily: ConstantStrings.kAppFont),
                              ),
                              Image.asset(
                                width: 100.w,
                                height: 30.h,
                                'assets/images/sold_by.png',
                              ),
                            ],
                          ),
                          addH(10.h),

                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: const Divider(color: Colors.grey),
                              ),
                              SizedBox(
                                child: TabBar(
                                  controller: tabController,
                                  labelColor: Colors.green,
                                  labelStyle: TextStyle(
                                      fontSize: 30.sp,
                                      fontFamily: ConstantStrings.kAppFont),
                                  unselectedLabelColor: Colors.black,
                                  unselectedLabelStyle: TextStyle(
                                      fontSize: 30.sp,
                                      fontFamily: ConstantStrings.kAppFont),
                                  indicatorColor: Colors.black,
                                  tabs: const [
                                    Tab(
                                      text: 'DESCRIPTION',
                                    ),
                                    Tab(
                                      text: 'RATINGS & REVIEW',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 600,
                                width: double.maxFinite,
                                child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: CustomHtmlText(
                                        text: _storeController
                                            .productDetails!.description,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              Text(
                                                'EXPAND MORE REVIEWS',
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontFamily: 'kAppFont',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10.0, bottom: 40.0),
                                            child: const Divider(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'ADD RATING: ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'kAppFont',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.sp),
                                              ),
                                              RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  setState(() {});
                                                  ratingValue =
                                                      rating.toDouble();
                                                  print(rating);
                                                },
                                              )
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 12, bottom: 12),
                                            child: Row(
                                              children: const [
                                                Text(
                                                  'ADD A WRITTEN REVIW',
                                                  style: TextStyle(
                                                      fontFamily: 'kAppFont',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _userInputReview,
                                            onChanged: (value) {
                                              // setState(() {
                                              //   userInput.text = value.toString();
                                              //   review = userInput.toString();
                                              // });
                                            },
                                            maxLines: null,
                                            minLines: 5,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: const TextStyle(
                                                // height: 5
                                                ),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText:
                                                  'Tell us what you like or dislike about this product',
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 14),
                                            child: Row(
                                              children: const [
                                                Text(
                                                  'ADD TITLE',
                                                  style: TextStyle(
                                                      fontFamily: 'kAppFont',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 12, bottom: 12),
                                            child: Row(
                                              children: const [
                                                Text(
                                                  'Sum up your review in one line',
                                                  style: TextStyle(
                                                    fontFamily: 'kAppFont',
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _userInputTitle,
                                            onChanged: (value) {
                                              // setState(() {
                                              //    userInput.text = value.toString();
                                              //    title = userInput.toString();
                                              // });
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText:
                                                  'Tell us what you like or dislike about this product',
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 130,
                                                margin: const EdgeInsets.only(
                                                    top: 18),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    _addReview();
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.green),
                                                  ),
                                                  child: const Text(
                                                    'Submit',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),

                          // Row(
                          //   children: [
                          //     InkWell(
                          //       onTap: () {
                          //         setState(() {
                          //           isRateVisible = false;
                          //           isDesVisible = true;
                          //         });
                          //       },
                          //       child: Text(
                          //         'Description ',
                          //         style: TextStyle(
                          //             fontSize: 30.sp,
                          //             color: isDesVisible
                          //                 ? Colors.green
                          //                 : Colors.black,
                          //             fontFamily: ConstantStrings.kAppFont),
                          //       ),
                          //     ),
                          //     addW(30.w),
                          //     InkWell(
                          //       onTap: () {
                          //         setState(() {
                          //           isRateVisible = true;
                          //           isDesVisible = false;
                          //         });
                          //       },
                          //       child: Text(
                          //         'Rating And Review',
                          //         style: TextStyle(
                          //             fontSize: 30.sp,
                          //             color: isRateVisible
                          //                 ? Colors.green
                          //                 : Colors.black,
                          //             fontFamily: ConstantStrings.kAppFont),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // addH(10.h),
                          // Visibility(
                          //   visible: isDesVisible,
                          //   child: Padding(
                          //     padding: EdgeInsets.all(8.0),
                          //     child: CustomHtmlText(
                          //       text: _storeController
                          //           .productDetails!.description,
                          //     ),
                          //   ),
                          // ),
                          // Visibility(
                          //   visible: isRateVisible,
                          //   child: Padding(
                          //     padding: EdgeInsets.all(8.0),
                          //     child: Text(
                          //         'Praesentrtis euismod, risus orci tincidunt nunc, nec mattis \njusto urna id nunc. Mauris quis metus ut enim auctor accumsan viverra eu sapien. Praesent commodo laoreet gravida. Donec pulvinar at \nlorem et aliquam. Suspendisse venenatis et orci viverra.'),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  addH(10.h),
                  SizedBox(
                    width: 428.w,
                    height: 60.h,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/featured_product.png',
                          ),
                        ),
                        Positioned(
                          bottom: 0.h,
                          right: 10.w,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'View all',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.amber.shade800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  addH(10.h),
                  SizedBox(
                    width: double.infinity,
                    height: 360.h,
                    child: Obx(() {
                      if (_storeController
                          .featureProductListLoadingFlag.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (_storeController.featureProductList.isNotEmpty) {
                          return ListView.builder(
                            itemCount:
                                _storeController.featureProductList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomProductItem(
                                productModel:
                                    _storeController.featureProductList[index],
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('no data found'));
                        }
                      }
                    }),
                  ),
                  addH(20.h),
                  addH(150.h),
                ],
              );
            }
          }
        }),
      ),
      bottomSheet: Obx(() {
        if (_storeController.productDetailsLoadingFlag.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (_storeController.productDetails == null) {
            return const Text('no data found');
          } else {
            return SizedBox(
              height: 160.h,
              width: double.infinity.w,
              child: Column(
                children: [
                  Card(
                    child: Container(
                      color: Colors.white70,
                      height: 80.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomRichText(
                                  text: 'AED ',
                                  textRich:
                                      _storeController.totalPrice().toString(),
                                  textRichSize: 29.sp,
                                  textRichColor: '#155D84',
                                ),
                                Text(
                                  '(All prices include VAT)',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily:
                                          ConstantStrings.kAppFontPoppins),
                                ),
                              ],
                            ),
                          ),
                          addW(10.w),
                          Expanded(
                            flex: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _storeController.decrease();
                                  },
                                  child: Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                    ),
                                    child: Center(
                                        child: Text(
                                      '-',
                                      style: TextStyle(fontSize: 30.sp),
                                    )),
                                  ),
                                ),
                                //ElevatedButton(onPressed: (){}, child: Icon(Icons.add)),
                                addW(10.h),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'QTY ${_storeController.counter}',
                                    style: TextStyle(fontSize: 25.sp),
                                  ),
                                ),
                                addW(10.h),

                                InkWell(
                                  onTap: () {
                                    _storeController.increment();
                                  },
                                  child: Container(
                                    color: Colors.green,
                                    height: 40.h,
                                    width: 40.w,
                                    child: Center(
                                        child: Text(
                                      '+',
                                      style: TextStyle(
                                          fontSize: 30.sp, color: Colors.white),
                                    )),
                                  ),
                                ),
                                addW(10.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  addH(10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 6,
                          child: ElevatedButton(
                            onPressed: () {
                              if (Preference.getLoggedInFlag()) {
                                Get.to(const MyCartPage());
                              } else {
                                Get.toNamed(LoginScreen.routeName,
                                    arguments: 2);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              // background (button) color
                              padding: const EdgeInsets.only(
                                  left: 40.0,
                                  right: 40,
                                  top: 16,
                                  bottom: 16), // foreground (text) color
                            ),
                            child: const Text(
                              'Buy now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        addW(10.w),
                        Expanded(
                          flex: 6,
                          child: ElevatedButton(
                            onPressed: () {
                              // Get.to(MyCartPage());
                              setState(() {
                                if (Preference.getLoggedInFlag()) {
                                  _addToCart();
                                } else {
                                  Get.toNamed(LoginScreen.routeName,
                                      arguments: 2);
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              // background (button) color
                              padding: const EdgeInsets.only(
                                  left: 40.0,
                                  right: 40,
                                  top: 16,
                                  bottom: 16), // foreground (text) color
                            ),
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }
      }),
    );
  }

  methodCall() {
    FavoriteProductModel fav = FavoriteProductModel(
      customerId: Preference.getUserId(),
      productMasterId: _storeController.productDetails!.productMasterId,
      tempId: '',
      productSubSkuId: 0,
      ipAddress: '',
    );
    _storeController.addFavoriteProduct(fav);
  }

  void _addToCart() {
    CartRequestModel cartRequestModel = CartRequestModel(
        cartId: 0,
        // cartId: cartId,
        productMasterId: _storeController.productDetails!.productMasterId,
        // productMasterId: 2147,
        customerId: Preference.getUserId(),
        // customerId: 68,
        tempId: Preference.getUserId().toString(),
        quantity: _storeController.counter.toDouble(),
        unitPrice: _storeController.productDetails!.productDecimal,
        // unitPrice: 56,
        status: '',
        // productSubSKUId: _storeController.productDetails!.productSubSkuRequestModels[],
        productSubSKUId: _storeController
            .productDetails!.productSubSkuRequestModels[0].productSubSkuId,
        currencyId: 1,
        // currencyId: currencyId,
        supplierId:
            _storeController.productDetails!.supplierRequestModel.supplierId,
        storeId: _storeController.productDetails!.storeId,
        // supplierId: 10185,
        // storeId: 40230,
        serviceDateTime: '',
        serviceTimeString: '',
        // isService: isService,
        isService: false,
        eventId: 0
        // eventId: 0
        );
    _addToCartController.addToCart(cartRequestModel);
    _storeController.getCartList(Preference.getUserId().toString());

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_addToCartController.addToCartLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_addToCartController.cartRequestObj != null) {
              return const Text('Successfully Added');
            } else {
              return Column(
                children: [
                  const Text('Loading... failed'),
                  addH(20.h),
                  CustomBtn(
                    btnFn: () {
                      _storeController
                          .getCartList(Preference.getUserId().toString());
                      Get.back();
                    },
                    btnText: 'Try Again',
                    btnBgClr: Colors.green,
                    btnSize: Size(120.w, 40.h),
                  )
                ],
              );
            }
          }
        }),
        radius: 10.0);
  }

  void _addReview() {
    ProductReviewRequestModel productReviewRequestModel =
        ProductReviewRequestModel(
            productReviewsId: 0,
            productMasterId: _storeController.productDetails!.productMasterId,
            rating: ratingValue.toDouble(),
            productSubSKUId: 0,
            customerId: Preference.getUserId(),
            review: _userInputReview.text,
            title: _userInputTitle.text,
            customerName: Preference.getNameFlag(),
            ipAddress: '192.168.0.168',
            status: 'status',
            createdAt: '',
            updatedAt: '');

    _storeController.addToReview(productReviewRequestModel);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_storeController.addToReviewLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_storeController.response != null) {
              return const Text('Successfully Submitted');
            } else {
              return Column(
                children: [
                  const Text('Loading... failed'),
                  addH(20.h),
                  CustomBtn(
                    btnFn: () {
                      Get.back();
                    },
                    btnText: 'Try Again',
                    btnBgClr: Colors.green,
                    btnSize: Size(120.w, 40.h),
                  )
                ],
              );
            }
          }
        }),
        radius: 10.0);
  }
}
