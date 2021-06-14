import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:intl/intl.dart';
import 'package:healthensuite/models/icon_button.dart';
import 'package:healthensuite/utilities/constants.dart';
//import 'package:healthensuite/utilities/drawer_navigation.dart';
//import 'package:healthensuite/utilities/constants.dart';


class SleepDiary extends StatelessWidget {

  final Function onMenuTap;
  static final String title = 'Sleep Diary';
  final _formKey = GlobalKey<FormBuilderState>();
  TimeOfDay time;

  SleepDiary({Key key, this.onMenuTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final sidePad = EdgeInsets.symmetric(horizontal: 20);
    double pad = 18;
    String drug1 = "Chlopazine";
    String drug2 = "Oxitocine";
    List<String> hours = generateNumbers(23);
    List<String> minutes = generateNumbers(59);

    return Scaffold(
      //drawer: NavigationDrawerWidget(indexNum: 2,),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: FormBuilder(
        key: _formKey,
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: pad,),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: sidePad,
                  child: Text('2020-05-30',
                  textAlign: TextAlign.right,
                  style: themeData.textTheme.headline4,),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: pad,),

                      timeQuestion(sidePad, themeData, context, question: "What time did you get into bed last?", valName: "inBed"),

                      SizedBox(height: pad,),

                      timeQuestion(sidePad, themeData, context, question: "What time did you try to go to sleep?", valName: "tryBed"),

                      SizedBox(height: pad,),

                      hourMinute(sidePad, themeData, hours, minutes, 
                        question: "How long did it take you to fall asleep? (Please select hour then minute)", 
                        hrValName: "hrs1", mnValName: "mns1"),

                      SizedBox(height: pad,),

                      numberInput(sidePad, themeData, 
                        question: "How many times did you wake up, not counting your final awakening?", valName: "wakeTimes"),

                      SizedBox(height: pad,),

                      hourMinute(sidePad, themeData, hours, minutes, 
                        question: "In total, how long did these awakenings last? (Please select hour then minute)", 
                        hrValName: "hrs2", mnValName: "mns2"),

                      SizedBox(height: pad,),

                      timeQuestion(sidePad, themeData, context, question: "What time was your final awakening?", valName: "finAwake"),

                       SizedBox(height: pad,),

                      timeQuestion(sidePad, themeData, context, question: "What time did you get out of bed?", valName: "outBed"),

                      SizedBox(height: pad,),

                      sleepQualityChoice(sidePad, themeData),

                      SizedBox(height: pad,),

                      drugNumberInput(sidePad, themeData, 
                        question: "How much $drug1 did you take today?", valName: "drNum1"),

                      SizedBox(height: pad,),

                      drugNumberInput(sidePad, themeData, 
                        question: "How much $drug2 did you take today?", valName: "drNum2"),

                      SizedBox(height: pad,),

                      switchToMoreDrug(sidePad, themeData),

                      SizedBox(height: pad,),

                      normalTextInput(sidePad, themeData, 
                        question: "Enter the medication name", valName: "medName1"),

                      SizedBox(height: pad,),

                      drugNumberInput(sidePad, themeData, 
                        question: "Enter the amount taken", valName: "amTaken1"),

                      SizedBox(height: pad,),

                      buildFeedbackForm(sidePad, themeData),

                      SizedBox(height: pad,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconUserButton(buttonText: "Submit", buttonEvent: () {validateForm(_formKey);}, buttonIcon: Icons.arrow_forward,),
                          IconUserButton(buttonText: "Cancel", buttonEvent: () {}, buttonIcon: Icons.cancel)
                        ],
                      ),
                      SizedBox(height: pad,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onChanged: () => print("Form has changed"),
      ), 
    );
  }


  //Builder Widget below

  Padding switchToMoreDrug(EdgeInsets sidePad, ThemeData themeData) {
    return Padding(
                      padding: sidePad,
                      child: FormBuilderSwitch(
                        name: "moreDrug",
                        initialValue: false,
                        title: Text("Did you take any other medications before going to sleep?",
                          style: themeData.textTheme.headline5,),
                      ),
                    );
  }

  Padding buildFeedbackForm(EdgeInsets sidePad, ThemeData themeData){
      return Padding(
        padding: sidePad,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Anything else you would like to note:",
              style: themeData.textTheme.headline5,),
            SizedBox(height: 10,),
            Container(
              //padding: sidePad,
              height: 200.0,
              child: FormBuilderTextField(
                name: "otherNote",
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Please briefly type your note here",
                  hintStyle: themeData.textTheme.bodyText2,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: appItemColorBlue)
                    ),
                ),
              ),
            ),
          ],
        ),
      );
  }

  Padding drugNumberInput(EdgeInsets sidePad, ThemeData themeData, {String question, String valName}) {
    return Padding(
                      padding: sidePad,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(question,
                          style: themeData.textTheme.headline5,),
                          FormBuilderTextField(
                            name: valName,
                            inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            style:  themeData.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    );
  }

  Padding normalTextInput(EdgeInsets sidePad, ThemeData themeData, {String question, String valName}) {
    return Padding(
                      padding: sidePad,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(question,
                          style: themeData.textTheme.headline5,),
                          FormBuilderTextField(
                            name: valName,
                            style:  themeData.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    );
  }

  Padding numberInput(EdgeInsets sidePad, ThemeData themeData, {String question, String valName}) {
    return Padding(
                      padding: sidePad,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(question,
                          style: themeData.textTheme.headline5,),
                          FormBuilderTextField(
                            name: valName,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            //inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                            //keyboardType: TextInputType.numberWithOptions(decimal: true),
                            keyboardType: TextInputType.number,
                            style:  themeData.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    );
  }

  Padding hourMinute(EdgeInsets sidePad, ThemeData themeData, List<String> hours, List<String> minutes, {String question, String hrValName, String mnValName}) {
    return Padding(
              padding: sidePad,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(question,
                    style: themeData.textTheme.headline5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FormBuilderDropdown(
                          name: hrValName,
                          hint: Text("Select hours"),
                          style:  themeData.textTheme.bodyText1,
                          items: hours.map((hr) => DropdownMenuItem(
                            child: Text("$hr"),
                            value: hr,
                            ),
                          ).toList(),
                        ),
                      ),
                      Expanded(
                        child: FormBuilderDropdown(
                          name: mnValName,
                          hint: Text("Select Minutes"),
                          style:  themeData.textTheme.bodyText1,
                          items: minutes.map((mn) => DropdownMenuItem(
                            child: Text("$mn"),
                            value: mn,
                            ),
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
  }

  Padding sleepQualityChoice(EdgeInsets sidePad, ThemeData themeData) {
    return Padding(
              padding: sidePad,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Please rate the overall quality of your sleep:',
                  style: themeData.textTheme.headline5,),
                  FormBuilderChoiceChip(
                    name: "spQuality", 
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 4,
                    // decoration: InputDecoration(
                    //   labelText: "Please rate the overall quality of your sleep:",
                    //   labelStyle: themeData.textTheme.headline4,
                    // ),
                    options: [
                      FormBuilderFieldOption(child: Text("Very Poor"), value: "Very Poor",),
                      FormBuilderFieldOption(child: Text("Poor"), value: "Poor",),
                      FormBuilderFieldOption(child: Text("Fair"), value: "Fair",),
                      FormBuilderFieldOption(child: Text("Good"), value: "Good",),
                      FormBuilderFieldOption(child: Text("Very Good"), value: "Very Good",),
                    ]
                  ),
                ],
              ),
            );
  }

  Padding timeQuestion(EdgeInsets sidePad, ThemeData themeData, BuildContext context, {String question, String valName}) {
    return Padding(
              padding: sidePad,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(question,
                  style: themeData.textTheme.headline5,),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: valName,
                          initialValue: getText(_formKey, time, valName),
                          readOnly: true,
                          style: themeData.textTheme.bodyText1,
                        ),
                      ),
                      IconButton(
                        onPressed: () => pickTime(context, _formKey, valName, time),
                        icon: Icon(Icons.lock_clock),
                        color: appItemColorBlue,
                      ),
                    ],
                  ),
                  
                ],
              ),
            );
  }

  Future pickTime(BuildContext context, GlobalKey<FormBuilderState> key, String valName, TimeOfDay time) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    time = newTime;
    print("New Time $time");
    getText(key, time, valName);
  }

  String getText(GlobalKey<FormBuilderState> key, TimeOfDay time, String valName) {
    String timeVal = "Select Time";    
    if (time == null) {
      return timeVal;
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');
      timeVal = '$hours:$minutes';
      key.currentState.fields[valName].didChange(timeVal);
      return timeVal;
    }
  }

  void validateForm(GlobalKey<FormBuilderState> key){
        if(key.currentState.saveAndValidate()){
          //key.currentState.save();
          print(key.currentState.value);
          //key.currentState.reset();
          String myVal = key.currentState.fields["spQuality"].value;
          print("Its value: $myVal");
        }
  }

  List<String> generateNumbers(int endNum){
    List<String> nums = [];
    for(int i = 0; i <= endNum; i++){
      nums.add(i.toString());
    }
    return nums;
  }

}