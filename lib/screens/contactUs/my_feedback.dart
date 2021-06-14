import 'package:flutter/material.dart';
import 'package:healthensuite/utilities/drawer_navigation.dart';
import 'package:healthensuite/utilities/constants.dart';
import 'package:healthensuite/models/icon_button.dart';

class MyChoice{
  String choice;
  int index;
  MyChoice({this.choice, this.index});
}


class MyFeedback extends StatefulWidget{

  final Function onMenuTap;

  static final String title = 'My Feedback';
  static final sidePad = EdgeInsets.symmetric(horizontal: 18);

  const MyFeedback({Key key, this.onMenuTap}) : super(key: key);

  @override
  _MyFeedbackState createState() => _MyFeedbackState();
}

class _MyFeedbackState extends State<MyFeedback> {
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double pad = 18;
    
    return Scaffold(
      drawer: NavigationDrawerWidget(indexNum: 6,),
      appBar: AppBar(
        title: Text(MyFeedback.title),
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
                padding: MyFeedback.sidePad,
                child: Text("Please select the type of the feedback", style: themeData.textTheme.headline6,),
              ),
              RadioGroup(),
              Padding(
                padding: MyFeedback.sidePad,
                child: Text("Fill and submit suggestion note below", style: themeData.textTheme.headline5,),
              ),
              buildFeedbackForm(),
              //SizedBox(height: pad,),
              //Spacer(),
              Center(
                child: IconUserButton(buttonText: "Submit Your Feedback", buttonEvent: () {}, buttonIcon: Icons.feedback,)
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Builder Widget Below

  buildFeedbackForm(){
    final ThemeData themeData = Theme.of(context);
      return Container(
        padding: MyFeedback.sidePad,
        height: 200.0,
        child: TextField(
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Please briefly describe your feedback here",
            hintStyle: themeData.textTheme.bodyText2,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: appItemColorBlue)
              ),
          ),
        ),
      );
  }


}

class RadioGroup extends StatefulWidget {
  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String defaultChoice = "Happy";
    int defaultIndex = 0; 

    List<MyChoice> choices = [
      MyChoice(index: 0, choice: "Happy"),
      MyChoice(index: 1, choice: "Report a bug"),
      MyChoice(index: 2, choice: "Make enquiry"),
      MyChoice(index: 3, choice: "Other"),
    ];

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Wrap(
          children: [
            Container(
              child: Column(
                children: choices.map((data) => RadioListTile(
                  title: Text('${data.choice}'),
                  groupValue: defaultIndex,
                  value: data.index,
                  onChanged: (value){
                    setState(() {
                        defaultChoice = data.choice; 
                        defaultIndex = data.index; 
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
}