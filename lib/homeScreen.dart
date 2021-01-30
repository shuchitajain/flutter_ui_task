import 'package:flutter/material.dart';
import '././widgets/listCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/components/badge/gf_badge.dart';
import 'package:getflutter/shape/gf_badge_shape.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<dynamic> _data;

  Future<dynamic> apiData() async {
    String url =
        'http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?offset=0&limit=10';
    http.Response res =
        await http.get(url, headers: {'offset': '0', 'limit': '10'});

    List<dynamic> response = json.decode(res.body);
    print(response.length);
    return response;
  }

  @override
  void initState() {
    super.initState();
    _data = apiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: false,
              expandedHeight: 60,
              elevation: 0,
              backgroundColor: Colors.blue[100],
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text(
                        'Good Morning,',
                        style: GoogleFonts.acmeTextTheme().bodyText1.copyWith(color: Colors.grey[600], fontSize: 20),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Shuchita!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0.3),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: Stack(
                    children: [
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.solidBell,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      Positioned(
                        bottom: 20,
                        left: 22,
                        child: GFBadge(
                          shape: GFBadgeShape.circle,
                          color: Colors.blue,
                          size: 25,
                          child: Text('6'),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 15),
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://cdnph.upi.com/svc/sv/upi_com/6081460041737/2016/1/02d351fe8b445720cf8b1120e2fa90b8/Hotline-connects-foreigners-to-random-Swedes.jpg'),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ];
        },
        body: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            else return ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: false,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircularProgressIndicator();
                  else
                    return listCard(
                        context: context,
                        name: snapshot.data[index]['name'],
                        id: snapshot.data[index]['id'],
                        daysOpen: snapshot.data[index]['dayOfWeeksOpen'],
                        openTime: snapshot.data[index]['openTime'],
                        closeTime: snapshot.data[index]['closeTime'],
                        slotTimeSize: snapshot.data[index]['slotTimeSize'],
                        costPerSlot: snapshot.data[index]['costPerSlot'],
                      sports: snapshot.data[index]['sports'],
                    );
                });
          },
        ),
      ),
    );
  }
}
