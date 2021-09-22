import 'package:flutter/material.dart';
import 'signUp.dart';
import 'api/login.dart';

bool focus = false;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign in",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hello There, Sign In To Continue!",
                    style: TextStyle(fontSize: 15, color: Colors.black45),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      //  onChanged: onChanged,
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter username';
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      //  onChanged: onChanged,
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter password';
                        }
                      },
                      controller: passwordcontroller,
                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock_outline,
                          color: Colors.grey[400],
                        ),
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Forgot your password ?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
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
                            print(
                                emailcontroller.text + passwordcontroller.text);
                            //  emailcontroller.text
                            //    passwordcontroller.text
                            var res = await loginApi(
                                emailcontroller.text, passwordcontroller.text);
                            print(res);
                            if (res.status) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
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
                        child: Text("Sign in"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
