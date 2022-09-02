import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLoginController with ChangeNotifier {
  Map? UserData;

  login() async {
    try {
      LoginResult result = await FacebookAuth.i
          .login(permissions: const ['email', 'public_profile']);

      //check the status of our login
      if (result.status == LoginStatus.success) {
        final requestData =
            await FacebookAuth.i.getUserData(fields: "name,email,picture");
        UserData = requestData;
        notifyListeners();
      }
    } catch (e) {
      Exception("Exception :$e ");
      debugPrint("Exception :$e ");
    }
  }

  logout() async {
    await FacebookAuth.i.logOut();
    UserData = null;
    notifyListeners();
  }
}
