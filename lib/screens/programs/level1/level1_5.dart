import 'package:flutter/material.dart';
import 'package:healthensuite/utilities/constants.dart';
import 'package:healthensuite/utilities/text_data.dart';
import 'package:healthensuite/screens/programs/level1/level1_6.dart';


class MyChoice{
  String? choice;
  String? choiceValue;
  int? index;
  MyChoice({this.choice, this.index, this.choiceValue});
}


class Level1of5 extends StatefulWidget {

  static final String title = 'Level 1';
  static final sidePad = EdgeInsets.symmetric(horizontal: 18);

  @override
  _Level1of5State createState() => _Level1of5State();
}

class _Level1of5State extends State<Level1of5> {
  String patientName = "Henry";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double pad = 18;

    return Scaffold(
      appBar: AppBar(
        title: Text(Level1of5.title),
        centerTitle: true,
      ),
      bottomNavigationBar: buttomBarWidget(context),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(height: pad,),
            headerWidget(themeData),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: pad,),
                     sectionTitleWidget(themeData, text: "Sleeping pills", textStyle: themeData.textTheme.headline4),
                     Padding(
                       padding: Level1of5.sidePad,
                       child: Image.asset('assets/images/sleepPills1-img.jpg'),
                     ),
                     bodyTextWidget(themeData, text: LEVEL1_DATA["bullet12"]!),
                     bodyTextWidget(themeData, text: LEVEL1_DATA["bullet13"]!),
                     bodyTextWidget(themeData, text: LEVEL1_DATA["bullet14"]!),
                     SizedBox(height: pad,),
                     sectionTitleWidget(themeData, text: LEVEL1_DATA["subHead3"]!, textStyle: themeData.textTheme.headline5),
                      RadioGroup(),

                   ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  SafeArea buttomBarWidget(BuildContext context) {
    return SafeArea(
      child: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              navIconButton(context, buttonText: "Back", buttonActon: (){
                Navigator.of(context).pop();
              }),

              navIconButton(context, buttonText: "Next", buttonActon: (){
                 Navigator.push(
                    context, new MaterialPageRoute(builder: (context) => Level1of6())
                    );
              }),
            ],
          ),
        ),
        elevation: 100,
      ),
    );
  }

  SingleChildScrollView headerWidget(ThemeData themeData) {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                padding: Level1of5.sidePad,
                child: Text('Page 5/7',
                textAlign: TextAlign.left,
                style: themeData.textTheme.bodyText2,),
              ),
              Padding(
                padding: Level1of5.sidePad,
                child: Text('Intro. to Health enSuite Insomnia',
                textAlign: TextAlign.right,
                style: themeData.textTheme.bodyText2,),
              ),

              ],
            ),
          );
  }

  // IconButton navIconButton(BuildContext context, {IconData buttonIcon, Function buttonActon}) {
  //   return IconButton(
  //               onPressed: buttonActon,
  //               color: appItemColorBlue,
  //               icon: Icon(buttonIcon),
  //             );
  // }

  MaterialButton navIconButton(BuildContext context, {required String buttonText, Function? buttonActon}){
    return  MaterialButton(
              child: Text(buttonText, style: TextStyle(color: appItemColorBlue, fontWeight: FontWeight.w700),),
              onPressed: buttonActon as void Function()?,
            );
  }

   Padding sectionTitleWidget(ThemeData themeData, {required String text, TextStyle? textStyle} ) {
     return Padding(
                padding: Level1of5.sidePad,
                child: Text(text,
                  style: textStyle,
                ),
              );
  }

  Padding bodyTextWidget(ThemeData themeData, {required String text}) {
    return Padding(
              padding: Level1of5.sidePad,
              child: Text(text, 
                style: themeData.textTheme.bodyText1,),
            );
  }

}


class RadioGroup extends StatefulWidget {
  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String? defaultChoice = "";
    int? defaultIndex = -1; 

    List<MyChoice> choices = [
      MyChoice(index: 0, choice: "I feel confident I will be able to stick to this plan.", choiceValue: ""),
      MyChoice(index: 1, choice: "I think it will be very difficult for me to stick to this plan.", choiceValue: ""),
      MyChoice(index: 2, choice: "I don???t know what the plan is. What can I do to find out?", choiceValue: ""),
    ];

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    
    return Column(
      children: [
        Wrap(
          children: [
            Container(
              child: Column(
                children: choices.map((data) => RadioListTile(
                  title: Text('${data.choice}', style: themeData.textTheme.bodyText1,),
                  groupValue: defaultIndex,
                  value: data.index,
                  onChanged: (dynamic value){
                    setState(() {
                        defaultChoice = data.choice; 
                        defaultIndex = data.index; 
                        if(value == 0){
                          createAlertDialog(context, head: "Great!", body: "You can track your progress in the Medication Log.");
                        }
                        else if(value == 1){
                          createAlertDialog(context, head: "Change can be difficult!", body: "This app provides tools that should help make it easier for you. If you need to modify the plan please consult your health care provider.");
                        }
                        else if(value == 2){
                          createAlertDialog(context, head: "Attention!", body: "Use the medications tab on the dashboard to view your tapering schedule.");
                        }
                        print('You clicked me: $value');         
                    });
                  },
                )).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  createAlertDialog(BuildContext context, {String? head, String? body}){
     final ThemeData themeData = Theme.of(context);
    return showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          title: Text(head!, style: themeData.textTheme.headline5,),
          content: Text(body!, 
          style: themeData.textTheme.bodyText2,),
          actions: [
            MaterialButton(
              child: Text("Dismiss", style: TextStyle(color: appItemColorBlue, fontWeight: FontWeight.w700),),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
          ],
        );
      });
  }

}