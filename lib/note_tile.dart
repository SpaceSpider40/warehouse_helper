import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(image: NetworkImage("https://placehold.co/600x400.png")),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Title",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            Text(
              "Part number",
              textAlign: TextAlign.left,
            ),
            Text(
              "Warehouse number",
              textAlign: TextAlign.left,
            ),
            Text(
              "Description",
              textAlign: TextAlign.left,
            ),
          ],
        )
      ],
    );
  }
}
