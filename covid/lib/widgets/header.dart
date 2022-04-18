import 'package:covid/constant.dart';
// import 'package:covid/infoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;

  const Header(
      {Key? key,
      required this.image,
      required this.textTop,
      required this.textBottom,
      required this.offset})
      : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(),
      // clipBehavior: Clip.none,
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                print('hi');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return InfoScreen();
                //     },
                //   ),
                // );
              },
              child: SvgPicture.asset("assets/icons/menu.svg"),
            ),
            SizedBox(height: 20),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  top: (widget.offset < 0) ? 0 : widget.offset,
                  child: SvgPicture.asset(
                    widget.image,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  top: 20 - widget.offset / 2,
                  left: 150,
                  child: Text(
                    "${widget.textTop} \n${widget.textBottom}",
                    style: kHeadingTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container()
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
