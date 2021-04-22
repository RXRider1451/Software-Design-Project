import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd_health_science_app/models/taskModel.dart';
import 'package:sd_health_science_app/widgets/calendeBottomSheet.dart';
import 'package:sd_health_science_app/widgets/nextAssignmentBar.dart';
import 'package:sd_health_science_app/widgets/taskListTile.dart';
import 'package:sd_health_science_app/widgets/taskOpenBottomSheet.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;

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
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
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
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
