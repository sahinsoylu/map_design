import 'package:design/theme/theme.dart';
import 'package:design/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rate/rate.dart';

class NearbyTile extends StatelessWidget {
  const NearbyTile({
    super.key,
    required this.icon,
    required this.text,
    required this.isOpen,
    required this.location,
    required this.starCount,
    required this.directUp,
  });

  final Widget icon;
  final String text;
  final bool isOpen;
  final String location;
  final double starCount;
  final void Function(String text) directUp;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: CustomTheme.windsweptBeach),
          height: 70,
          width: 70,
          child: icon,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _title(),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Rate(
                            color: CustomTheme.samoanSun,
                            allowHalf: true,
                            initialValue: starCount,
                            readOnly: true,
                          ),
                          SizedBox(width: Responsive.widthPercent(context, 2)),
                          Text(
                            "($starCount)",
                            style: GoogleFonts.aBeeZee(
                              fontSize: 15,
                              color: CustomTheme.greatFalls,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      _isOpen(),
                    ],
                  ),
                  SizedBox(
                    width: Responsive.widthPercent(context, 15),
                  ),
                  _directUp(),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              _location(context),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox _location(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 112,
      child: Text(
        location,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.aBeeZee(
          color: CustomTheme.imperialPrimer,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Text _title() {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic),
    );
  }

  Row _isOpen() {
    return Row(
      children: [
        Text(
          "Today : ",
          style: GoogleFonts.aBeeZee(
            color: CustomTheme.carbonFootprint,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
        isOpen
            ? Text("Open Now",
                style: GoogleFonts.aBeeZee(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic))
            : Text(
                "Close Now",
                style: GoogleFonts.aBeeZee(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
              )
      ],
    );
  }

  InkWell _directUp() {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        directUp.call(text);
      },
      child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              border: Border.all(color: CustomTheme.windsweptBeach),
              borderRadius: BorderRadius.circular(100)),
          child: Image.asset("assets/png/direct-up.png")),
    );
  }
}
