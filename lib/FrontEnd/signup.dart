import 'package:flutter/material.dart';
// import './dropdown.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
// import homepage

// dependacies
// table_calendar: ^3.0.5
// intl: ^0.17.0

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog(
      {Key? key, required this.items, required this.initialSelectedValues})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        TextButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked!),
    );
  }
}

// // void _showMultiSelect(BuildContext context) async {
// //   clubs = [];
// //   // clubsinlist = {};
// //   populateclubs();
// //   final items = clubsinlist;

// //   final selectedValues = await showDialog<Set<int>>(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return MultiSelectDialog(
// //         items: clubs,
// //         initialSelectedValues: [1].toSet(),
// //       );
// //     },
// //   );

//   print(selectedValues);
//   //prnts selected values on console
//   //will need to add different function to save them
//   //getvaluefromkey(selectedValues!);
// }

// void getvaluefromkey(Set selection) {
//   if (selection != null) {
//     for (int i in selection.toList()) {
//       print(clubsinlist[i]);
//     }
//     ;
//   }
// }

class signupPage extends StatefulWidget {
  createState() {
    return signupPageState();
  }
}

class signupPageState extends State<signupPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String name = '';
  String DOB = ''; // calender // authentication min 18
  late DateTime _dateTime;
  String phoneno = '';
  String email = '';
  String org = '';
  String city = 'Student';
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  String designation = 'Software Developer';

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 40.0,
          centerTitle: true,
          title: Text(
            'More Information',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.blue,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 150.0,
                  bottom: 120.0,
                  left: 20.0,
                  right: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                        //child: DOBField(),
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(top: 10.0, left: 50),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         'Branch:     ',
                      //         style: TextStyle(
                      //           color: Colors.black38,
                      //           fontSize: 20.0,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       // Container(
                      //       //   margin: EdgeInsets.only(left: 10),
                      //       //   child: branchField(),
                      //       // ),
                      //     ],
                      //   ),
                      //   // padding: EdgeInsets.only(
                      //   //   right: 140.0,
                      //   //   // left: 20.0,
                      //   // ),
                      // ),

                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                        child: nameField(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                        child: mobileField(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                        child: emailField(),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 40),
                        child: Row(children: [
                          Text(
                            'Organisation: PEC',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //   Container(
                          //     margin: EdgeInsets.only(left: 20),
                          //     child: organisation(),
                          //   ),
                          // ],
                        ]),
                        // padding: EdgeInsets.only(
                        //   right: 140.0, // effects sign up as:
                        //   // left: 20.0,
                        // ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 40),
                        child: Row(children: [
                          Text(
                            'City: Chandigarh',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //   Container(
                          //     margin: EdgeInsets.only(left: 10),
                          //     child: cityField(),
                          //   ),
                          // ],
                        ]),

                        // padding: EdgeInsets.only(
                        //   right: 140.0,
                        //   // left: 20.0,
                        // ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                      //   child: passwordField(),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 10.0, left: 20, right: 40),
                      //   child: confirmpasswordField(),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 10.0, left: 50),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         'Designation:  ',
                      //         style: TextStyle(
                      //           color: Colors.black38,
                      //           fontSize: 20.0,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       Container(
                      //         margin: EdgeInsets.only(left: 10),
                      //         child: designationField(),
                      //       ),
                      //     ],
                      //   ),
                      //   // margin: EdgeInsets.only(top: 10),
                      //   // padding: EdgeInsets.only(
                      //   //   right: 115.0,
                      //   //   // left: 20.0,
                      //   // ),
                      // ),
                      // // Container(
                      // //   margin: EdgeInsets.only(
                      // //     top: 10.0,
                      // //   ),
                      // //   child: clubsandsocietiesField(),
                      // // ),
                      Container(margin: EdgeInsets.only(top: 20.0)),
                      submitButton(),
                      Container(margin: EdgeInsets.only(top: 40.0)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mobileField() {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        labelText: 'Phone no.',
        icon: Icon(
          Icons.phone,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'your phone no',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value!.length != 10) {
          return 'Please enter a valid phone number!';
        }
      },
      // onSaved: (value) {
      //   requestModel.PhoneNumber = value!;
      //   phoneno = value;
      // },
    );
  }

  Widget nameField() {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        labelText: 'Name',
        icon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'name',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value!.length <= 0) {
          return 'Please enter your name!';
        }
      },
      // onSaved: (value) {
      //   name = value!;
      //   requestModel.Name = value;
      // },
    );
  }

  // Widget DOBField() {
  //   DateTime now = DateTime.now();
  //   String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  //   return Column(children: <Widget>[
  //     Text(_dateTime == null ? 'Enter Date Of Birth' : formattedDate),
  //     ElevatedButton(
  //         onPressed: () {
  //           showDatePicker(
  //                   context: context,
  //                   initialDate: _dateTime == null ? DateTime.now() : _dateTime,
  //                   firstDate: DateTime(1900),
  //                   lastDate: DateTime(2004))
  //               .then((value) {
  //             setState(() {
  //               _dateTime = value!;
  //             });
  //           });
  //         },
  //         child: Text('DOB'))
  //   ]);
  // }

  Widget emailField() {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        labelText: 'Email Address',
        icon: Icon(
          Icons.email,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'example@pec.edu.in',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (!value!.contains('@pec.edu.in')) {
          return 'please enter a valid email id!';
        }
      },
      // onSaved: (value) {
      //   email = value!;
      //   requestModel.email = value;
      // },
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: password,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        labelText: 'Password',
        icon: Icon(
          Icons.lock,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'password',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value!.length < 8) {
          return 'password must be atleast 8 characters long';
        }
      },
    );
  }

  Widget confirmpasswordField() {
    return TextFormField(
      controller: confirm_password,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        labelText: 'Confirm Password',
        icon: Icon(
          Icons.lock,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        hintText: 'your password',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16.0,
        ),
      ),
      validator: (value) {
        if (value! != password.text) {
          return "passwords don't match!";
        }
      },
      // onSaved: (value) {
      //   // password = value!;
      //   requestModel.password = value!;
      // },
    );
  }

  Widget cityField() {
    // requestModel.SignUpAs = 'Student';
    // String value = '';
    // String newValue = '';
    return Text('Chandigarh');
    // return DropdownButton<String>(
    //   value: city.isNotEmpty ? city : null,
    //   icon: Icon(Icons.keyboard_arrow_down_outlined),
    //   iconSize: 15,
    //   iconDisabledColor: Colors.grey.shade400,
    //   iconEnabledColor: Colors.black87,
    //   hint: Text('signup as'),
    //   style: TextStyle(
    //     fontSize: 15.0,
    //     color: Colors.black,
    //   ),
    //   underline: Container(
    //     color: Colors.purple,
    //     height: 1.0,
    //   ),
    //   onChanged: (newValue) {
    //     setState(() {
    //       city = newValue!;
    //       // requestModel.SignUpAs = newValue;
    //       print(newValue);
    //     });
    //   },
    //   items: ['Chandigarh', 'Mohali', 'Zirakpur', 'Panchkula']
    //       .map<DropdownMenuItem<String>>(
    //     (String value) {
    //       return DropdownMenuItem<String>(
    //         value: value,
    //         child: Text(value),
    //       );
    //     },
    //   ).toList(),
    // );
  }

  Widget organisation() {
    // String value = '';
    // String newValue = '';
    return Text('Punjab Engineering College');
    // return DropdownButton<String>(
    //   value: org.isNotEmpty ? org : null,
    //   icon: Icon(Icons.keyboard_arrow_down_outlined),
    //   iconSize: 15,
    //   iconDisabledColor: Colors.grey.shade400,
    //   iconEnabledColor: Colors.black87,
    //   hint: Text('Select Organisation'),
    //   style: TextStyle(
    //     fontSize: 15.0,
    //     color: Colors.black,
    //   ),
    //   underline: Container(
    //     color: Colors.purple,
    //     height: 1.0,
    //   ),
    //   onChanged: (newValue) {
    //     setState(() {
    //       org = newValue!;
    //     });
    //   },
    //   items: [
    //     'Punjab Engineering College',
    //     'IIT Delhi',
    //     'Punjab University',
    //     'IIT Ropar',
    //   ].map<DropdownMenuItem<String>>(
    //     (String value) {
    //       return DropdownMenuItem<String>(
    //         value: value,
    //         child: Text(value),
    //       );
    //     },
    //   ).toList(),
    // );
  }

  // Widget branchField() {
  //   // requestModel.Branch = 'cse';
  //   return DropdownButton<String>(
  //     value: branch,
  //     icon: Icon(Icons.keyboard_arrow_down_outlined),
  //     iconSize: 15,
  //     iconDisabledColor: Colors.grey.shade400,
  //     iconEnabledColor: Colors.black87,
  //     hint: Text('Select branch'),
  //     style: TextStyle(
  //       fontSize: 15.0,
  //       color: Colors.black,
  //     ),
  //     underline: Container(
  //       color: Colors.purple,
  //       height: 1.0,
  //     ),
  //     onChanged: (newValue) {
  //       setState(() {
  //         branch = newValue!;
  //         // requestModel.Branch = newValue;
  //         print(newValue);
  //       });
  //     },
  //     items: [
  //       'cse',
  //       'ee',
  //       'ece',
  //       'aero',
  //       'civil',
  //       'mech',
  //       'prod',
  //       'meta',
  //     ].map<DropdownMenuItem<String>>(
  //       (String value) {
  //         return DropdownMenuItem<String>(
  //           value: value,
  //           child: Text(value),
  //         );
  //       },
  //     ).toList(),
  //   );
  // }

  Widget designationField() {
    // String value = '';
    // String newValue = '';
    return Text('Manager');
    // return DropdownButton<String>(
    //   value: designation.isNotEmpty ? designation : null,
    //   icon: Icon(Icons.keyboard_arrow_down_outlined),
    //   iconSize: 15,
    //   iconDisabledColor: Colors.grey.shade400,
    //   iconEnabledColor: Colors.black87,
    //   hint: Text('signup as'),
    //   style: TextStyle(
    //     fontSize: 15.0,
    //     color: Colors.black,
    //   ),
    //   underline: Container(
    //     color: Colors.purple,
    //     height: 1.0,
    //   ),
    //   onChanged: (newValue) {
    //     setState(() {
    //       designation = newValue!;
    //     });
    //   },
    //   items: ['Software Developer', 'Manager', 'Accountant', 'Intern']
    //       .map<DropdownMenuItem<String>>(
    //     (String value) {
    //       return DropdownMenuItem<String>(
    //         value: value,
    //         child: Text(value),
    //       );
    //     },
    //   ).toList(),
    // );
  }

  // Widget clubsandsocietiesField() {
  //   return TextButton(
  //     onPressed: () => _showMultiSelect(context),
  //     child: Row(
  //       children: [
  //         Text(
  //           'Select your clubs and societies!',
  //           style: TextStyle(
  //             color: Colors.black38,
  //             fontSize: 20.0,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         Icon(
  //           Icons.arrow_drop_down_outlined,
  //           color: Colors.black,
  //           size: 15,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: EdgeInsets.all(15.0),
        textStyle: TextStyle(
          color: Colors.white10,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        print('ok'); // to change
        // Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => homePage()));
      },
      child: Text('Submit'),
    );
  }
}
