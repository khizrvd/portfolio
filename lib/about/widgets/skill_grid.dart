import 'package:flutter/material.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';
class SkillGrid extends StatelessWidget {
  const SkillGrid({Key? key, required this.aboutData, required this.index})
      : super(key: key);

  final AboutRepoModel? aboutData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            aboutData?.skills?[index]['image'].toString() ?? '',
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color(0xffF2F2F2),
                child: const Icon(
                  Icons.desktop_windows_rounded,
                  color: Colors.blue,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
