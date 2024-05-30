import 'package:era_developer_test/bloc/bloc/article_bloc.dart';
import 'package:era_developer_test/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForestVPN test',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ArticleBloc()..add(FetchArticles()),
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticlesFetched) {
              final List<FeaturedNewsCards> featuredNewsCards = List.generate(
                  state.articles.length,
                  (iterator) => FeaturedNewsCards(
                        imageUrl: state.articles[iterator].imageUrl,
                        header: state.articles[iterator].title,
                        child: FeaturedNewsMoreInfo(
                          imageUrl: state.articles[iterator].imageUrl,
                          header: state.articles[iterator].title,
                          description: state.articles[iterator].description!,
                        ),
                      ));

              final List<LaterNewsCard> laterNewsCards = List.generate(
                  state.articles.length,
                  (iterator) => LaterNewsCard(
                      imageUrl: state.articles[iterator].imageUrl,
                      header: state.articles[iterator].title,
                      date: '1 day ago'));

              return Scaffold(
                  appBar: AppBar(
                    systemOverlayStyle: SystemUiOverlayStyle.dark,
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    centerTitle: true,
                    title: const Padding(
                      padding: EdgeInsets.only(right: 20, bottom: 3.5),
                      child: Text(
                        'Notifications',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    leading: GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Image(
                          image:
                              AssetImage('assets/images/blackBackButton.png'),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          state.readAllArticles();
                          for (var article in state.articles) {
                            print(article.read);
                          }
                        },
                        child: const Text(
                          'Mark all read',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  extendBodyBehindAppBar: true,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
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
                            children: featuredNewsCards,
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
            }
            return const SizedBox(
                width: 50, height: 50, child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class FeaturedNewsCards extends StatelessWidget {
  const FeaturedNewsCards({
    super.key,
    required this.imageUrl,
    required this.header,
    required this.child,
  });

  final String imageUrl, header;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => child));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          height: 300,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 25),
            child: Text(
              header,
              style: TextStyles.imageHeader,
            ),
          ),
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

class FeaturedNewsMoreInfo extends StatelessWidget {
  const FeaturedNewsMoreInfo({
    super.key,
    required this.imageUrl,
    required this.header,
    required this.description,
  });

  final String imageUrl, header, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent),
      ),
    );
  }
}
