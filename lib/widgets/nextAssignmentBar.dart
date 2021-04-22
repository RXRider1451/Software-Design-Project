import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd_health_science_app/models/taskModel.dart';
import 'package:intl/intl.dart';

class nextAssignmentBar extends StatelessWidget {
  TaskModel nextTask;

  nextAssignmentBar({@required this.nextTask});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            '${nextTask.specialty}',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white),
                            maxLines: 1,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${DateFormat('dd-MM-yy').format(nextTask.startTime)}',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${nextTask.location}',
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
    );
  }
}
