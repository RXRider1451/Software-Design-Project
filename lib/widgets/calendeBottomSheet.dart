import 'package:flutter/material.dart';

class calenderBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
      ],
    );
  }
}
