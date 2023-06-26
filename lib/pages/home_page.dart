import 'package:design/theme/theme.dart';
import 'package:design/utilities/responsive.dart';
import 'package:design/widgets/bottom_nav_bar.dart';
import 'package:design/widgets/bottom_sheet.dart';
import 'package:design/widgets/sort_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MapController mapController;
  double lat = 41.015137;
  double long = 28.979530;
  LatLng point = LatLng(41.015137, 28.979530);
  int activeItem = 0;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(center: point, zoom: 15),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                  minZoom: 1,
                  maxZoom: 18,
                  backgroundColor: Colors.black,
                ),
              ],
            ),
            const _AppBar(),
          ],
        ),
        bottomNavigationBar: const BottomNavBar());
  }
}

class _AppBar extends StatefulWidget {
  const _AppBar();

  @override
  State<_AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<_AppBar> {
  int activeItem = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54 +
          Responsive.heightPercent(context, 10) +
          (Responsive.heightPercent(context, 22.1) / 2),
      child: Stack(
        children: [
          Container(
            color: CustomTheme.deepUltramarine,
            alignment: Alignment.bottomCenter,
            height: 54 + Responsive.heightPercent(context, 10),
            child: Center(
              child: Text(
                "Anasayfa",
                style: GoogleFonts.aBeeZee(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: CustomTheme.flood,
                      borderRadius: BorderRadius.circular(3)),
                  width: 54 + Responsive.heightPercent(context, 36),
                  height: (Responsive.heightPercent(context, 6.1)),
                  child: TextField(
                    onSubmitted: (val) {
                      //TODO: servisten dönen yeri mapde işaretle
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      icon: Align(
                        widthFactor: 0.6,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            "assets/png/Vector.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Responsive.heightPercent(context, 3),
                ),
                SizedBox(
                    height: 40,
                    width: 54 + Responsive.heightPercent(context, 36),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SortItem(
                            activeItem: activeItem,
                            value: 0,
                            onTap: (value) {
                              setState(() {
                                activeItem = value;
                              });
                              showModalBottomSheet(
                                  useRootNavigator: false,
                                  context: context,
                                  builder: (context) {
                                    return const CustomBottomSheet();
                                  });
                            },
                            child: Text(
                              "Yakınımda",
                              style: GoogleFonts.aBeeZee(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: SortItem(
                              activeItem: activeItem,
                              value: 1,
                              onTap: (value) {
                                setState(() {
                                  activeItem = value;
                                });
                              },
                              child: Text(
                                "Bugün",
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SortItem(
                            activeItem: activeItem,
                            value: 2,
                            onTap: (value) {
                              setState(() {
                                activeItem = value;
                              });
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Filtrele",
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Image.asset("assets/png/sort.png"),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
