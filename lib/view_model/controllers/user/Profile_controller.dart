// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/models/user/user_model.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  TextEditingController emailc = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  String imageurl = "";

  final picker = ImagePicker();
  File? image;
  UserModel? userModel;
  updateUser(UserModel user) {
    userModel = user;
    emailc.text = user.email;
    username.text = user.fullName;
    phonenumber.text = user.phoneNumber;

    update();
  }

  Future<void> galleryImagePick() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print("pic");
      image = File(pickedImage.path);
      imageurl = pickedImage.path;
      update();
    } else {
      print("error");
    }
  }

  Future<void> updateProfile(context) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        "FullName": username.text,
        "Password": username.text,
        "Image": image != null
            ? await dio.MultipartFile.fromFile(
                image!.path,
                filename: basename(image!.path),
              )
            : null
      });
      print("datadata${data}");
      final response = await httpFormDataClient()
          .post(StaticVariables.updateUser, data: data);

      print(response.data);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: response.data['message'],
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Login failed. Please try again.',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } on DioError catch (e) {
      print("Errrror${e.message}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void viewPassword2() {
    obscureText2 = !obscureText2;
    update();
  }

  bool obscureText2 = true;
  bool obscureText3 = true;
  void viewPassword3() {
    obscureText3 = !obscureText3;
    update();
  }

  Future<void> cameraImagePick() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      print("pic");
      image = File(pickedImage.path);
      imageurl = pickedImage.path;
      update();
    } else {
      print("error");
    }
  }

  clearForm() {
    emailc.clear();
    phonenumber.clear();
    username.clear();
    image = null;
    imageurl = "";

    update();
  }
}
