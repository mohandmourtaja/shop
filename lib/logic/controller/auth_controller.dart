import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:project_1/model/facebook_model.dart';
import 'package:project_1/routes/routes.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  // var googleSignIn = GoogleSignIn().signIn();
  //FaceBookModel? faceBookModel;

  var isSigndIn = false;

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : '')!;

    // displayUserPhoto.value =
    // (userProfile != null ? userProfile!.photoURL : '')!;

    displayUserEmail.value = (userProfile != null ? userProfile!.email : '')!;

    super.onInit();
  }

  final GetStorage authBox = GetStorage();
  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpUSingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });

      update();

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void logInUSingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);
      isSigndIn = true;
      authBox.write('auth', isSigndIn);
      update();

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'Account does not found for that $email';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  // void googleSignUpApp() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     displayUserName.value = googleUser!.displayName!;
  //     displayUserPhoto.value = googleUser.photoUrl!;
  //     displayUserEmail.value = googleUser.email;
  //     GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);
  //     await auth.signInWithCredential(credential);
  //     isSigndIn = true;
  //     authBox.write('auth', isSigndIn);
  //     update();
  //     Get.offNamed(Routes.mainScreen);
  //   } catch (e) {
  //     Get.snackbar('Error!', e.toString(),
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white);
  //   }
  // }

  // void faceBookSignUpApp() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   if (loginResult.status == LoginStatus.success) {
  //     final data = await FacebookAuth.instance.getUserData();
  //     faceBookModel = FaceBookModel.fromJson(data);

  //     print('==================================');
  //     print(faceBookModel!.email);
  //     print(faceBookModel!.name);
  //     print('==================================');
  //      isSigndIn = true;
  //authBox.write('auth', isSigndIn);
  //     update();
  //     Get.offNamed(Routes.mainScreen);
  //   }
  // }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();

      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'Account does not found for that $email';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      // await googleSignIn.signOut();
      // await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';
      isSigndIn = false;
      authBox.remove('auth');
      update();

      Get.offAllNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }
}
