import 'package:flutter/material.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';
import 'package:portfolio/utils/constants.dart';

class HobbyList extends StatelessWidget {
  const HobbyList({Key? key, required this.aboutData, required this.index})
      : super(key: key);

  final AboutRepoModel? aboutData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          aboutData?.hobbies?[index]['image'].toString() ?? '',
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.image_not_supported_outlined,
              color: Colors.blue,
            );
          },
        ),
        const SizedBox(width: 5.0),
        Text(
          aboutData?.hobbies?[index]['title'].toString() ?? '',
          style: TextStyle(
            fontSize: size.width <= mobile ? 12 : 16,
            color: const Color(0xff5F5E79),
            fontWeight: FontWeight.w600,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
        ),
      ],
    );
  }
}
