import 'package:flutter/material.dart';

class ManualBottomSheet extends StatefulWidget {
  const ManualBottomSheet({
    super.key,
    required this.manuals,
    required this.setContent,
  });

  final List manuals;
  final Function setContent;

  @override
  State<ManualBottomSheet> createState() => _ManualBottomSheetState();
}

class _ManualBottomSheetState extends State<ManualBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Manuals",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: widget.manuals.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  widget.setContent(index);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    top: 5.0,
                    bottom: 15.0,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey[850]!,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        widget.manuals[index]["icon"],
                        color: Colors.grey[500]!,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        widget.manuals[index]["name"].toString(),
                        style: const TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
