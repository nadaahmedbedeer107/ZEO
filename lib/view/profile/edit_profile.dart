import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeo/view/profile/profile.dart';

import '../../common/color_extention.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtName = TextEditingController();
    TextEditingController txtMobile = TextEditingController();
    TextEditingController txtPassword = TextEditingController();
    TextEditingController txtChangePassword = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nada',
                          style: TextStyle(
                            color: TColor.primary,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          ' Shady',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/profile_photo.png",
                          height: 150,
                          width: 150,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.0),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EditProfile(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/Edit.png",
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                RoundTextfield(
                  hintText: "Name",
                  controller: txtName,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextfield(
                  hintText: "Mobile",
                  controller: txtMobile,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextfield(
                  hintText: "Your Password",
                  controller: txtPassword,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextfield(
                  hintText: "Confirm Password",
                  controller: txtChangePassword,
                  obscureText: true,
                  //keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 25,
                ),
                RoundButton(title: "Update", onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                }),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
