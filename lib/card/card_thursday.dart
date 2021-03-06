import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vrate/rating_phy/screens/review.dart';
import '../dayselection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../login.dart';

class cardThurs extends StatefulWidget {
  @override
  _cardThursState createState() => _cardThursState();
}

class _cardThursState extends State<cardThurs> {
  CalendarController _controller;
  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
  }

  static const TextStyle White20Style = TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container( height: 5.0, color: Colors.blue[900]),
            Container(
              color: Colors.blue[900],
              padding: EdgeInsets.only(left: 20.0, right:20.0, top:30.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("VRATE",
                        style: GoogleFonts.alice(textStyle: White20Style),),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          auth.signOut().then((res) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  topRow(),

                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      new TableCalendar(

                        calendarController: _controller,
                        initialCalendarFormat: CalendarFormat.week,
                        calendarStyle: CalendarStyle(
                            weekdayStyle: TextStyle(
                              color: Colors.white,
                            ),
                            renderDaysOfWeek: false,

                            todayColor: Colors.orangeAccent,
                            selectedColor: Theme.of(context).primaryColor,
                            todayStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white,
                            )
                        ),
                      ),
                      new Positioned(
                          top: 55.0,
                          child: DaySelection()
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(8,
                    (index) => Thursday(
                  index: index,
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}

class topRow extends StatelessWidget {
  const topRow({
    Key key,
  }): super(key : key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Student's",
                style: GoogleFonts.average(textStyle:  TextStyle(
                  fontSize: 24.0,
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                ),)
            ),
            SizedBox(width: 8.0,),
            Text("Time",
                style: GoogleFonts.average(textStyle:  TextStyle(
                  fontSize: 24.0,
                  color:Colors.blue[400] ,
                  fontWeight: FontWeight.bold,
                ),)
            ),
            SizedBox(width: 2.0),
            Text("Table",
                style: GoogleFonts.average(textStyle: TextStyle(
                  fontSize: 24.0,
                  color: Colors.blue[400],
                  fontWeight: FontWeight.bold,
                ),)
            )
          ],
        ),
        Spacer(),
        Text("BATCH 3",
            style: GoogleFonts.average(textStyle: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),)
        )
      ],
    );
  }
}

class lineGen extends StatelessWidget {
  final List lines;
  const lineGen({
    Key key,
    this.lines,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(4, (index) => Container(
        height: 2.0,
        width: lines[index],
        color: Color(0xffd0d2d8),
        margin: EdgeInsets.symmetric(vertical: 14.0),
      )),
    );
  }
}


class Thursday extends StatefulWidget {
  final index;

  const Thursday({Key key, this.index}) : super(key: key);
  @override
  _ThursdayState createState() => _ThursdayState();
}

// ignore: camel_case_types
class _ThursdayState extends State<Thursday> {
  var list1 =["9:00 - 10:00", "10:00 - 11:00" , "11:15 - 12:15" , "12:15 - 13:15", "13:15 - 14:15" , "14:15 - 15:15" , "15:15 - 16:15", "16:15 - 17:15"];
  var list2 =["9:00", "10:00 " , "11:15 " , "12:15", "13:15 " , "14:15 " , "15:15 ", "16:15 "];
  var list3 =["BREAK", "EME" , "Applied Physics" , "BREAK", "Computer Programming" , "BEE" , "PCW LAB", "PCW LAB"];


  @override

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                list2[widget.index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              lineGen(
                lines: [20.0, 30.0 ,40.0, 10.0],
              ),
            ],
          ),
        ),
        SizedBox(width: 12.0),
        Flexible(
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                )
            ),
            child: Container(
              margin: EdgeInsets.only(left: 4.0),
              color:Color(0xfffcf9f5),
              padding: EdgeInsets.only(
                left: 16.0,
                top: 8.0,
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 21.0,
                    child: Row(
                      children: <Widget>[
                        Text(
                          list1[widget.index],
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    child: Text (
                      list3[widget.index],
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        switch (list3[widget.index]) {
                          case 'EME':
                            return cardThurs();
                            break;
                          case 'Applied Physics':
                            return ReviewPhy();
                            break;
                          case 'Computer Programming':
                            return cardThurs();
                            break;
                          case 'PCW LAB':
                            return cardThurs();
                            break;
                          case 'BEE':
                            return cardThurs();
                            break;
                          default:
                            return cardThurs();
                        }
                      }));
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}