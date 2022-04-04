import 'package:flutter/cupertino.dart';

import '../data.dart';

class UserProfilImage extends StatelessWidget {
  final String imageURL;
  final double size;

  const UserProfilImage({Key? key, required this.imageURL, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size/2 - size/10),
      child: Image.network(
        imageURL,
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
