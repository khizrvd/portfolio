import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/about/data_layer/about_data_layer.dart';
import 'package:portfolio/about/repository_layer/about_repository_layer.dart';
import 'package:portfolio/home/data_layer/home_data_layer.dart';
import 'package:portfolio/home/pages/home_page.dart';
import 'package:portfolio/home/repository_layer/home_repository_layer.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  HomeDataLayer _homeDataLayer = HomeDataLayer();
  HomeRepoLayer homeRepository = HomeRepoLayer(_homeDataLayer);
  AboutDataLayer _aboutDataLayer = AboutDataLayer();
  AboutRepoLayer aboutRepository = AboutRepoLayer(_aboutDataLayer);
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: homeRepository),
        RepositoryProvider.value(value: aboutRepository),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
