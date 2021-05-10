import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sd_health_science_app/main.dart';
import 'package:sd_health_science_app/models/taskModel.dart';
import 'package:sd_health_science_app/services/auth.dart';
import 'package:sd_health_science_app/widgets/calendeBottomSheet.dart';
import 'package:sd_health_science_app/widgets/nextAssignmentBar.dart';
import 'package:sd_health_science_app/widgets/taskListTile.dart';
import 'package:sd_health_science_app/widgets/taskOpenBottomSheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;

  GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  SharedPreferences prefs;
  String username = "";

  List<TaskModel> _dailyTasks;

  List<TaskModel> studentTasks = [
    TaskModel(
        specialty: 'Clinical Skills',
        startTime: DateTime(2021, 04, 22, 12),
        endTime: DateTime(2021, 04, 28, 2),
        location: 'Charlotte maxeke',
        description: 'Description and notes',
        color: Colors.blue),
    TaskModel(
        specialty: 'Forensics ',
        startTime: DateTime(2021, 04, 28, 12),
        endTime: DateTime(2021, 05, 05, 2),
        location: 'Bara',
        description: 'Description and notes',
        color: Colors.amber),
    TaskModel(
        specialty: 'Internal medicine',
        startTime: DateTime(2021, 04, 22, 12),
        endTime: DateTime(2021, 04, 24, 2),
        location: 'Charlotte maxeke',
        description: 'Description and notes',
        color: Colors.green),
    TaskModel(
        specialty: 'Paediatrics ',
        startTime: DateTime(2021, 04, 30, 12),
        endTime: DateTime(2021, 05, 02, 2),
        location: 'Bara',
        description: 'Description and notes',
        color: Colors.deepPurple),
    TaskModel(
        specialty: 'Surgery',
        startTime: DateTime(2021, 05, 09, 12),
        endTime: DateTime(2021, 05, 18, 2),
        location: 'Helen joseph',
        description: 'Description and notes',
        color: Colors.lime),
    TaskModel(
        specialty: 'Emergency Med',
        startTime: DateTime(2021, 05, 11, 12),
        endTime: DateTime(2021, 05, 13, 2),
        location: 'Helen joseph',
        description: 'Description and notes',
        color: Colors.teal),
    TaskModel(
        specialty: 'Gynae',
        startTime: DateTime(2021, 05, 13, 12),
        endTime: DateTime(2021, 05, 20, 2),
        location: 'Helen joseph',
        description: 'Description and notes',
        color: Colors.pink),
  ];

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _dailyTasks = _getEventsForDay(_focusedDay);
    getSharedPref();
  }

  getSharedPref() async {
    prefs = await SharedPreferences.getInstance();
    await setState(() async {
      username = await prefs.getString('username');
    });
  }

  List<TaskModel> _getEventsForDay(DateTime focusedDay) {
    List<TaskModel> results = [];

    for (TaskModel x in studentTasks) {
      //print(x.specialty);
      DateTime start =
          DateTime(x.startTime.year, x.startTime.month, x.startTime.day);
      DateTime end = DateTime(x.endTime.year, x.endTime.month, x.endTime.day);
      DateTime day =
          DateTime(focusedDay.year, focusedDay.month, focusedDay.day);
      List<DateTime> days = [];
      for (int i = 0; i <= end.difference(start).inDays; i++) {
        days.add(start.add(Duration(days: i)));
      }
      if (days.contains(day)) {
        print('yes');
        results.add(x);
      }
    }

    print('results');
    print(results);

    return results;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    print(focusedDay);
    print(selectedDay);
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _dailyTasks = _getEventsForDay(focusedDay);
        print(_dailyTasks);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(
            //   accountName: Text(username),
            //   accountEmail: Text('email'),
            //   decoration: BoxDecoration(color: Colors.black),

            // ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Lottie.asset('assets/lottie/waves.json',
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth),
                  Lottie.asset('assets/lottie/doctor.json',
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 3.3,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: Text(
                              username,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            ListTile(
              onTap: () async {},
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                'Home',
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Text(
                'About Us',
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () async {
                await _googleSignIn.signOut().then((value) {
                  setState(() {
                    prefs.setString('username', "");
                    prefs.setString('email', "");
                  });
                  print('logout');
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Auth()));
                });
              },
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                'logout',
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        backgroundColor: Colors.black,
        child: Icon(Icons.message, color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
          calenderBottomSheet(),
          nextAssignmentBar(
            nextTask: studentTasks[0],
          ),
          Positioned(
            top: 170,
            left: 10,
            right: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TableCalendar(
                      //call a funtion to display events for the day
                      onDaySelected: _onDaySelected,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },

                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        selectedDecoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                          formatButtonTextStyle: TextStyle(color: Colors.white),
                          formatButtonDecoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 0))),
                      focusedDay: _focusedDay,
                      firstDay:
                          DateTime.utc(DateTime.now().year, DateTime.january),
                      lastDay:
                          DateTime.utc(DateTime.now().year, DateTime.december),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _dailyTasks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _dailyTasks[index].color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                boxShadow: [
                                  BoxShadow(
                                    color: _dailyTasks[index]
                                        .color
                                        .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: taskListTile(
                                  taskModel: _dailyTasks[index],
                                  scaffoldKey: _scaffoldKey),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
