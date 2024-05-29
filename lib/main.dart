import 'package:era_developer_test/bloc/bloc/article_bloc.dart';
import 'package:era_developer_test/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  ForestVPNTestApp({Key? key}) : super(key: key);
  final List<LaterNewsCard> laterNewsCards = [
    LaterNewsCard(
      imageUrl: 'https://i.ibb.co/Jk8FMMp/unsplash-Oqtaf-YT5k-Tw.jpg',
      header: 'We are processing your request...',
      date: '1 day ago',
    ),
    LaterNewsCard(
      imageUrl: 'https://i.ibb.co/Jk8FMMp/unsplash-Oqtaf-YT5k-Tw.jpg',
      header: 'We are processing your request...',
      date: '1 day ago',
    ),
    LaterNewsCard(
      imageUrl: 'https://i.ibb.co/Jk8FMMp/unsplash-Oqtaf-YT5k-Tw.jpg',
      header: 'We are processing your request...',
      date: '1 day ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForestVPN test',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ArticleBloc()..add(FetchArticles()),
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  actions: [
                    GestureDetector(
                      child: const Text('Mark all read'),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView(
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
                            GestureDetector(
                                child: Container(
                              color: Colors.greenAccent,
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
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: laterNewsCards,
                      )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}

class LaterNewsCard extends StatelessWidget {
  const LaterNewsCard(
      {super.key,
      required this.imageUrl,
      required this.header,
      required this.date});
  final String imageUrl, header, date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        height: 103,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(blurRadius: 30, spreadRadius: -32, offset: Offset(8, 8))
            ],
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                width: 90,
                height: 60,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 190,
                    child: Text(header, style: TextStyles.secondaryStyle)),
                Text(date, style: TextStyles.tertiaryStyle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
