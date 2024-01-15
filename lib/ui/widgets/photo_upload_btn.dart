import 'dart:io';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/my_pet_controller.dart';
import 'package:dogventurehq/states/methods/all_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploadBtn extends StatefulWidget {
  final void Function(File) setPhotoFn;
  const PhotoUploadBtn({Key? key, required this.setPhotoFn}) : super(key: key);

  @override
  State<PhotoUploadBtn> createState() => _PhotoUploadBtnState();
}

class _PhotoUploadBtnState extends State<PhotoUploadBtn> {
  final MyPetController _myPetController = Get.put(MyPetController());

  File? dp ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336.w,
      height: 52.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 5.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: 200.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Choose File',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    dp.toString()=="null" ?ConstantStrings.kUploadPhotoSubtitle: dp.toString().substring(dp.toString().length-26),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 10.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            // onTap: () {
            //   _choosePhoto();
            // },
            onTap: () {
              showGeneralDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(0.8),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, anim1, anim2) {
                  return AllMethods.buildDPAlertDialog(
                    onPressedFn: pickImage,
                    ctx: context,
                  );
                },
                transitionBuilder: (context, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 1),
                      end: const Offset(0, 0),
                    ).animate(anim1),
                    child: child,
                  );
                },
              );
            },
            child: Container(
              width: 92.w,
              height: 30.h,
              color: Colors.lightBlue.shade900,
              child: const Center(
                child: Text(
                  'Choose',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


Future<void> pickImage(galleryFlag) async {
  XFile? image;
  try {
    if (galleryFlag) {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 800,
        maxWidth: 600,
      );
    }
    if (image == null) return;
    // // userInfoController.updateUserDP(
    // //   token: userItems[0].uToken,
    // //   imageFile: File(image.path),
    // );


    setState(() => dp = File(image!.path));
    print(dp!.path);

    widget.setPhotoFn(dp!);


  } on PlatformException catch (e) {
    // showing error
    Get.snackbar(
      'Error Occured!',
      'Failed to pick image: $e',
      icon: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}
}
