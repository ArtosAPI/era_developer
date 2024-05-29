import 'package:era_developer_test/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForestVPN test',
      home: Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(
                child: Text('Mark all read'),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Featured',
                  style: TextStyles.mainStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 358,
                  height: 300,
                  child: PageView(
                    children: [
                      GestureDetector(
                          child: Container(
                        color: Colors.redAccent,
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Latest news',
                  style: TextStyles.mainStyle,
                ),
                // ListView(
                //   children: [],
                // )
              ],
            ),
          )),
    );
  }
}

class LaterNewsCard extends StatelessWidget {
  const LaterNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            color: Colors.redAccent,
          ),
          Column(
            children: [Text('data'), Text('data')],
          )
        ],
      ),
    );
  }
}
