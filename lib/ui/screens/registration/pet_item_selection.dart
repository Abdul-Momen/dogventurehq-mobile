import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/registration_controller.dart';
import 'package:dogventurehq/states/models/pet_list_model.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetItemSelection extends StatefulWidget {
  final void Function(List<PetModel>) getPetModels;

  PetItemSelection({
    Key? key,
    required this.getPetModels,
  }) : super(key: key);

  @override
  State<PetItemSelection> createState() => _PetItemSelectionState();
}

class _PetItemSelectionState extends State<PetItemSelection> {
  final RegistrationController _registCon = Get.put(RegistrationController());
  final List<PetModel> _selectedPets = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                height: 300.h,
                child: Container(
                  width: double.infinity,
                  height: 300.h,
                  color: Colors.white,
                  child: Obx(
                    () {
                      if (_registCon.petLoadingFlag.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (_registCon.petList.isEmpty) {
                          return const Text('No data found');
                        } else {
                          return ListView.builder(
                            itemCount: _registCon.petList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: _selectedPets.contains(
                                              _registCon.petList[index],
                                            ),
                                            activeColor: Colors.blue,
                                            checkColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                            ),
                                            onChanged: (value) => setState(
                                              () {
                                                if (value != null && value) {
                                                  _selectedPets.add(
                                                    _registCon.petList[index],
                                                  );
                                                } else {
                                                  _selectedPets.remove(
                                                    _registCon.petList[index],
                                                  );
                                                }
                                                widget.getPetModels(
                                                  _selectedPets,
                                                );
                                              },
                                            ),
                                          ),
                                          addW(10.w),
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 16.0,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: Image.asset(
                                                'assets/images/animal_img.png',
                                              ),
                                            ),
                                          ),
                                          addW(10.w),
                                          Text(
                                            _registCon.petList[index].name,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset('assets/images/circular_img.png'),
                    ),
                  ),
                  addW(10.w),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset('assets/images/animal_img.png'),
                    ),
                  ),
                  addW(10.w),
                  SizedBox(
                    width: 160.w,
                    child: _selectedPets.isEmpty
                        ? const Text('Select Pets')
                        : ListView.builder(
                            itemCount: _selectedPets.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_selectedPets[index].name}, ',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
