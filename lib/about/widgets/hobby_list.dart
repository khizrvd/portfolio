import 'package:flutter/material.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';

class HobbyList extends StatelessWidget {
  const HobbyList({Key? key, required this.aboutData, required this.index})
      : super(key: key);

  final AboutRepoModel? aboutData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          aboutData?.hobbies?[index]['image'].toString() ?? '',
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.desktop_windows_rounded,
              color: Colors.blue,
            );
          },
        ),
        const SizedBox(width: 5.0),
        Text(
          aboutData?.hobbies?[index]['title'].toString() ?? '',
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff5F5E79),
            fontWeight: FontWeight.w600,
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 20.0))
      ],
    );
  }
}
