import 'package:dogventurehq/states/bindings/bindings.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/states/models/favorite_model.dart';
import 'package:dogventurehq/states/models/product_details_model.dart';
import 'package:dogventurehq/ui/screens/add_pet/add_pet.dart';
import 'package:dogventurehq/ui/screens/blog/blog.dart';
import 'package:dogventurehq/ui/screens/contact_us/contact_us.dart';
import 'package:dogventurehq/ui/screens/create_account/create_account.dart';
import 'package:dogventurehq/ui/screens/day_care/day_care.dart';
import 'package:dogventurehq/ui/screens/day_care/day_care_details/day_care_details.dart';
import 'package:dogventurehq/ui/screens/events/events.dart';
import 'package:dogventurehq/ui/screens/events_details/events_details.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/my_events/my_event.dart';
import 'package:dogventurehq/ui/screens/my_pets/my_pets.dart';
import 'package:dogventurehq/ui/screens/my_profile/profile.dart';
import 'package:dogventurehq/ui/screens/onboard/onboard.dart';
import 'package:dogventurehq/ui/screens/otp/otp.dart';
import 'package:dogventurehq/ui/screens/payment/payment.dart';
import 'package:dogventurehq/ui/screens/price_guide/price_guide.dart';
import 'package:dogventurehq/ui/screens/registration/registration.dart';
import 'package:dogventurehq/ui/screens/services/services.dart';
import 'package:dogventurehq/ui/screens/splash/splash.dart';
import 'package:dogventurehq/ui/screens/store/store.dart';
import 'package:dogventurehq/ui/screens/store/store_details/store_details.dart';
import 'package:dogventurehq/ui/screens/store_wishlist/store_wishlist.dart';
import 'package:dogventurehq/ui/screens/thank_you/thank_you.dart';
import 'package:dogventurehq/ui/screens/traning_academy/training_academy.dart';
import 'package:dogventurehq/ui/screens/traning_academy/training_academy_details/training_academy_details.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_clinic.dart';
import 'package:dogventurehq/ui/screens/vet_clinic/vet_consultation/consultation.dart';
import 'package:dogventurehq/ui/screens/wallet/my_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ui/screens/day_care/day_care_registration/day_care_registration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
              name: SplashScreen.routeName,
              page: () => const SplashScreen(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: HomeScreen.routeName,
              page: () => const HomeScreen(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: OnboardScreen.routeName,
              page: () => const OnboardScreen(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: LoginScreen.routeName,
              page: () => const LoginScreen(),
              binding: LoginBinding(),
            ),
            GetPage(
              name: CreateAccountScreen.routeName,
              page: () => const CreateAccountScreen(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: OtpScreen.routeName,
              page: () => const OtpScreen(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: AddPet.routeName,
              page: () => AddPet(),
              binding: PetBinding(),
            ),
            GetPage(
              name: Events.routeName,
              page: () => const Events(),
              binding: EventBinding(),
            ),
            GetPage(
                name: EventsDetails.routeName,
                page: () => const EventsDetails(),
                binding: EventDetailsBinding()),
            GetPage(
              name: ServicesPage.routeName,
              page: () => const ServicesPage(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: ConsultationPage.routeName,
              page: () => const ConsultationPage(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: TrainingDetailsPage.routeName,
              page: () => const TrainingDetailsPage(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: DayCareDetailsPage.routeName,
              page: () => const DayCareDetailsPage(),
              binding: InitialBinding(),
            ),
            GetPage(
                name: RegistrationPage.routeName,
                page: () => const RegistrationPage(),
                bindings: [
                  RegistrationBinding(),
                  InitialBinding(),
                ]),
            GetPage(
              name: ThankYou.routeName,
              page: () => const ThankYou(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: MyPetsPage.routeName,
              page: () => const MyPetsPage(),
              binding: InitialBinding(),
            ),
            GetPage(
                name: MyEvents.routeName,
                page: () => const MyEvents(),
                bindings: [
                  InitialBinding(),
                  InitialBinding(),
                ]),
            GetPage(
              name: VetClinic.routeName,
              page: () => const VetClinic(),
              binding: InitialBinding(),
            ),
            GetPage(
              name: ConsultationPage.routeName,
              page: () => const ConsultationPage(),
              binding: ConsultationBinding(),
            ),
            GetPage(
              name: TrainingAcademy.routeName,
              page: () => const TrainingAcademy(),
              binding: TrainingAcademyBinding(),
            ),
            GetPage(
              name: DayCare.routeName,
              page: () => const DayCare(),
              binding: ProfileBinding(),
            ),
            GetPage(
              name: MyProfilePage.routeName,
              page: () => const MyProfilePage(),
              binding: ProfileBinding(),
            ),
            GetPage(
              name: CreateAccountScreen.routeName,
              page: () => const CreateAccountScreen(),
              binding: CreateAccountBinding(),
            ),
            GetPage(
              name: StorePage.routeName,
              page: () => const StorePage(),
              binding: StoreBindings(),
            ),
            GetPage(
              name: StoreDetails.routeName,
              page: () => const StoreDetails(),
              binding: StoreBindings(),
            ),
            GetPage(
              name: StoreWishlist.routeName,
              page: () => const StoreWishlist(),
              binding: StoreBindings(),
            ),
            GetPage(
              name: PaymentPage.routeName,
              page: () => const PaymentPage(),
              bindings: [
                InitialBinding(),
                PaymentBinding(),
              ],
            ),
            GetPage(
              name: AddPet.routeName,
              page: () => AddPet(),
              binding: PetBinding(),
            ),
            GetPage(
              name: ContactUsPage.routeName,
              page: () => const ContactUsPage(),
              binding: ContactUsBinding(),
            ),
            GetPage(
              name: MyBlog.routeName,
              page: () => const MyBlog(),
              binding: BlogBindings(),
            ),
            GetPage(
              name: MyWalletPage.routeName,
              page: () => const MyWalletPage(),
              binding: MyWalletPageBindings(),
            ),
            GetPage(
              name: PriceGuideScreen.routeName,
              page: () => const PriceGuideScreen(),
              binding: PriceGuideScreenBindings(),
            ),
            GetPage(
              name: DayCareRegistrationScreen.routeName,
              page: () => const DayCareRegistrationScreen(),
              binding: RegistrationBinding(),
            ),
          ],
          initialRoute: SplashScreen.routeName,
          initialBinding: InitialBinding(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
