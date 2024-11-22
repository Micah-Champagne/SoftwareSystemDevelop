import 'package:flutter/material.dart';

class CurrentQuestModel {
  String image;
  String name;
  String time;
  String quest;
  Color boxColor;

  CurrentQuestModel({
    required this.image,
    required this.name,
    required this.time,
    required this.quest,
    required this.boxColor,
  });

  static List<CurrentQuestModel> getCategories() {
    List<CurrentQuestModel> post = [];

    Color education = const Color(0xffE2F0F5);
    Color physical = const Color(0xffFBE1D2);
    Color professional = const Color(0xffE1F4D8);
    Color chores = const Color(0xffFFF6C9);

    // User and photo assets
    String MicahPhoto = "assets/icons/Micah.jpeg";
    String MicahUser = "@ChampagnePapi";

    // Updated quest titles and descriptions

    // Education quests
    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "Just now",
      quest: "Complete the online course on Data Science",
      boxColor: education,
    ));

    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "1 hour ago",
      quest: "Read the chapter on Artificial Intelligence in the textbook",
      boxColor: education,
    ));

    // Physical quests
    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "30 minutes ago",
      quest: "Go for a morning jog in the park",
      boxColor: physical,
    ));

    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "2 hours ago",
      quest: "Do a full-body workout at the gym",
      boxColor: physical,
    ));

    // Professional quests
    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "2 hours ago",
      quest: "Attend the quarterly business strategy meeting",
      boxColor: professional,
    ));

    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "5 hours ago",
      quest: "Prepare the presentation for the client pitch",
      boxColor: professional,
    ));

    // Chores quests
    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "1 hour ago",
      quest: "Wash the dishes and clean the kitchen",
      boxColor: chores,
    ));

    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "3 hours ago",
      quest: "Vacuum the entire house and organize the living room",
      boxColor: chores,
    ));

    // Additional quests to make it even more diverse
    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "6 hours ago",
      quest: "Pick up groceries for the week",
      boxColor: chores,
    ));

    post.add(CurrentQuestModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "7 hours ago",
      quest: "Review and revise the project budget",
      boxColor: professional,
    ));

    return post;
  }
}
