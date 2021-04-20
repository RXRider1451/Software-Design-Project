import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 140,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 0,
                left: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next Assignment...',
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: new BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          Expanded(
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Specialty',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Date-Time',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Location',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Colors.grey[300]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 150,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.grey,
                        ),
                        height: 10,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 10,
                right: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                              offset:
                                  Offset(0, 10), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TableCalendar(
                          calendarFormat: _calendarFormat,
                          onFormatChanged: (format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          },
                          focusedDay: DateTime.now(),
                          firstDay: DateTime.utc(
                              DateTime.now().year, DateTime.january),
                          lastDay: DateTime.utc(
                              DateTime.now().year, DateTime.december),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 200,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: Offset(0,
                                            10), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Specialty',
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '12:00 - 14:00',
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Location',
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18,
                                              color: Colors.grey[300]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
