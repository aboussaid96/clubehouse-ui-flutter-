import 'package:clubehouse_ui/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/room_card.dart';
import '../widgets/user_profil_image.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                CupertinoIcons.envelope,
                size: 26,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.calendar,
                size: 26,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.bell,
                size: 28,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    UserProfilImage(imageURL: currentUser.imageURL, size: 30),
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20, 100),
                children: [...roomList.map((e) => RoomCard(room: e))]),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor
                    ])),
              ),
            ),
            Positioned(
              bottom: 60,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                  size: 21,
                ),
                label: Text(
                  "Add a room",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    primary: Theme.of(context).accentColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
          ],
        ));
  }
}
