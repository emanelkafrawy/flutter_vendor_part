import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowTime extends StatefulWidget {
  bool isActive;
  final int price;
  final String time;
  ShowTime(
      {@required this.time,
      @required this.price,
      @required this.isActive = false});

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.isActive ? Color(0xffffc3a2) : Colors.white12),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            Text(
              widget.time,
              style: TextStyle(
                  color: widget.isActive ? Color(0xffffc3a2) : Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Text('Price \$${widget.price}',
                style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }
}
