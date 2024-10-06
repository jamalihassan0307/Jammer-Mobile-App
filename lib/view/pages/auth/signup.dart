import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/auth/login_controller.dart';
import 'package:jammer_mobile_app/view/pages/auth/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Initially password is obscure

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<LoginController>(builder: (obj) {
      return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              padding:
                  const EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alatsi',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                  ),
                  const Text(
                    'Sign Up',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alatsi',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 50.0, left: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          width: width * 0.3,
                          child: Stack(
                            children: [
                              Container(
                                height: height * 0.17,
                                width: width * 0.36,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
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
                        ),
                  const SizedBox(height: 10.0),
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
                          hintText: 'Email Address',
                          contentPadding:
                              EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: obj.user,
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
                      TextField(
                        controller: obj.phonenumberc,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: 'Alatsi',
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          hintText: 'Phone Number',
                          contentPadding:
                              EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: obj.passwordc,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Alatsi',
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: obj.viewPassword2,
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                        obscureText: obj.obscureText2,
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: obj.repassword,
                        decoration: InputDecoration(
                          hintText: 'Repeat Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Alatsi',
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: obj.viewPassword3,
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        ),
                        obscureText: obj.obscureText3,
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
                                  "SIGN UP",
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
                          obj.user.text.isEmpty ||
                          obj.passwordc.text.isEmpty ||
                          obj.repassword.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'All fields are required',
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        return;
                      }
                      if (obj.passwordc.text != obj.repassword.text) {
                        Fluttertoast.showToast(
                          msg: 'Passwords do not match',
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        return;
                      }
                      // Proceed with signup
                      obj.signup(context);
                    },
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15.0,
                          fontFamily: 'Alatsi',
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      InkWell(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 18.0,
                            fontFamily: 'Alatsi',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                      ),
                    ],
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

  Future<dynamic> Bottomsheet(BuildContext context, LoginController obj) {
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
