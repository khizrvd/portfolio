import 'package:flutter/material.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';
import 'package:portfolio/about/widgets/hobby_list.dart';
import 'package:portfolio/utils/constants.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key, this.aboutData}) : super(key: key);

  final AboutRepoModel? aboutData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ABOUT ME',
            style: TextStyle(
              fontSize: 20,
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            aboutData?.qualification?.toString() ?? 'Unknown',
            style: TextStyle(
              fontSize: 30,
              color: secondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5.0),
          Flexible(
            child: Text(
              aboutData?.description?.toString() ?? 'Unknown',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xff5F5E79),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            'My Hobbies',
            style: TextStyle(
              fontSize: 20,
              color: secondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: aboutData?.hobbies?.length ?? 3,
              itemBuilder: (context, index) {
                return HobbyList(aboutData: aboutData, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
