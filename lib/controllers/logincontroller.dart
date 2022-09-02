import 'package:facebooklogin/model/userdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginController with ChangeNotifier {
  UserDetails? userDetails;

  facebookLogin() async {
    
      LoginResult result = await FacebookAuth.i
          .login(permissions: const ['email', 'public_profile']);

      //check the status of our login
      if (result.status == LoginStatus.success) {
        final requestData =
            await FacebookAuth.i.getUserData(fields: "name,email,picture");
        userDetails = UserDetails(
          displayName: requestData["name"],
          photoUrl: requestData["picture"],
          email: requestData["email"]["data"]["url"] ?? " ",
        );
        notifyListeners();
      }
  }

  facebookLogout() async {
    await FacebookAuth.i.logOut();
    userDetails = null;
    notifyListeners();
  }
}
