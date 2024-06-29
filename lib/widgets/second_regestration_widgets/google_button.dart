import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Color(0xFF2F3A4C),
        minimumSize: Size(double.infinity, 56),
        side: BorderSide(color: Color(0xFFCCD4E0)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      icon:Icon(Icons.account_circle)
      //Image.asset('assets/icon.svg', width: 24, height: 24)
      ,
      label: Text(
        "تسجيل الدخول باستخدام جوجل",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () =>onButtonTapped(context)
    );
  }
}


class GoogleSignInApi{

  static final _googlSignIn =GoogleSignIn();
  static Future <GoogleSignInAccount?>login()=>_googlSignIn.signIn();
}
///}

class SuccessLogin extends StatelessWidget{
  final GoogleSignInAccount user;

  const SuccessLogin ({super.key,required, required this.user });

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Sucess Login"),
    ),
    body: Center(
      child: Column(
        children: [
          Text("name"+user.displayName!),
          SizedBox(height: 16,),
          Text("email"+user.email)
        ],
      ),
    ),
  );
}

}
onButtonTapped(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 1));


  if (!context.mounted) return;
  else {
    var g = await GoogleSignInApi.login();
    print(g?.displayName);
    print(g?.email);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g!.displayName!),));
    if(g!=null) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
          //   ForgotPasswordScreen()
          SuccessLogin(user: g,)
          ));
    }
  }

}