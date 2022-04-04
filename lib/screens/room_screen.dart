import 'dart:math';

import 'package:clubehouse_ui/widgets/room_user_profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../models/room.dart';
import '../widgets/user_profil_image.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 130,
          leading: TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(CupertinoIcons.chevron_down),
              label: Text("halway")),
          actions: [
            IconButton(
              icon: Icon(
                CupertinoIcons.doc,
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
        body: Container(
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${room.club} 🏠'.toUpperCase(),
                          style: Theme.of(context).textTheme.overline!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.0,
                              ),
                        ),
                        Icon(CupertinoIcons.ellipsis)
                      ],
                    ),
                    Text(
                      room.name,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  children: room.speakers
                      .map((e) => RoomUserProfil(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool()))
                      .toList(),
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  "Followed By Speakers",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.0,
                  children: room.followedBySpeakers
                      .map((e) => RoomUserProfil(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 53,
                          isNew: Random().nextBool()))
                      .toList(),
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  "Others In Room",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.0,
                  children: room.others
                      .map((e) => RoomUserProfil(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 53,
                          isNew: Random().nextBool()))
                      .toList(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(bottom: 50),
              )
            ],
          ),
        ),
        bottomSheet: Container(
          height: 90,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "✌ Leave quietly",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[300]),
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        CupertinoIcons.add,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[300]),
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        CupertinoIcons.hand_raised,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
