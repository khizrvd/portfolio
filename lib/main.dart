import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/about/data_layer/about_data_layer.dart';
import 'package:portfolio/about/repository_layer/about_repository_layer.dart';
import 'package:portfolio/contact/data_layer/contact_data_layer.dart';
import 'package:portfolio/contact/repository_layer/contact_repository_layer.dart';
import 'package:portfolio/home/data_layer/home_data_layer.dart';
import 'package:portfolio/home/pages/home_page.dart';
import 'package:portfolio/home/repository_layer/home_repository_layer.dart';
import 'package:portfolio/portfolio/data_layer/portfolio_data_layer.dart';
import 'package:portfolio/portfolio/repository_layer/portfolio_repository_layer.dart';
import 'package:portfolio/skill/data_layer/skill_data_layer.dart';
import 'package:portfolio/skill/repository_layer/skill_repository_layer.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  HomeDataLayer _homeDataLayer = HomeDataLayer();
  HomeRepoLayer homeRepository = HomeRepoLayer(_homeDataLayer);
  AboutDataLayer _aboutDataLayer = AboutDataLayer();
  AboutRepoLayer aboutRepository = AboutRepoLayer(_aboutDataLayer);
  SkillDataLayer _skillDataLayer = SkillDataLayer();
  SkillRepoLayer skillRepository = SkillRepoLayer(_skillDataLayer);
  PortfolioDataLayer _portfolioDataLayer = PortfolioDataLayer();
  PortfolioRepoLayer portfolioRepository = PortfolioRepoLayer(_portfolioDataLayer);
  ContactDataLayer _contactDataLayer = ContactDataLayer();
  ContactRepoLayer contactRepository = ContactRepoLayer(_contactDataLayer);
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: homeRepository),
        RepositoryProvider.value(value: aboutRepository),
        RepositoryProvider.value(value: skillRepository),
        RepositoryProvider.value(value: portfolioRepository),
        RepositoryProvider.value(value: contactRepository),
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
