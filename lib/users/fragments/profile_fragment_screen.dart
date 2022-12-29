import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toko_pakaian_flutter_app/users/authentication/login_screen.dart';
import 'package:toko_pakaian_flutter_app/users/userPreferences/current_user.dart';
import 'package:toko_pakaian_flutter_app/users/userPreferences/user_preferences.dart';

class ProfileFragmentScreen extends StatelessWidget
{
  final CurrentUser _currentUser = Get.put(CurrentUser());

  signOutUser() async
  {
    var resultRespone = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.grey,
        title: const Text(
          "Logout",
              style: TextStyle(
            fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        ),
        content: const Text(
          "Kamu yakin ? \n ingin keluar ?",
        ),
        actions: [
          TextButton(
              onPressed: ()
              {
                Get.back();
              },
              child: const Text(
                "No",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
          ),
          TextButton(
            onPressed: ()
            {
              Get.back(result: "loggedOut");
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );

    if(resultRespone == "loggedOut")
      {
        // delete-remove the user data from phone local storage
        RememberUserPrefs.removedUserInfo()
            .then((value)
        {
          // ketika pilih logout tampilannya
          Get.off(LoginScreen());
        });
      }
  }

  Widget userInfoItemProfile(IconData iconData, String userData)
  {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(width: 16,),
          Text(
            userData,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Text(
    //         "Profile Fragment Screen"
    //     ),
    //   ),
    // );
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        Center(
          child: Image.asset(
            "images/man.png",
            width: 240,
          ),
        ),

        const SizedBox(height: 20,),

        userInfoItemProfile(Icons.person, _currentUser.user.user_name),

        const SizedBox(height: 20,),

        userInfoItemProfile(Icons.email, _currentUser.user.user_email),

        const SizedBox(height: 20,),

        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: ()
              {
                signOutUser();
              },
              borderRadius: BorderRadius.circular(32),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  "SIGN OUT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
