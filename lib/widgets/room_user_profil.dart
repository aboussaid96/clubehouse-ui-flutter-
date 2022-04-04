import 'package:clubehouse_ui/widgets/user_profil_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class RoomUserProfil extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfil({
    required this.imageUrl,
    required this.name,
    this.size=46,
    this.isNew= false ,
    this.isMuted= false ,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserProfilImage(
                imageURL: imageUrl,
                size: size,
              ),
            ),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        )
                      ]),
                  child: Text(
                    "🎉",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          )
                        ]),
                    child: Icon(CupertinoIcons.mic_slash_fill)),
              )
          ],
        ),
        Flexible(
            child: Text(
          name,
          overflow: TextOverflow.ellipsis,
        ))
      ],
    );
  }
}
