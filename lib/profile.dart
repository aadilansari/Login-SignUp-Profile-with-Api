//import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginform/api/usesrInfoApi.dart';

enum BestTutorSite { Male, Female }

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool value = false;
  TextEditingController dateinput = TextEditingController();
  BestTutorSite _site = BestTutorSite.Male;
  final emailcontroller = TextEditingController();
  final firstname = TextEditingController();
  String gender = 'Male';
  final lastname = TextEditingController();
  final mobilenumber = TextEditingController();
  final statustext = TextEditingController();
  final country = TextEditingController();
  final pincode = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Edit Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      decoration: new BoxDecoration(color: Colors.amber),
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/ic.png',
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                  height: 8,
                                  width: 8,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Icon(Icons.edit))))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                    child: TextField(
                      controller: firstname,
                      //  onChanged: onChanged,

                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey[400],
                        ),
                        hintText: "First Name",
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
                    child: TextField(
                      controller: lastname,
                      //  onChanged: onChanged,

                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey[400],
                        ),
                        hintText: "Last Name",
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
                    child: TextField(
                      controller: emailcontroller,
                      //  onChanged: onChanged,

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
                    child: TextField(
                      //  onChanged: onChanged,
                      controller: dateinput,
                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.grey[400],
                        ),
                        hintText: "Enter Date",
                        //   labelText: "Enter Date",
                        border: InputBorder.none,
                      ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text(
                            'Male',
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Radio(
                            value: BestTutorSite.Male,
                            groupValue: _site,
                            onChanged: (value) {
                              setState(() {
                                _site = BestTutorSite.Male;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Female',
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Radio(
                            value: BestTutorSite.Female,
                            groupValue: _site,
                            onChanged: (value) {
                              setState(() {
                                _site = BestTutorSite.Female;
                              });
                            },
                          ),
                        ),
                      ],
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
                    child: TextField(
                      controller: mobilenumber,
                      //  onChanged: onChanged,
                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.grey[400],
                        ),
                        hintText: "Enter mobile number",
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
                    child: TextField(
                      controller: statustext,
                      //  onChanged: onChanged,
                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.markunread_mailbox,
                          color: Colors.grey[400],
                        ),
                        hintText: "Write Status",
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
                    child: TextField(
                      controller: country,
                      //  onChanged: onChanged,
                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.markunread_mailbox,
                          color: Colors.grey[400],
                        ),
                        hintText: "Select Citizenship",
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
                    child: TextField(
                      controller: pincode,
                      //  onChanged: onChanged,
                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.post_add,
                          color: Colors.grey[400],
                        ),
                        hintText: "Enter PinCode",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      //  onChanged: onChanged,
                      showCursor: true,
                      cursorColor: Colors.grey[300],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.markunread_mailbox,
                          color: Colors.grey[400],
                        ),
                        hintText: "Write Status",
                        border: InputBorder.none,
                      ),
                    ),
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
                          var res = await editUserInfo(
                              'jKTzq80B96PQ0Lloj-Z1eo_lmkYx3WgjY7tXBTUlxAQHvGH5lqgJ7sbYeX0RvcPduhi5iRvMs4LGDVxVoxfZYh3P4SuONiOBZ8IEDvrojEB4Xmvb2gsL--FF3Iy6PAuBtpgw8AhczSW1pqQmOnudgXMY-MxV2NGx4JskqJLMDpK3jPfkJssEYeYJSl7lTLgrotAEtjbJhTr5mbNEzS7yT-f7Nn4ul8B__kAqoszJh1Rufgckp6WqxbCuR8F5mRTSSQvuTqI9ClsXpOE6ucF8AkzCRVlIfxBcoP72Oxf25TdRa8Xu4qXljfZBwN-VqReoE7T9VLt8D-zPzpMp8r5tnkQmyEj6eCWPd3ZzfwmbcqunB_ApoPI3RMwXp1tiR-m64TH1oQHvDytp28ylAs1Kb5WpbtQKBYG0rrxDoe1O-vkI9veKbDVx13Drze_wJMdQxx0rl7KjOLz7gykx9QNLFuaTXwRK9oWkRiG_NackpkfUsuCgR-PPI9CcBrIPm9L1',
                              firstname.text,
                              lastname.text,
                              dateinput.text,
                              _site.toString(),
                              '',
                              '',
                              country.text,
                              pincode.text);
                          if (res.status) {
                            print(res);
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
                        child: Text("Submit"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  /*  CountryCodePicker(
                    onChanged: print,
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'IT',
                    favorite: ['+39', 'FR'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ), */
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
