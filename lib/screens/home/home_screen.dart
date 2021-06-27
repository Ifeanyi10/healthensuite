
import 'package:flutter/material.dart';
import 'package:healthensuite/api/network.dart';
import 'package:healthensuite/api/networkmodels/patientProfilePodo.dart';
import 'package:healthensuite/statemanagement/behaviourlogic.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:healthensuite/utilities/drawer_navigation.dart';
import 'package:healthensuite/utilities/text_data.dart';
import 'package:healthensuite/models/option_button.dart';
import 'package:healthensuite/screens/sleepDiary/sleep_diary.dart';
//import 'package:healthensuite/utilities/default.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  static final String title = 'Home';
  final sidePad = EdgeInsets.symmetric(horizontal: 18);

  Future<PatientProfilePodo>? patientprofile;

  @override
  void initState() {
    super.initState();
    patientprofile = ApiAccess().getPatientProfile();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);

    double pad = 18;
    return Scaffold(
      drawer: NavigationDrawerWidget(indexNum: 0,),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: FutureBuilder<PatientProfilePodo>(
          future: patientprofile,
          builder: (BuildContext context, AsyncSnapshot<PatientProfilePodo> snapshot){
            if(snapshot.hasData){
              PatientProfilePodo profile = snapshot.data!;
                return homescreenContent(profile);
            }else{
              return Container(
                child: Center(child: CircularProgressIndicator(),),
              );
            }
          },
        )


        ),
    );
  }

  //Builder Widget Below

  Widget textBody(String txt){
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: sidePad,
      child: Text(txt
        ,textAlign: TextAlign.justify, style: themeData.textTheme.bodyText2,),
    );
  }

  Widget homescreenContent(PatientProfilePodo profile){
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double pad = 18;

    SleepDiariesPODO todaysleepDiary = Workflow().getSleepDiary(profile.sleepDiaries,true,false);
    SleepDiariesPODO yesterdaysleepDiary = Workflow().getSleepDiary(profile.sleepDiaries,false,true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: pad,),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: sidePad,
            child: Text('Welcome, ${profile.firstName}!',
              textAlign: TextAlign.right,
              style: themeData.textTheme.bodyText2,),
          ),
        ),
        SizedBox(height: pad,),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: sidePad,
                    child: Text("Baseline Sleep Diary", style: themeData.textTheme.headline3,),
                  ),
                  textBody(HOME_DATA["intro"]!),
                  SizedBox(height: 5.0,),
                  Padding(
                    padding: sidePad,
                    child: Text(HOME_DATA["subhead1"]!, style: themeData.textTheme.headline4,),
                  ),
                  textBody(HOME_DATA["intro1"]!),
                  textBody(HOME_DATA["bullet1"]!),
                  textBody(HOME_DATA["bullet2"]!),
                  textBody(HOME_DATA["bullet3"]!),
                  textBody(HOME_DATA["bullet4"]!),
                  textBody(HOME_DATA["bullet5"]!),
                  textBody(HOME_DATA["bullet6"]!),
                  textBody(HOME_DATA["bullet7"]!),
                  textBody(HOME_DATA["bullet8"]!),
                  textBody(HOME_DATA["bullet9"]!),
                  textBody(HOME_DATA["description"]!),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: pad,),
        SizedBox(height: pad,),
        ((){
          if( Workflow().isSleepDiaryavailable(todaysleepDiary)) {
            return Center(
              child: OptionButton(
                text: "Complete Today\'s Sleep Diary",
                icon: Icons.menu_book,
                width: size.width * 0.90,
                buttonEvent: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => SleepDiary(sleepDiariesPODO:todaysleepDiary)));
                },
              ),
            );
          }else{
            return  SizedBox(height: 0.0,);
          }
        }()),
        SizedBox(height: pad,),
        ((){
          if( Workflow().isSleepDiaryavailable(yesterdaysleepDiary)) {
            return Center(
              child: OptionButton(
                text: "Complete Yesterday\'s Sleep Diary ",
                icon: Icons.menu_book,
                width: size.width * 0.90,
                buttonEvent: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => SleepDiary(sleepDiariesPODO:yesterdaysleepDiary)));
                },
              ),
            );
          }else{
            return  SizedBox(height: 0.0,);
          }
        }()),
        SizedBox(height: pad,),
      ],
    );
  }



}

