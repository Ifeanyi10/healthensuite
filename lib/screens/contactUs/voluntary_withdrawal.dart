import 'package:flutter/material.dart';
import 'package:healthensuite/utilities/drawer_navigation.dart';
import 'package:healthensuite/utilities/constants.dart';
import 'package:healthensuite/models/icon_button.dart';


class VoluntaryWithdrawal extends StatelessWidget{

  final Function onMenuTap;
    static final String title = 'Voluntary Withdrawal';
    static final sidePad = EdgeInsets.symmetric(horizontal: 18);


  const VoluntaryWithdrawal({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double pad = 18;
    return Scaffold(
      drawer: NavigationDrawerWidget(indexNum: 7,),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: pad,),
              Padding(
                padding: sidePad,
                child: Text("To withdraw from the program, please contact us:", style: themeData.textTheme.headline4,),
              ),
              SizedBox(height: pad,),
              Padding(
                padding: sidePad,
                child: Text("By Email: TeamHealthEnSuite@iwk.nshealth.ca", style: themeData.textTheme.headline5,),
              ),
              SizedBox(height: pad,),
              Padding(
                padding: sidePad,
                child: Text("By Phone: (902) 470 7934 or call toll-free number: 1-877-341-8309 press 5", style: themeData.textTheme.headline5,),
              ),
              SizedBox(height: pad,),
              Center(
                child: Text("OR", style: themeData.textTheme.headline4,),
              ),
              SizedBox(height: pad,),
              Padding(
                padding: sidePad,
                child: Text("Fill and submit withdrawal note below", style: themeData.textTheme.headline5,),
              ),
              buildNoteForm(context),
              Center(
                child: IconUserButton(buttonText: "Submit Withdrawal Note", buttonEvent: () {createAlertDialog(context);}, buttonIcon: Icons.note,)
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Builder Widget Below

   buildNoteForm(BuildContext context){
    final ThemeData themeData = Theme.of(context);
      return Container(
        padding: sidePad,
        height: 200.0,
        child: TextField(
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Please enter withdrawal note here",
            hintStyle: themeData.textTheme.bodyText2,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: appItemColorBlue)
              ),
          ),
        ),
      );
  }

  createAlertDialog(BuildContext context){
     final ThemeData themeData = Theme.of(context);
    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Want to go ahead and withdraw?", style: themeData.textTheme.headline5,),
          content: Text("You will loose login access on the app and be removed from the program once you submit this note.", 
          style: themeData.textTheme.bodyText2,),
          actions: [
            MaterialButton(
              child: Text("Submit", style: TextStyle(color: appItemColorBlue, fontWeight: FontWeight.w700),),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
          ],
        );
      });
  }

}