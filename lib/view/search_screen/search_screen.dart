import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/search_sreen_controller.dart';
import '../widgets/newscard.dart';

class SearchNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
                padding:  EdgeInsets.all(20),
                child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 45,
                width: MediaQuery.sizeOf(context).width * 2 / 3,
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:  BorderSide(
                            color: Color(0xff04a97a), width: 3)),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    provider.searchData(
                        searchText: textController.text.toLowerCase());
                    FocusManager.instance.primaryFocus?.unfocus(); // to clear automatically from search box
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xff04a97a))),
                  child: const Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Provider.of<SearchScreenController>(context).
            isLoading == true
                ? Center(
                    child: LottieBuilder.asset(
                    "assets/animation/Animation - 1718776763003splash.json",
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                  ))
                : ListView.separated(
                    itemBuilder: (context, index) => NewsCard(
                        title:
                            provider.newsModel?.articles?[index].title ?? "",
                        description:
                            provider.newsModel?.articles?[index].description ??
                                "",
                        date:
                            provider.newsModel?.articles?[index].publishedAt,
                        imageUrl:
                            provider.newsModel?.articles?[index].urlToImage ??
                                "",
                        contant: provider.newsModel?.articles?[index].content ??
                            "",
                        sourceName:
                            provider.newsModel?.articles?[index].source?.name ??
                                "",
                        url: provider.newsModel?.articles?[index].url ?? ""),
                    separatorBuilder: (context, index) => const Divider(height: 20),
                    itemCount: provider.newsModel?.articles?.length ?? 0),
          )
        ],
                ),
              ),

      ),
    );
  }
}
