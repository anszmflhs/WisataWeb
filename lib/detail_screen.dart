import 'package:flutter/material.dart';
import 'package:wisata_web/Model/tempat_wisata.dart';

class DetailScreen extends StatelessWidget {
  final TempatWisata place;
  DetailScreen({required this.place});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints contsraint) {
      if (contsraint.maxWidth > 800) {
        return DetailWeb(placedetailweb: place);
      } else {
        return DetailMobile(placedetailmobile: place);
      }
    });
  }
}

class DetailWeb extends StatelessWidget {
  late final TempatWisata placedetailweb;

  DetailWeb({required this.placedetailweb});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Wisata',
          style: TextStyle(
              fontSize: 32,
              fontFamily: 'Staatliches',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(placedetailweb.imageAsset),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 150,
                    padding: EdgeInsets.only(bottom: 16),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: placedetailweb.imageUrls.map((jadiimageurl) {
                        return Padding(
                          padding: EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(jadiimageurl),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          placedetailweb.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Oxygen',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          SizedBox(height: 8),
                          Text(
                            placedetailweb.openDays,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.timer),
                          SizedBox(height: 8),
                          Text(
                            placedetailweb.openTime,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.monetization_on),
                          SizedBox(height: 8),
                          Text(
                            placedetailweb.ticketPrice,
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          placedetailweb.description,
                          style: TextStyle(fontSize: 16, fontFamily: 'Oxygen'),
                        ),
                      ),
                      FavoriteButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class DetailMobile extends StatelessWidget {
  late final TempatWisata placedetailmobile;

  DetailMobile({required this.placedetailmobile});

  var fontOxygen = TextStyle(fontFamily: 'Oxygen', fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //mengikuti besaran status bar di setiap device
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(placedetailmobile.imageAsset),
                  SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  )),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Text(
                    placedetailmobile.name,
                    style: TextStyle(
                        fontFamily: 'Staatliches',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8),
                        Text(
                          placedetailmobile.openDays,
                          style: TextStyle(fontFamily: 'Staatliches'),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.timer),
                        SizedBox(height: 8),
                        Text(placedetailmobile.openTime,
                        style: TextStyle(fontFamily: 'Staatliches'),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.money_rounded),
                        SizedBox(height: 8),
                        Text(placedetailmobile.ticketPrice,
                          style: TextStyle(fontFamily: 'Staatliches'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(40),
                child: Text(placedetailmobile.description,
                    textAlign: TextAlign.center),
              ),
              Container(
                  height: 200,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: placedetailmobile.imageUrls.map((urlgambar) {
                        return Padding(
                          padding: EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(urlgambar),
                          ),
                        );
                      }).toList())),
            ],
          ),
        ),
      ),
    );
  }
}

//Circle Avatar Buat Nambahin Icon Button/Profile

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
