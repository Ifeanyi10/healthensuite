import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'text_section.dart';

class LoginInput extends StatelessWidget{
  final String plainText;
  final String actionText;
  final String hintText;
  final String hintText2;
  final String labelText;
  final String labelText2;
  final TextInputType textInputType;
  final TextInputType textInputType2;
  final bool hideText;
  final bool hideText2;

  final Function? selectHandler;
  final Function? selectUsernameValidateHandler;
  final Function? selectPasswordValidateHandler;
  final formKey = new GlobalKey<FormState>();
  String? _value1,_value2;
  

  LoginInput({this.hintText = "Enter Your Username", this.hintText2 = "Enter Your Password", 
    this.labelText = "Username", this.labelText2 = "Password", this.textInputType = TextInputType.emailAddress,
    this.textInputType2 = TextInputType.text, this.plainText = "Forgot your password?", 
    this.actionText = "Reset it now", this.hideText = false, this.hideText2 = true, this.selectHandler, 
    this.selectUsernameValidateHandler, this.selectPasswordValidateHandler});


  @override
  Widget build(BuildContext context) {
    return new Theme(
              data: new ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.blue,
                inputDecorationTheme: new InputDecorationTheme(
                focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent)
                ),
                  // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                  labelStyle:
                      new TextStyle(color: Colors.white60, fontSize: 25.0),
                )),
              // isMaterialAppTheme: true,
              
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Form(
                        autovalidateMode: AutovalidateMode.always,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new TextFormField(
                              validator: (val) => !val!.contains("@") ? "Username is not a valid email" : null,
                              onSaved: (val) => _value1 = val,
                              decoration: new InputDecoration(
                                  //icon: Icon(Icons.person),
                                  hintText: hintText,
                                  labelText: labelText,
                                  fillColor: Colors.white),
                              keyboardType: textInputType,
                              obscureText: hideText,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                            ),
                            new TextFormField(
                              validator: (val) => val!.length < 6  ? "Password length should be Greater than 6" : null,
                              onSaved: (val) => _value2 = val,
                              decoration: new InputDecoration(
                                //icon: Icon(Icons.panorama_fish_eye),
                                hintText: hintText2,
                                labelText: labelText2,
                              ),
                              obscureText: hideText2,
                              keyboardType: textInputType2,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                            ),
                            new MaterialButton(
                              height: 50.0,
                              minWidth: 150.0,
                              color: Colors.blueAccent,
                              splashColor: Colors.teal,
                              textColor: Colors.white,
                              child: new Icon(FontAwesomeIcons.signInAlt),
                              onPressed: selectHandler as void Function()?,
                            )
                          ],
                        ),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 40.0),),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextSection(myText: plainText, lPad: 0.0, tPad: 0.0, fontWeight: FontWeight.normal, fontSize: 18.0, color: Colors.white60),
                        
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            //Navigator.of(context).pushNamed('/signup');
                          },
                          child: TextSection(myText: actionText, lPad: 0.0, tPad: 0.0, color: Colors.blueAccent, fontSize: 18.0, textDecoration: TextDecoration.underline,),
                        ),                 
                      ],
                    )
                  ],
                ),
              
              );
  }

  validateUsername(String val) => !val.contains("@") ? "Username is not a valid email" : null;

  validateassword(String val) => val.length < 6  ? "Password length should be Greater than 6" : null;

  signInPatient(){
    // if(formKey.currentState.validate()) {
    //   formKey.currentState.save();
    //   print("Sign in successfull");
    // }
     print("Sign in successfull");
  }

}


// class LoginPage extends StatefulWidget {
//   @override
//   State createState() => new LoginPageState();
// }

// class LoginPageState extends State<LoginPage>{

//   @override
//   Widget build(BuildContext context) {

//     //var blueGrey = Colors.blueGrey;
    
//     signInPatient(){
//       print("Sign in successfull");
//     }


//     return new Scaffold(
//       backgroundColor: Colors.black87,
//       body: new Stack(fit: StackFit.expand, children: <Widget>[
//         new Background("assets/images/girl.jpg"),
//         SingleChildScrollView(
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget> [
//               // new Image(
//               //   image: new AssetImage("assets/images/logo-text.png")
//               //   ),
//               //   new Text("Health enSuite"),

//               new NameLogo(),
//               new LoginInput(selectHandler: signInPatient,),
              
//             ],
//           ),
//         ),
        
//       ]
//       ),
//     );
//   }
// }