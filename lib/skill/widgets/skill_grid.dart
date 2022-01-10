import 'package:flutter/material.dart';
import 'package:portfolio/skill/repository_layer/models/skill_repository_model.dart';
import 'package:portfolio/utils/constants.dart';

class SkillGrid extends StatelessWidget {
  const SkillGrid({Key? key, required this.skillData, required this.index})
      : super(key: key);

  final SkillRepoModel? skillData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 2,
                  color: const Color(0xff6D6D6D),
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(45.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 40,
                  right: 10,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skillData?.skills?[index]['title'].toString() ??
                          'Unknown',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Flexible(
                      child: Text(
                        skillData?.skills?[index]['description'].toString() ??
                            'Unknown',
                        style: const TextStyle(
                          color: Color(0xff5F5E79),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 40,
          child: Image.network(
            skillData?.skills?[index]['image'].toString() ?? '',
            width: 90,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.image_not_supported_outlined,
                color: Colors.white,
              );
            },
          ),
        ),
      ],
    );
  }
}
