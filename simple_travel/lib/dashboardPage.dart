import 'package:flutter/material.dart';
import 'package:simple_travel/detailPage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Color(0xFFFD4F99),
                ),
                child: Center(
                  child: Icon(Icons.filter_list, color: Colors.white),
                ),
              ),
              Text(
                'HOME',
              ),
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Color(0xFF353535),
                ),
                child: Center(
                  child: Icon(Icons.bookmark_border, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 118,
          child: ListView(
            children: [
              _buildListItem('assets/japan.jpg', 'Japan',
                  'Explore the land of the rising sun'),
              _buildListItem('assets/canada.jpg', 'Canada',
                  'Explore the vast forests of Canada'),
              _buildListItem('assets/canada.jpg', 'Canada',
                  'Explore the vast forests of Canada'),
              _buildListItem('assets/canada.jpg', 'Canada',
                  'Explore the vast forests of Canada')
            ],
          ),
        ),
      ],
    );
  }

  _buildListItem(String imgPath, String country, String description) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Container(height: 300.0),
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken),
              ),
            ),
          ),
          Container(
            height: 300.0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    country,
                  ),
                  Text(
                    description,
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(imgPath: imgPath, title: country),
                        ),
                      );
                    },
                    child: Container(
                      height: 50.0,
                      width: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          'Explore now',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
