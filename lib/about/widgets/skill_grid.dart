import 'package:flutter/material.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';
import 'package:portfolio/utils/constants.dart';

double _tablet = 1000;

class SkillGrid extends StatelessWidget {
  const SkillGrid({Key? key, required this.aboutData, required this.index})
      : super(key: key);

  final AboutRepoModel? aboutData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              aboutData?.skills?[index]['image'].toString() ?? '',
              width: size.width > _tablet ? 84 : 54,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.desktop_windows_rounded,
                  color: Colors.blue,
                );
              },
            ),
            Text(
              aboutData?.skills?[index]['title'].toString() ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: secondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
