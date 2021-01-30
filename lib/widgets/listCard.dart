import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

List _colors = [
  Colors.yellow[300],
  Colors.red[300],
  Colors.green[400],
  Colors.brown[300],
  Colors.deepOrangeAccent,
  Colors.purpleAccent[200],
  Colors.tealAccent
];

Widget listCard(
    {BuildContext context,
    String name,
    int id,
    DateTime createdOn,
    DateTime updatedOn,
    List daysOpen,
    dynamic openTime,
    dynamic closeTime,
    dynamic slotTimeSize,
    dynamic costPerSlot,
    dynamic sports}) {
  return Container(
      width: double.infinity,
      child: Card(
        shadowColor: Colors.grey[700],
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        id.toString(),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.calendarCheck,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Days of Week Open:',
                      style:
                          GoogleFonts.secularOneTextTheme().bodyText1.copyWith(
                                color: Colors.grey[800],
                                fontSize: 15,
                              ),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: [
                  for (int i = 0; i < daysOpen.length; i++)
                    Container(
                      margin: EdgeInsets.only(left: 34, top: 10, bottom: 5),
                      decoration: BoxDecoration(
                        color: _colors[i],
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      height: 35,
                      width: 45,
                      child: Center(
                        child: Text(
                          ' ${daysOpen[i]} ',
                          style: GoogleFonts.lailaTextTheme()
                              .bodyText1
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      size: 17,
                    ),
                    Column(
                      children: [
                        Text(
                          'Open Time',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          openTime.toString(),
                          style: GoogleFonts.acmeTextTheme()
                              .bodyText1
                              .copyWith(color: Colors.grey[700]),
                        )
                      ],
                    ),
                    Icon(
                      FontAwesomeIcons.clock,
                      size: 17,
                    ),
                    Column(
                      children: [
                        Text(
                          'Close Time',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          closeTime.toString(),
                          style: GoogleFonts.acmeTextTheme()
                              .bodyText1
                              .copyWith(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Slot Time Size: ',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    slotTimeSize.toString(),
                    style: GoogleFonts.acmeTextTheme()
                        .bodyText1
                        .copyWith(color: Colors.grey[700]),
                  ),
                  Container(
                    color: Colors.grey,
                    width: 1.5,
                    height: 10,
                    margin: EdgeInsets.symmetric(vertical: 20),
                  ),
                  Text(
                    'Cost Per Slot: ',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    costPerSlot.toString(),
                    style: GoogleFonts.acmeTextTheme()
                        .bodyText1
                        .copyWith(color: Colors.grey[700]),
                  )
                ],
              ),
              Container(
                color: Colors.blue[100],
                width: double.infinity,
                child: ExpandablePanel(
                  header: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('SPORTS'),
                  )),
                  expanded: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                sports['id'].toString(),
                                style: TextStyle(color: Colors.black, fontSize: 17),
                              ),
                            ),
                          ),
                          Text(
                            sports['name'],
                            style: TextStyle(color: Colors.indigo, fontSize: 16),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 15),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Image.network(
                                sports['iconWhiteUrl'],
                                height: 70,
                                width: 70,
                              ),
                            ),
                            Positioned(
                              left: 48,
                              child: Image.network(
                                sports['iconBlackUrl'],
                                height: 70,
                                width: 70,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
