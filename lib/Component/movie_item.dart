import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor_app/Screens/DetailsScreen.dart';
import 'package:vendor_app/Services/crud.dart';

// ignore: must_be_immutable
class MovieItem extends StatelessWidget {
  final String title;
  final int numberOfSeats;
  final String movieImage;
  final DocumentSnapshot movieId;
  crudMethods crudObj = new crudMethods();
  MovieItem({this.title, this.movieImage, this.numberOfSeats, this.movieId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  id: movieId,
                ));
        Navigator.pushReplacement(context, route);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFFa2bfbd),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image(
              height: 180,
              width: 180,
              image: NetworkImage(
                movieImage,
              ),
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                RawMaterialButton(
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      gradient: LinearGradient(
                        colors: [Color(0xFFffc3a2), Color(0xFF425c5a)],
                      ),
                    ),
                    child: Icon(Icons.remove),
                  ),
                  onPressed: () {
                    // ignore: deprecated_member_use
                    crudObj.deleteData(movieId.documentID);
                  },
                  shape: CircleBorder(),
                  fillColor: Color(0xFFa2bfbd),
                  constraints: BoxConstraints.tightFor(
                    width: 30.0,
                    height: 30.0,
                  ),
                  elevation: 0.0,
                ),
              ],
            ),
            Text(numberOfSeats.toString() + ' Seats is booked'),
          ],
        ),
      ),
    );
  }
}
