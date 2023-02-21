import 'package:flutter/material.dart';

Row customSimpleRow(BuildContext context,
    {required String title, required String text}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(title),
      ),
      SizedBox(
        width: 10,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(
          text,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
