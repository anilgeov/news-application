
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/homescreen_controller.dart';


import '../search_screen/search_screen.dart';
import '../widgets/newscard.dart';

class HomeScreen extends StatelessWidget {

  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            shape:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            backgroundColor: Color(0xff04a97a),
            elevation: 0,
            title:  Center(
              child: Text(
                "News Today 🗞️",
              ),
            ),
            titleTextStyle:  TextStyle(
                color: Colors.white, fontSize: 25,
                fontWeight: FontWeight.w900),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchNewsScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.search),
              )
            ],
          ),
          body: Consumer<HomeScreenController>(builder: (context, provider, child) {
            return provider.isLoading == true
                ? Center(
                child: LottieBuilder.asset(
                  "assets/animation/Animation - 1718776763003splash.json",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ))
                : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (context, index) => NewsCard(
                    title: provider.newsModel.articles?[index].title.toString() ?? "",
                    description: provider.newsModel.articles?[index].description
                        .toString() ??
                        "",
                    date:
                    provider.newsModel.articles?[index].publishedAt,
                    imageUrl: provider
                        .newsModel.articles?[index].urlToImage
                        .toString() ??
                        "",
                    contant: provider.newsModel.articles?[index].content
                        .toString() ??
                        "",
                    sourceName: provider
                        .newsModel.articles?[index].source?.name
                        .toString() ??
                        "",
                    url: provider.newsModel.articles?[index].url
                        .toString() ??
                        "",
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    height: 20,
                  ),
                  itemCount: provider.newsModel.articles?.length ?? 0),
            );

          }),


      ),
    );
  }
}
