// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:osm/manual_bottom_sheet.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String markdownData = "";
  int currentManual = 0;
  List manuals = [
    {
      "name": "Introduction",
      "icon": Icons.book_outlined,
    },
    {
      "name": "Psychology",
      "icon": Icons.person_2_outlined,
    },
    {
      "name": "Planning",
      "icon": Icons.calendar_month,
    },
    {
      "name": "Animals",
      "icon": Ionicons.warning_outline,
    },
    {
      "name": "Apps",
      "icon": Icons.app_shortcut,
    },
    {
      "name": "Camouflage",
      "icon": Icons.remove_red_eye_outlined,
    },
    {
      "name": "Car-Repair",
      "icon": Icons.car_crash_outlined,
    },
    {
      "name": "Cold",
      "icon": Icons.snowing,
    },
    {
      "name": "Dangerous Arthropods",
      "icon": Icons.dangerous_outlined,
    },
    {
      "name": "Desert",
      "icon": Icons.hot_tub_outlined,
    },
    {
      "name": "Direction Finding",
      "icon": Icons.directions_outlined,
    },
    {
      "name": "Fire",
      "icon": Icons.local_fire_department_outlined,
    },
    {
      "name": "Fish And Mollusks",
      "icon": Ionicons.fish_outline,
    },
    {
      "name": "Food",
      "icon": Icons.restaurant,
    },
    {
      "name": "Home",
      "icon": Icons.home_outlined,
    },
    {
      "name": "Hostile Areas",
      "icon": Icons.location_disabled,
    },
    {
      "name": "Kits",
      "icon": Icons.keyboard_option_key_sharp,
    },
    {
      "name": "Man Made Hazards",
      "icon": Icons.warning_amber,
    },
    {
      "name": "Medicine",
      "icon": Icons.medication_outlined,
    },
    {
      "name": "MultiTool",
      "icon": Icons.toll_outlined,
    },
    {
      "name": "People",
      "icon": Icons.escalator_warning_outlined,
    },
    {
      "name": "Plants",
      "icon": Icons.forest_outlined,
    },
    {
      "name": "Poisonous-Plants",
      "icon": Icons.dangerous_outlined,
    },
    {
      "name": "Power",
      "icon": Icons.power_outlined,
    },
    {
      "name": "Ropes And Knots",
      "icon": Ionicons.link_outline,
    },
    {
      "name": "Sea",
      "icon": Icons.water,
    },
    {
      "name": "Self-Defense",
      "icon": Icons.local_police_outlined,
    },
    {
      "name": "Shelter",
      "icon": Icons.add_home_outlined,
    },
    {
      "name": "Signaling",
      "icon": Icons.sos_outlined,
    },
    {
      "name": "Tools",
      "icon": Icons.album_outlined,
    },
    {
      "name": "Tropical",
      "icon": Icons.pin_drop_outlined,
    },
    {
      "name": "Water",
      "icon": Icons.water_drop_outlined,
    },
    {
      "name": "Water Crossing",
      "icon": Ionicons.boat_outline,
    },
  ];

  void getData() async {
    markdownData = await DefaultAssetBundle.of(context).loadString(
        'manual/${manuals[currentManual]["name"].toString().replaceAll(" ", "")}.md');
    markdownData =
        "$markdownData\n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n # \n #";
    setState(() {});
  }

  void manualsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ManualBottomSheet(
          manuals: manuals,
          setContent: setContent,
        );
      },
    );
  }

  void setContent(int manual) {
    currentManual = manual;
    markdownData = "";
    getData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101010),
      appBar: AppBar(
        backgroundColor: Color(0xff202020),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Survival Manual",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "— ${manuals[currentManual]["name"]}",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(
            manuals[currentManual]["icon"],
            color: Color.fromARGB(255, 79, 123, 87),
            size: 25.0,
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: SafeArea(
        child: Markdown(
          data: markdownData.toString(),
          onTapLink: (link, link1, link2) async {
            await launchUrl(Uri.parse(link1!), mode: LaunchMode.inAppWebView);
          },
          selectable: true,
          styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
          styleSheet: MarkdownStyleSheet(
            h1: TextStyle(
              color: Colors.white,
            ),
            h2: TextStyle(
              color: Colors.white,
            ),
            h3: TextStyle(
              color: Colors.white,
            ),
            h4: TextStyle(
              color: Colors.white,
            ),
            h5: TextStyle(
              color: Colors.white,
            ),
            code: TextStyle(
              color: Colors.white,
              backgroundColor: Color.fromARGB(255, 58, 73, 61),
            ),
            codeblockDecoration: BoxDecoration(
              color: Color.fromARGB(255, 58, 73, 61),
              borderRadius: BorderRadius.circular(10.0),
            ),
            blockquoteDecoration: BoxDecoration(
              color: Color.fromARGB(255, 58, 73, 61),
              borderRadius: BorderRadius.circular(10.0),
            ),
            p: TextStyle(
              color: Colors.white,
            ),
            listBullet: TextStyle(
              color: Colors.white,
            ),
            tableBody: TextStyle(
              color: Colors.white,
            ),
          ),
          imageBuilder: (uri, abc, def) {
            return Image.asset("manual/${uri.toString()}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Manuals",
        backgroundColor: const Color.fromARGB(255, 96, 139, 105),
        onPressed: manualsBottomSheet,
        child: Icon(
          Icons.book_outlined,
        ),
      ),
    );
  }
}
