import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:loginform/api/signupApi.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool value = false;

  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final usercontroller = TextEditingController();
  final referralcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var onChanged;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hello There, Register To Continue!",
                      style: TextStyle(fontSize: 15, color: Colors.black45),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        //  onChanged: onChanged,
                        validator: (value) {
                          if (value == '') {
                            return 'Please enter Referral code';
                          }
                        },
                        controller: referralcontroller,
                        showCursor: true,
                        cursorColor: Colors.grey[300],
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.people,
                            color: Colors.grey[400],
                          ),
                          hintText: "Referral code",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        //  onChanged: onChanged,
                        validator: (value) {
                          if (value == '') {
                            return 'Please enter User Name';
                          }
                        },
                        controller: usercontroller,
                        showCursor: true,
                        cursorColor: Colors.grey[300],
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey[400],
                          ),
                          hintText: "User Name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        //  onChanged: onChanged,
                        validator: (value) {
                          if (value == '') {
                            return 'Please enter Email';
                          }
                        },
                        controller: emailcontroller,
                        showCursor: true,
                        cursorColor: Colors.grey[300],
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.grey[400],
                          ),
                          hintText: "Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        //  onChanged: onChanged,

                        //  onChanged: onChanged,
                        showCursor: true,
                        cursorColor: Colors.grey[300],
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock_outlined,
                            color: Colors.grey[400],
                          ),
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    passwordcontroller.text != ""
                        ? new FlutterPwValidator(
                            controller: passwordcontroller,
                            minLength: 6,
                            uppercaseCharCount: 1,
                            numericCharCount: 1,
                            specialCharCount: 1,
                            width: 400,
                            height: 150,
                            onSuccess: () {
                              print("Matched");
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                  content: new Text("Password is matched")));
                            },
                          )
                        : Container(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        //  onChanged: onChanged,
                        validator: (value) {
                          if (value == '') {
                            return 'Please enter Password';
                          }
                          if (value != passwordcontroller.text) {
                            return 'Password do not match';
                          }
                        },
                        //  onChanged: onChanged,
                        showCursor: true,
                        cursorColor: Colors.grey[300],
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock_outlined,
                            color: Colors.grey[400],
                          ),
                          hintText: "Confirm Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: this.value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Wrap(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'By signing in, you agree to the ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Terms & Conditions ',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.blue),
                                        ),
                                        TextSpan(
                                          text: 'and ',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                        TextSpan(
                                          text: 'Privacy Policy ',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.blue),
                                        ),
                                        TextSpan(
                                          text: 'of the Primal Network.',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: size.width * 0.8,
                      child: ClipRect(
                        //  borderRadius: BorderRadius.circular(5),
                        child: new ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              print(emailcontroller.text +
                                  confirmpasswordcontroller.text +
                                  passwordcontroller.text +
                                  referralcontroller.text +
                                  usercontroller.text);
                              var res = await signupApi(
                                  referralcontroller.text,
                                  emailcontroller.text,
                                  usercontroller.text,
                                  passwordcontroller.text,
                                  confirmpasswordcontroller.text);

                              if (res.status) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff1021E9),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          child: Text("Sign Up"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account ? ',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign in ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
