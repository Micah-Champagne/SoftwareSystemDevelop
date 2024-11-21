import 'dart:math';
import 'package:flutter/material.dart';

class PostModel {
  String image;
  String name;
  String time;
  String quest;
  Color boxColor;
  bool isFavorited;
  int likedAmount;

  PostModel({
    required this.image,
    required this.name,
    required this.time,
    required this.quest,
    required this.boxColor,
    this.isFavorited = false,
    required this.likedAmount,
  });

  static List<PostModel> getCategories() {
    List<PostModel> post = [];

    Color education = const Color(0xffA8D8EA);
    Color physical = const Color(0xffF4C3A5);
    Color professional = const Color(0xffB7E9A0);
    Color chores = const Color(0xffF6E89D);

    String AbbyPhoto = "assets/icons/abby.jpeg";
    String ArushiPhoto = "assets/icons/arushi.jpeg";
    String TylerPhoto = "assets/icons/tyler.jpeg";
    String ReinhardPhoto = "assets/icons/reinhard.jpeg";
    String MicahPhoto = "assets/icons/Micah.jpeg";

    String AbbyUser = "@AbEE33";
    String ArushiUser = "@Yoshi";
    String TylerUser = "@StayZan234";
    String ReinhardUser = "@RineH3art";
    String MicahUser = "@ChampagnePapi";

    Random random = Random();

    post.add(PostModel(
      image: AbbyPhoto,
      name: AbbyUser,
      time: "Just now",
      quest: "Clean my room",
      boxColor: chores,
      likedAmount: random.nextInt(100) + 1,
    ));

    post.add(PostModel(
      image: TylerPhoto,
      name: TylerUser,
      time: "3 minutes ago",
      quest: "Study for exam",
      boxColor: education,
      likedAmount: random.nextInt(100) + 1,
    ));

    post.add(PostModel(
      image: ArushiPhoto,
      name: ArushiUser,
      time: "37 minutes ago",
      quest: "Submit hours in workday",
      boxColor: professional,
      likedAmount: random.nextInt(100) + 1,
    ));

    post.add(PostModel(
      image: ReinhardPhoto,
      name: ReinhardUser,
      time: "49 minutes ago",
      quest: "Run for Physical Fitness test",
      boxColor: physical,
      likedAmount: random.nextInt(100) + 1,
    ));

    post.add(PostModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "1 hour ago",
      quest: "Wash the dishes",
      boxColor: chores,
      likedAmount: random.nextInt(100) + 1,
    ));

    post.add(PostModel(
      image: AbbyPhoto,
      name: AbbyUser,
      time: "2 hours ago",
      quest: "Finish Milestone 2",
      boxColor: education,
      likedAmount: random.nextInt(100) + 1,
    ));

    post.add(PostModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "3 hours ago",
      quest: "Cried",
      boxColor: professional,
      likedAmount: random.nextInt(100) + 1,
    ));

    return post;
  }
}