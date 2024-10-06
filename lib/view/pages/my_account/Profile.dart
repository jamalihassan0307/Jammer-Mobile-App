import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/user/Profile_controller.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
import 'package:jammer_mobile_app/repository/loading.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Initially password is obscure

  var height, width;
  @override
  void initState() {
    Get.put(ProfileController());
    ProfileController.to.updateUser(StaticVariables.model!);
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<ProfileController>(builder: (obj) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 50.0, left: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.1),
                  obj.image != null
                      ? SizedBox(
                          width: width * 0.3,
                          child: Stack(
                            children: [
                              Container(
                                height: height * 0.17,
                                width: width * 0.36,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(obj.image!)),
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () {
                                      Bottomsheet(context, obj);
                                    },
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.12,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: width * 0.06,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: width * 0.4,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 100,
                                backgroundImage: NetworkImage(
                                    GetImage(obj.userModel!.image)),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () {
                                      Bottomsheet(context, obj);
                                    },
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.12,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: width * 0.06,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: obj.emailc,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: 'Alatsi',
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          enabled: false,
                          hintText: 'Email Address',
                          contentPadding:
                              EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: obj.username,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            fontFamily: 'Alatsi',
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          contentPadding:
                              EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: obj.phonenumber,
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            fontFamily: 'Alatsi',
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          contentPadding:
                              EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  InkWell(
                    child: SizedBox(
                      height: 45.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.grey[300],
                        color: Colors.white,
                        borderOnForeground: false,
                        elevation: 5.0,
                        child: GestureDetector(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(width: 7.0),
                                Text(
                                  "Update Profile",
                                  style: TextStyle(
                                    fontFamily: 'Alatsi',
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Perform validation checks
                      if (obj.emailc.text.isEmpty ||
                          obj.username.text.isEmpty ||
                          obj.phonenumber.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'All fields are required',
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        return;
                      }

                      // Proceed with Profile
                      obj.updateProfile(context);
                    },
                  ),
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Future<dynamic> Bottomsheet(BuildContext context, ProfileController obj) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (context) {
          return SizedBox(
            height: height * 0.2,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.06,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.04, top: height * 0.015),
                    child: Text(
                      'Edit Profile Photo',
                      style: TextStyle(
                        fontFamily: 'Alatsi',
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.12,
                  width: width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: height * 0.12,
                          width: width * 0.2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      obj.cameraImagePick();
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.065,
                                    width: width * 0.13,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue,
                                        width: 1,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: width * 0.055,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                    fontFamily: 'Alatsi',
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: height * 0.12,
                          width: width * 0.2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    obj.galleryImagePick();
                                    Navigator.pop(context);
                                    obj.update();
                                  },
                                  child: Container(
                                    height: height * 0.065,
                                    width: width * 0.13,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.blue,
                                          width: 1,
                                        )),
                                    child: Icon(
                                      Icons.photo_album,
                                      size: width * 0.055,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                    fontFamily: 'Alatsi',
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: height * 0.12,
                          width: width * 0.2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    obj.image = null;
                                    Navigator.pop(context);
                                    obj.update();
                                  },
                                  child: Container(
                                    height: height * 0.065,
                                    width: width * 0.13,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.blue,
                                          width: 1,
                                        )),
                                    child: Icon(
                                      Icons.delete,
                                      size: width * 0.055,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Delete",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),
                                )
                              ]),
                        ),
                      ]),
                ),
              ],
            ),
          );
        });
  }
}
