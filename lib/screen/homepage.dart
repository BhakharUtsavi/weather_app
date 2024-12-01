import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../provider/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map<String, dynamic>>? _weatherDetails;
  String? cityName;

  Future<Map<String, dynamic>> fetchWeatherDetails(String cityName) async {
    try {
      Response res = await get(
        Uri.parse(
            "https://api.weatherapi.com/v1/forecast.json?key=3c5009be4d49494f9d245829232208&q=$cityName&days=1&aqi=no&alerts=no"),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        throw Exception(
            'Failed to fetch weather data: ${res.statusCode} - ${res.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<void> _refreshData() async {
    if (cityName != null) {
      setState(() {
        _weatherDetails = fetchWeatherDetails(cityName!);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      cityName = args;
      _weatherDetails = fetchWeatherDetails(cityName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("searchcity");
            },
            icon: Icon(
              Icons.add_business_rounded,
              size: 30,
            ),
          ),
          Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
            return IconButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                icon: Icon(
                    themeProvider.isDark ? Icons.light_mode : Icons.dark_mode));
          }),
        ],
      ),
      drawer: Drawer(
        child: DrawerHeader(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft1");
                    },
                    child: Text("Lec 1 Task 1")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft2");
                    },
                    child: Text("Lec 1 Task 2")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft3");
                    },
                    child: Text("Lec 1 Task 3")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft4");
                    },
                    child: Text("Lec 1 Task 4")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft5");
                    },
                    child: Text("Lec 1 Task 5")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft6");
                    },
                    child: Text("Lec 1 Task 6")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft7");
                    },
                    child: Text("Lec 1 Task 7")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft8");
                    },
                    child: Text("Lec 1 Task 8")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft9");
                    },
                    child: Text("Lec 1 Task 9")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft10");
                    },
                    child: Text("Lec 1 Task 10")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("ft11");
                    },
                    child: Text("Lec 1 Task 11")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("st1");
                    },
                    child: Text("Lec 1 Task 1")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("st2");
                    },
                    child: Text("Lec 2 Task 2")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("st3");
                    },
                    child: Text("Lec 2 Task 3")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("st4");
                    },
                    child: Text("Lec 2 Task 4")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("st5");
                    },
                    child: Text("Lec 2 Task 5")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("st6");
                    },
                    child: Text("Lec 2 Task 6")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("st7");
                    },
                    child: Text("Lec 2 Task 7")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("st8");
                    },
                    child: Text("Lec 2 Task 8")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("st9");
                    },
                    child: Text("Lec 2 Task 9")),
              ],
            ),
          ),
        ),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: SizedBox(
      //         height: MediaQuery.sizeOf(context).height / 2,
      //         child: FutureBuilder<List<dynamic>>(
      //             future: ApiHelper.obj.getUserLit(),
      //             builder: (context, val) {
      //               if (val.hasData) {
      //                 List users = val.data ?? [];
      //                 return ListView.builder(
      //                     itemCount: users.length,
      //                     itemBuilder: (context, index) {
      //                       Map<String, dynamic> user = users[index];
      //                       UserDataModel userModel =
      //                           UserDataModel.fromJson(user);
      //                       return Card(
      //                         child: Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Text(userModel.name ?? ""),
      //                               Text("email : ${userModel.email ?? ""}"),
      //                               Text(
      //                                   "address : ${userModel.address?.city}"),
      //                               Text(
      //                                   "Website : ${userModel.website ?? ""}"),
      //                             ],
      //                           ),
      //                         ),
      //                       );
      //                     });
      //               } else {
      //                 return CircularProgressIndicator();
      //               }
      //             }),
      //       ),
      //     ),
      //     SliverToBoxAdapter(
      //       child: SizedBox(
      //         height: MediaQuery.sizeOf(context).height * 0.5,
      //         child: FutureBuilder<List<dynamic>>(
      //             future: ApiHelper.obj.getPhotos(),
      //             builder: (context, val) {
      //               if (val.hasData) {
      //                 List photos = val.data ?? [];
      //                 return GridView.builder(
      //                   itemCount: photos.length,
      //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                       crossAxisCount: 2,
      //                       crossAxisSpacing: 1,
      //                       mainAxisSpacing: 1),
      //                   itemBuilder: (context, index) {
      //                     Map<String, dynamic> photo = photos[index];
      //                     return InkWell(
      //                       onTap: () async {
      //                         bool isSet = await AsyncWallpaper.setWallpaper(
      //                             url: photo['previewURL'],
      //                             goToHome: false,
      //                             wallpaperLocation:
      //                                 AsyncWallpaper.LOCK_SCREEN);
      //                       },
      //                       child: Image.network(
      //                         photo['previewURL'],
      //                         fit: BoxFit.cover,
      //                       ),
      //                     );
      //                   },
      //                 );
      //               } else {
      //                 return CircularProgressIndicator();
      //               }
      //             }),
      //       ),
      //     ),
      //     // FloatingActionButton(onPressed: (){
      //     //   Navigator.of(context).pushNamed("add");
      //     // },child: Icon(Icons.add),)
      //   ],
      // ),
      body: _weatherDetails == null
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refreshData,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder<Map<String, dynamic>>(
                    future: _weatherDetails,
                    builder: (context, snap) {
                      final data = snap.data!;
                      if (snap.hasData) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text("${data['location']['name']}",
                                    style: GoogleFonts.roboto(fontSize: 20)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      String? url =
                                          "https://www.google.co.in/search?q=google+weather&sca_esv=2971aaf90403a1a6&sxsrf=ADLYWII3yNMPWX3Xa7qXZLZ4k7MBQinuYA%3A1732805740650&source=hp&ei=bIRIZ_usJdjh0-kPxpeLuQo&iflsig=AL9hbdgAAAAAZ0iSfIfIL0dhgScIUaHErGRlYwcqx4-S&oq=&gs_lp=Egdnd3Mtd2l6IgAqAggAMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCSLQRUABYAHABeACQAQCYAQCgAQCqAQC4AQPIAQCYAgGgAgqoAgqYAwqSBwExoAcA&sclient=gws-wiz";
                                      Navigator.of(context)
                                          .pushNamed("load", arguments: url);
                                    },
                                    child: Text(
                                        "${data['current']['temp_c'].toInt()}°",
                                        style:
                                            GoogleFonts.roboto(fontSize: 100))),
                                GestureDetector(
                                  onTap: () {
                                    String? url =
                                        "https://www.google.co.in/search?q=google+weather&sca_esv=2971aaf90403a1a6&sxsrf=ADLYWII3yNMPWX3Xa7qXZLZ4k7MBQinuYA%3A1732805740650&source=hp&ei=bIRIZ_usJdjh0-kPxpeLuQo&iflsig=AL9hbdgAAAAAZ0iSfIfIL0dhgScIUaHErGRlYwcqx4-S&oq=&gs_lp=Egdnd3Mtd2l6IgAqAggAMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCSLQRUABYAHABeACQAQCYAQCgAQCqAQC4AQPIAQCYAgGgAgqoAgqYAwqSBwExoAcA&sclient=gws-wiz";
                                    Navigator.of(context)
                                        .pushNamed("load", arguments: url);
                                  },
                                  child: Text(
                                    "${data['current']['condition']['text']}°C ${data['current']['feelslike_c']}°C Feel Like ${data['current']['feelslike_f']}°C" ??
                                        "",
                                    style: GoogleFonts.roboto(fontSize: 16),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Container(
                                  height: 45,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.blue.shade900.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 15),
                                      Icon(Icons.settings),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          String? url =
                                              "https://www.google.co.in/";
                                          Navigator.of(context).pushNamed(
                                              "load",
                                              arguments: url);
                                        },
                                        child: Text(
                                          "Very low pollen count",
                                          style:
                                              GoogleFonts.roboto(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 24,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              String? url =
                                                  "https://www.google.co.in/search?q=google+weather&sca_esv=2971aaf90403a1a6&sxsrf=ADLYWII3yNMPWX3Xa7qXZLZ4k7MBQinuYA%3A1732805740650&source=hp&ei=bIRIZ_usJdjh0-kPxpeLuQo&iflsig=AL9hbdgAAAAAZ0iSfIfIL0dhgScIUaHErGRlYwcqx4-S&oq=&gs_lp=Egdnd3Mtd2l6IgAqAggAMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCSLQRUABYAHABeACQAQCYAQCgAQCqAQC4AQPIAQCYAgGgAgqoAgqYAwqSBwExoAcA&sclient=gws-wiz";
                                              Navigator.of(context).pushNamed(
                                                  "load",
                                                  arguments: url);
                                            },
                                            child: Container(
                                              width: 70,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.blue.shade900
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "${1 + index}:00",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14),
                                                  ),
                                                  Icon(
                                                    Icons.light_mode,
                                                    color: Colors.yellow,
                                                  ),
                                                  Text(
                                                    "${data['current']['humidity']}°" ??
                                                        "",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    String? url =
                                        "https://www.google.co.in/search?q=google+weather&sca_esv=2971aaf90403a1a6&sxsrf=ADLYWII3yNMPWX3Xa7qXZLZ4k7MBQinuYA%3A1732805740650&source=hp&ei=bIRIZ_usJdjh0-kPxpeLuQo&iflsig=AL9hbdgAAAAAZ0iSfIfIL0dhgScIUaHErGRlYwcqx4-S&oq=&gs_lp=Egdnd3Mtd2l6IgAqAggAMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCSLQRUABYAHABeACQAQCYAQCgAQCqAQC4AQPIAQCYAgGgAgqoAgqYAwqSBwExoAcA&sclient=gws-wiz";
                                    Navigator.of(context)
                                        .pushNamed("load", arguments: url);
                                  },
                                  child: Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.blue.shade900.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Tomorrow's Temperature",
                                            style: GoogleFonts.roboto(
                                                fontSize: 12)),
                                        Text("Expect the same as today",
                                            style: GoogleFonts.roboto(
                                                fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                FutureBuilder<Map<String, dynamic>>(
                                    future: _weatherDetails,
                                    builder: (contetx, snap) {
                                      final data = snap.data!;
                                      if (snap.hasData) {
                                        return SizedBox(
                                          height: 280,
                                          child: ListView.builder(
                                            itemCount: 7,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  String? url =
                                                      "https://www.google.co.in/search?q=google+weather&sca_esv=2971aaf90403a1a6&sxsrf=ADLYWII3yNMPWX3Xa7qXZLZ4k7MBQinuYA%3A1732805740650&source=hp&ei=bIRIZ_usJdjh0-kPxpeLuQo&iflsig=AL9hbdgAAAAAZ0iSfIfIL0dhgScIUaHErGRlYwcqx4-S&oq=&gs_lp=Egdnd3Mtd2l6IgAqAggAMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCSLQRUABYAHABeACQAQCYAQCgAQCqAQC4AQPIAQCYAgGgAgqoAgqYAwqSBwExoAcA&sclient=gws-wiz";
                                                  Navigator.of(context)
                                                      .pushNamed("load",
                                                          arguments: url);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue.shade900
                                                        .withOpacity(0.1),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0,
                                                            bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          "Day ${index + 1}",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 12),
                                                        ),
                                                        Icon(Icons.light_mode,
                                                            color:
                                                                Colors.yellow,
                                                            size: 20),
                                                        Text(
                                                          "${data['current']['temp_c'].toInt()} / ${data['current']['temp_f'].toInt()}°C" ??
                                                              "",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                      return CircularProgressIndicator();
                                    }),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade900
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.light_mode, size: 20),
                                            Text(
                                              "UV",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "${data['current']['uv'].toInt()} Very weak" ??
                                                  "",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade900
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.temple_buddhist_rounded,
                                                size: 20),
                                            Text(
                                              "Feel Like",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "${data['current']['feelslike_c'].toInt()}°" ??
                                                  "",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade900
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.backup_rounded,
                                                size: 20),
                                            Text(
                                              "Humidlity",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              " ${data['current']['humidity'].toInt()} %" ??
                                                  "",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade900
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.sensor_window, size: 20),
                                            Text(
                                              "${data['current']['wind_mph'].toInt()} mph" ??
                                                  "",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "NE wind",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade900
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.air, size: 20),
                                            Text(
                                              "Air pressure",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "${data['current']['pressure_mb'].toInt()} mb" ??
                                                  "",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade900
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.visibility, size: 20),
                                            Text(
                                              "Visibility",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "${data['current']['vis_miles'].toInt()} miles" ??
                                                  "",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ),
    );
  }
}

// if (snapshot.connectionState == ConnectionState.waiting) {
//   return Center(child: CircularProgressIndicator());
// } else if (snapshot.hasError) {
//   return Center(child: Text(snapshot.error.toString()));
// }
// else if (snapshot.hasData) {
//   final data = snapshot.data!;
//   return Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("City: ${data['location']['name']}",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         Text("Temperature: ${data['current']['temp_c']}°C"),
//         Text("Feels Like: ${data['current']['feelslike_c']}°C"),
//         Text("Temperature (F): ${data['current']['temp_f']}°F"),
//         Text("Humidity: ${data['current']['humidity']}%"),
//         Text("Wind Speed: ${data['current']['wind_mph']} mph"),
//         Text("Pressure: ${data['current']['pressure_mb']} mb"),
//         Text("Visibility: ${data['current']['vis_miles']} miles"),
//         Text("UV Index: ${data['current']['uv']}"),
//         Text("Condition: ${data['current']['condition']['text']}"),
//       ],
//     ),
//   );
// } else {
//   return Center(child: Text("No data available"));
// }
