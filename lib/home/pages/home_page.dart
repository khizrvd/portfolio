import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/about/bloc/about_bloc.dart';
import 'package:portfolio/about/pages/about_page.dart';
import 'package:portfolio/home/bloc/home_bloc.dart';
import 'package:portfolio/home/widgets/home_banner.dart';
import 'package:portfolio/home/widgets/mobile_nav_bar.dart';
import 'package:portfolio/home/widgets/web_nav_bar.dart';
import 'package:portfolio/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio/portfolio/pages/portfolio_page.dart';
import 'package:portfolio/skill/bloc/skill_bloc.dart';
import 'package:portfolio/skill/pages/skill_page.dart';
import 'package:portfolio/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      endDrawer: const MobileNavBar(),
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: controller.hasClients && controller.page != 0
            ? const Color(0xff4275FA)
            : Colors.transparent,
        title: Row(
          children: [
            SizedBox(width: mWidth * 0.03),
            Text(
              'Khizrfarooqui',
              style: GoogleFonts.pacifico(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          size.width > mobile
              ? const WebNavBar()
              : Builder(
                  builder: (context) {
                    return FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        size: 20.0,
                        color: Colors.blue,
                      ),
                    );
                  },
                ),
          SizedBox(
            width: mWidth * 0.03,
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: [
          BlocProvider(
            create: (context) => HomeBloc(
              RepositoryProvider.of(context),
            ),
            child: HomeBanner(
              controller: controller,
            ),
          ),
          BlocProvider(
            create: (context) => AboutBloc(
              RepositoryProvider.of(context),
            ),
            child: AboutPage(
              controller: controller,
            ),
          ),
          BlocProvider(
            create: (context) => SkillBloc(
              RepositoryProvider.of(context),
            ),
            child: SkillPage(
              controller: controller,
            ),
          ),
          BlocProvider(
            create: (context) => PortfolioBloc(
              RepositoryProvider.of(context),
            ),
            child: PortfolioPage(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
