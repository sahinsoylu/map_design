import 'package:design/theme/theme.dart';
import 'package:design/utilities/responsive.dart';
import 'package:design/widgets/nearby_place_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 4,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: CustomTheme.windsweptBeach,
            )),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Nearby (${DummyData().dummyData.length})",
              style: GoogleFonts.aBeeZee(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: CustomTheme.imperialPrimer,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Responsive.heightPercent(context, 48),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
                itemCount: DummyData().dummyData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: NearbyTile(
                      directUp: (text) {},
                      starCount: double.parse(
                          DummyData().dummyData[index]["star_count"]!),
                      icon: Image.network(
                          DummyData().dummyData[index]["logo_url"]!),
                      text: DummyData().dummyData[index]["name"]!,
                      isOpen:
                          bool.parse(DummyData().dummyData[index]["is_open"]!),
                      location: DummyData().dummyData[index]["location"]!,
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}

class DummyData {
  final List<Map<String, String>> dummyData = [
    {
      "name": "FEX Express",
      "star_count": "4.5",
      "is_open": "true",
      "location": "Istanbul, Türkiye",
      "logo_url": "https://picsum.photos/200",
    },
    {
      "name": "FedEx Express",
      "star_count": "3.5",
      "is_open": "false",
      "location": "Memphis, Tennessee, United States",
      "logo_url": "https://picsum.photos/200",
    },
  ];
}
