import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:healthensuite/utilities/constants.dart';
import 'package:healthensuite/utilities/drawer_navigation.dart';
import 'row_item.dart';
import 'package:healthensuite/models/icon_button.dart';
import 'row_item_edit.dart';
import 'patient_name.dart';


class PatientScreen extends StatelessWidget{

  final Function onMenuTap;
  final String name;
  final String email;

  static final String title = 'My Profile';

  const PatientScreen({Key key, this.onMenuTap, this.email, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(indexNum: 1,),
      appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: appBodyColor,
        ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Center(
                    child: CircleAvatar(
                      //backgroundColor: Colors.white,
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/images/form-user.jpg'),
                    ),
                  ),
                  Divider(
                    color: appItemColorBlue,
                    height: 60.0,
                  ),
                  PatientName(patientNameText: name, buttonEvent: (){},),
                  
                  SizedBox(height: 30.0),
                  
                  RowItem(rowIcon: Icons.house, rowText: "Nova Scotia, Canada",),

                  SizedBox(height: 30.0),
                  RowItem(rowIcon: Icons.phone_android, rowText: "902-111-3333",),
                  
                  
                  SizedBox(height: 20.0),
                  RowItemEdit(rowIcon: Icons.email, rowText: email, buttonIcon: Icons.edit, buttonEvent: (){},),


                  SizedBox(height: 20.0),

                  IconUserButton(buttonText: "Change Password", buttonEvent: () {}, buttonIcon: Icons.edit,)


                ],
              ),
            ),
          ),

      ),
    );
  }
}