import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd_health_science_app/models/taskModel.dart';
import 'package:sd_health_science_app/widgets/taskOpenBottomSheet.dart';

class taskListTile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final TaskModel taskModel;

  taskListTile({@required this.scaffoldKey, @required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        scaffoldKey.currentState
            .showBottomSheet((context) => taskOpenBottomSheet(
                  taskModel: taskModel,
                ));
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            taskModel.specialty,
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
          ),
          Text(
            '${taskModel.startTime.hour}:${taskModel.startTime.minute} - ${taskModel.endTime.hour}:${taskModel.endTime.minute}',
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Text(
            '${taskModel.location}',
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.grey[300]),
          ),
        ],
      ),
    );
  }
}
