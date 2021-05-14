import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd_health_science_app/models/taskModel.dart';

class taskOpenBottomSheet extends StatefulWidget {
  TaskModel taskModel;

  taskOpenBottomSheet({@required this.taskModel});

  @override
  _taskOpenBottomSheetState createState() => _taskOpenBottomSheetState();
}

class _taskOpenBottomSheetState extends State<taskOpenBottomSheet>
    with TickerProviderStateMixin {
  bool task = false;

  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.taskModel.color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: widget.taskModel.color.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 0),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.7,
          child: ListView(
            children: [
              Column(
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
                    title: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text('${widget.taskModel.specialty}',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${widget.taskModel.startTime.year}-${widget.taskModel.startTime.month}-${widget.taskModel.startTime.day}',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${widget.taskModel.location}',
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      //Here goes the same radius, u can put into a var or function
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset('assets/images/map.PNG'),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // LinearProgressIndicator(
                  //   backgroundColor: Colors.blueGrey,
                  //   valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  //   value: controller.value,
                  //   semanticsLabel: 'Linear progress indicator',
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          task = !task;
                        });
                      },
                      child: Text(
                        task == false ? 'Start Task' : "End Task",
                        style: GoogleFonts.openSans(
                            color: task == false ? Colors.black : Colors.white,
                            fontSize: 20),
                      ),
                      style: ButtonStyle(
                        // foregroundColor:
                        //     MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: task == false
                            ? DateTime.now().day ==
                                    widget.taskModel.startTime.day
                                ? MaterialStateProperty.all<Color>(Colors.white)
                                : MaterialStateProperty.all<Color>(Colors.grey)
                            : MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              side: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.7,
    );
  }
}
