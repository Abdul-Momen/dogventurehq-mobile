import 'package:dogventurehq/states/controllers/blog_controller.dart';
import 'package:dogventurehq/states/controllers/contact_us_controller.dart';
import 'package:dogventurehq/states/controllers/create_account_controller.dart';
import 'package:dogventurehq/states/controllers/day_care_controller.dart';
import 'package:dogventurehq/states/controllers/event_controller.dart';
import 'package:dogventurehq/states/controllers/home.dart';
import 'package:dogventurehq/states/controllers/login_controller.dart';
import 'package:dogventurehq/states/controllers/my_pet_controller.dart';
import 'package:dogventurehq/states/controllers/my_wallet_controller.dart';
import 'package:dogventurehq/states/controllers/payment_controller.dart';
import 'package:dogventurehq/states/controllers/profile_controller.dart';
import 'package:dogventurehq/states/controllers/registration_controller.dart';
import 'package:dogventurehq/states/controllers/store_controller.dart';
import 'package:dogventurehq/states/controllers/vet_clinic_controller.dart';
import 'package:get/get.dart';

import '../controllers/addToCartController.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MyWalletController());
  }
}

class MyPetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPetController());
  }
}

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventController());
  }
}

class EventDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventController());
  }
}

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PaymentController(),
    );
  }
}

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class PetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPetController(), fenix: true);
  }
}

class ContactUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController(), fenix: true);
  }
}

class ConsultationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VetClinicController());
  }
}

class TrainingAcademyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VetClinicController());
  }
}

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}

class DayCareBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DayCareController>(
      () => DayCareController(),
    );
  }
}

class CreateAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(
      () => CreateAccountController(),
    );
  }
}

class StoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(),
    );
    Get.lazyPut(() => StoreController());
  }
}

class BlogBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>(
      () => BlogController(),
    );
    Get.lazyPut(() => BlogController());
  }
}

class MyWalletPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyWalletController>(
      () => MyWalletController(),
    );
    Get.lazyPut(() => MyWalletController());
  }
}

class PriceGuideScreenBindings implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => MyWalletController());
  }
}
