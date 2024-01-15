import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/profile_controller.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/user_profile_update_model.dart';
import 'package:dogventurehq/ui/screens/create_account/cc_picker.dart';
import 'package:dogventurehq/ui/widgets/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/custom_field.dart';
import 'package:dogventurehq/ui/widgets/custom_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class MyProfilePage extends StatefulWidget {
  static String routeName = '/user_profile';

  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String countryCode = '+971';

  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _numberTextEditingController =
      TextEditingController();
  final TextEditingController _aboutTextEditingController =
      TextEditingController();
  final TextEditingController _addressTextEditingController =
      TextEditingController();

  // final ProfileController _profileController = Get.find<ProfileController>();
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController.text = Preference.getNameFlag().trim();
    _emailTextEditingController.text = Preference.getEmailFlag().trim();
    _phoneTextEditingController.text = Preference.getPhoneFlag().trim();
    _passwordTextEditingController.text = Preference.getPasswordFlag().trim();
    _addressTextEditingController.text = Preference.getAddressFlag().trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#f5b342"),
        ),
        toolbarHeight: 122.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitlebar(
            title: "Profile", img_bg: 'assets/images/day_care_bg.png'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 46.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              addH(20.h),
              SizedBox(
                width: 115.w,
                height: 115.h,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    // user image
                    Container(
                      width: 115.w,
                      height: 115.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Obx(() {
                        if (_profileController.isLoading.value) {
                          return const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/icons/no_user.jpg'),
                            child: Center(
                                child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            )),
                          );
                        } else {
                          if (_profileController.imageURL.isNotEmpty) {
                            return CachedNetworkImage(
                              imageUrl: _profileController.imageURL,
                              fit: BoxFit.cover,
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: imageProvider,
                              ),
                              placeholder: (context, url) => const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/icons/no_user.jpg'),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                )),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            );
                          } else {
                            if (Preference.getUserImageFlag().isEmpty) {
                              return CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/icons/no_user.jpg'),
                              );
                            } else {
                              return CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      Preference.getUserImageFlag()));
                            }
                          }
                        }
                      }),
                    ),
                    // photo uploading btn
                    InkWell(
                      onTap: () => _selectImage(),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        margin: EdgeInsets.only(
                          bottom: 5.h,
                          right: 5.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                            width: 2,
                          ),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child:
                              SvgPicture.asset("assets/icons/Camera Icon.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Name:'),
                  addH(10),
                  CustomField(
                    textEditingController: _nameTextEditingController,
                    hintTxt: Preference.getNameFlag().trim(),
                    inputType: TextInputType.name,
                  ),
                  addH(20.h),
                  const Text('Email:'),
                  addH(10.h),
                  CustomField(
                    hintTxt: 'alex@example.com',
                    textEditingController: _emailTextEditingController,
                    inputType: TextInputType.emailAddress,
                  ),
                  addH(20.h),
                  const Text('Mobile Number:'),
                  addH(10.h),
                  // mobile number
                  Container(
                    width: 336.w,
                    height: 50.h,
                    padding: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 115.w,
                          child: CCPicker(onChangedFn: changeCountryCode),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          indent: 18.h,
                          endIndent: 18.h,
                          color: Colors.grey.shade600,
                        ),
                        CustomField(
                            hintTxt: '554830683',
                            textEditingController: _phoneTextEditingController,
                            w: 178.w,
                            borderClr: Colors.transparent,
                            inputType: TextInputType.number),
                      ],
                    ),
                  ),
                  const Text('Address:'),
                  addH(10),
                  CustomField(
                    textEditingController: _addressTextEditingController,
                    hintTxt: Preference.getAddressFlag().trim(),
                    inputType: TextInputType.name,
                  ),
                  // password
                  addH(20.h),
                  const Text('Password:'),
                  addH(10.h),
                  CustomField(
                    hintTxt: '********',
                    textEditingController: _passwordTextEditingController,
                    obsecureFlag: true,
                    inputType: TextInputType.visiblePassword,
                  ),
                  addH(20.h),
                  Text('Number of Pets'),
                  addH(10),
                  CustomField(
                    textEditingController: _numberTextEditingController,
                    inputType: TextInputType.name,
                    hintTxt: '',
                  ),
                  addH(20.h),

                  Text('About Myself'),
                  addH(10),
                  CustomField(
                    textEditingController: _aboutTextEditingController,
                    inputType: TextInputType.name,
                    hintTxt: '',
                    numOfLines: 3,
                    h: 100.h,
                  ),
                  addH(20.h),
                  // addH(20.h),
                  // const Text('Confirm Password:'),
                  // addH(10.h),
                  // CustomField(
                  //   hintTxt: '********',
                  //   obsecureFlag: true,
                  //     inputType: TextInputType.visiblePassword
                  // ),
                  // addH(10.h),
                  //
                  // const Text('Preferred Communication'),
                  // addH(10.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SizedBox(
                  //       height: 40.h,
                  //       width: 120.w,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 8.0),
                  //         child: CustomCheckbox(
                  //           initialValue: _agreeFlag,
                  //           onChangedFn: (value) => setState(
                  //                 () => _agreeFlag = value!,
                  //           ),
                  //           title: "WhatsApp",
                  //
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 40.h,
                  //       width: 100.w,
                  //       child: CustomCheckbox(
                  //         initialValue: _agreeFlag,
                  //         onChangedFn: (value) => setState(
                  //               () => _agreeFlag = value!,
                  //         ),
                  //         title: "Email",
                  //
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // addH(10.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SizedBox(
                  //       height: 40.h,
                  //       width: 110.w,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 8.0),
                  //         child: CustomCheckbox(
                  //           initialValue: _agreeFlag,
                  //           onChangedFn: (value) => setState(
                  //                 () => _agreeFlag = value!,
                  //           ),
                  //           title: "Sms",
                  //
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 40.h,
                  //       width: 100.w,
                  //       child: CustomCheckbox(
                  //         initialValue: _agreeFlag,
                  //         onChangedFn: (value) => setState(
                  //               () => _agreeFlag = value!,
                  //         ),
                  //         title: "Call",
                  //
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  addH(20.h),
                  CustomBtn(
                    btnSize: Size(340.w, 60.h),
                    btnFn: () {
                      _updateProfile();
                    },
                    btnText: 'Save Changes',
                    btnBgClr: Colors.green.shade600,
                    textFontFamily: ConstantStrings.kAppFont,
                    txtSize: 30.sp,
                  ),
                  addH(10.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if(image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() {
  //       this.image = imageTemp;
  //       Preference.setUserImageFlag(this.image.toString());
  //     });
  //   } on PlatformException catch(e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  void changeCountryCode(CountryCode code) {
    countryCode = code.dialCode ?? '+971';
    print(countryCode);
  }

  // uploadImage()async{
  //   File? image;
  //   var imagePicker=await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if(imagePicker!=null){
  //     setState(() {
  //       image=File(imagePicker.path);
  //     });
  //   }
  //
  //   try{
  //     String fileName=image!.path.split("/").last;
  //     print(fileName);
  //     FormData formData=new FormData.fromMap({
  //       //backend variableName - 1 /imagePath=>IMAGE
  //       "imagePath":
  //       await MultipartFile.fromFile(image!.path,filename: fileName,
  //           contentType: MediaType("image","jpg")),
  //       "type":"image/jpg",
  //       //backend variableName - 2 /carId=> Car ID
  //       "carId":4
  //     });
  //
  //     String accessToken="ACCESS_TOKEN";
  //
  //
  //     var response=await dio.post(
  //       "https://10.0.2.2:5001/api/carimages/add",
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           "accept":"*/*",
  //           "Authorization":"Bearer $accessToken",
  //           "Content-Type":"multipart/form-data"
  //         },
  //       ),
  //     );
  //   }
  //   catch(e){
  //     print(e);
  //   }
  //
  // }
  void _updateProfile() {
    UserProfileUpdateModel updateModel = UserProfileUpdateModel(
      firstName: _nameTextEditingController.text,
      password: _passwordTextEditingController.text,
      fullName: _nameTextEditingController.text,
      aboutCustomer: _aboutTextEditingController.text,
      email: _emailTextEditingController.text,
      gender: 0,
      customerAddressViewModel: CustomerAddressViewModel(
        address: _addressTextEditingController.text,
      ),
      customerGroupId: 1,
      phoneNo: _phoneTextEditingController.text,
      pet: '1',
      customerid: Preference.getUserId(),
    );
    _profileController.userProfileUpdate(updateModel);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_profileController.profileUpdateLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_profileController.profileUpdate != null) {
              Preference.setPasswordFlag(_passwordTextEditingController.text);
              Preference.setNameFlag(_nameTextEditingController.text);
              Preference.setEmailFlag(_emailTextEditingController.text);
              Preference.setPhoneFlag(_phoneTextEditingController.text);
              Preference.setAddressFlag(_addressTextEditingController.text);

              Future.delayed(const Duration(seconds: 1), () async {
                Get.back();
              });
              return const Text('success');
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

  _selectImage() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () {
                Get.back();
                _profileController.uploadImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () {
                Get.back();
                _profileController.uploadImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
