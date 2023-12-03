import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:practice/firebase_examplepgm/phone%20authentication%20firebase/phoneauthhomepage.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCpuW8QvRwU0--OuXiCgwemiZ7E_1ne25k",
          appId: "1:905081215074:android:925d61a8a8c83db3b5993b",
          messagingSenderId: "",
          projectId: "fir-first-d8286")
  );
  runApp(phoneAuthFire());
}

class phoneAuthFire extends StatefulWidget {

  @override
  State<phoneAuthFire> createState() => _phoneAuthFireState();
}

class _phoneAuthFireState extends State<phoneAuthFire> {


  final TextEditingController phonenocontroller=TextEditingController();
  final TextEditingController otpController=TextEditingController();

  String mobileNumber='';

  FirebaseAuth auth=FirebaseAuth.instance;

  var otpFieldVisibility = false;
  var receviedId = "";




  void verifyUserPhoneNo() {
    auth.verifyPhoneNumber(
        phoneNumber: mobileNumber,
        verificationCompleted: (PhoneAuthCredential credential) async{
          await auth.signInWithCredential(credential).then((value) async{
            if(value.user !=null){
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context)=> HomePhone()),
                      (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId,int? resendToken){
          receviedId= verificationId;
          otpFieldVisibility=true;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationId){});
  }
  Future<void> verifyOTPCode() async {
    PhoneAuthCredential credential= PhoneAuthProvider.credential(
      verificationId: receviedId,
      smsCode: otpController.text,
    );
    await auth
        .signInWithCredential(credential)
        .then((value) async{
      if(value.user !=null){
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => HomePhone()), (route) => false);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(title: Text("Mobile Verification"),centerTitle: true,),

        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Login Via Phone",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ),
            Image(image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1OEo0tHiqDvwchBU0xqX9wshmQRMiYIF7fniVQ2jBOIVNSyS65ypIZ4UKV0unvrzaHe8&usqp=CAU"),
            height: 70,width: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntlPhoneField(
                controller: phonenocontroller,
                initialCountryCode: 'IN',
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                ),
                onChanged: (val){
                  mobileNumber=val.completeNumber;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: otpFieldVisibility,
                child: TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    hintText: "OTP Code",
                    labelText: "OTP",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),

            ElevatedButton(onPressed: (){
              if(otpFieldVisibility){
                verifyOTPCode();
              }else{
                verifyUserPhoneNo();
              }
              FocusManager.instance.primaryFocus?.unfocus();
            },style: ElevatedButton.styleFrom(minimumSize: Size(250, 50),backgroundColor: Colors.green ),
                child: Text(
                    otpFieldVisibility? "Login" : "Verify"
                ))
          ],
        ),
      ),
    );
  }

}