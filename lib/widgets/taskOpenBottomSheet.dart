import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd_health_science_app/models/taskModel.dart';

class taskOpenBottomSheet extends StatelessWidget {
  TaskModel taskModel;

  taskOpenBottomSheet({@required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: taskModel.color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: taskModel.color.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                        color: Colors.white,
                      ),
                      height: 10,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('${taskModel.specialty}',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${taskModel.startTime.year}-${taskModel.startTime.month}-${taskModel.startTime.day}',
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
                      '${taskModel.location}',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.grey[300]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset('assets/images/map.PNG'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Start Task',
                    style:
                        GoogleFonts.openSans(color: Colors.black, fontSize: 20),
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          side: BorderSide.none),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.8,
    );
  }
}
