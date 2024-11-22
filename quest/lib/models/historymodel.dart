import 'package:flutter/material.dart';

class HistoryModel {
  String image;
  String name;
  String time;
  String quest;
  Color boxColor;

  HistoryModel({
    required this.image,
    required this.name,
    required this.time,
    required this.quest,
    required this.boxColor,
  });

  static List<HistoryModel> getCategories() {
    List<HistoryModel> post = [];

    Color education = const Color(0xffE2F0F5);
    Color physical = const Color(0xffFBE1D2);
    Color professional = const Color(0xffE1F4D8);
    Color chores = const Color(0xffFFF6C9);

    // User and photo assets
    String MicahPhoto = "assets/icons/Micah.jpeg";
    String MicahUser = "@ChampagnePapi";

    // Quest titles that correlate with the color meanings
    // Each quest title correlates to the color's meaning
    post.add(HistoryModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "Just now",
      quest: "Review study material for final exams", // Education quest
      boxColor: education,
    ));

    post.add(HistoryModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "3 minutes ago",
      quest: "Go for a 5K run to prepare for fitness test", // Physical quest
      boxColor: physical,
    ));

    post.add(HistoryModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "37 minutes ago",
      quest: "Attend the professional networking event", // Professional quest
      boxColor: professional,
    ));

    post.add(HistoryModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "49 minutes ago",
      quest: "Clean up the living room", // Chores quest
      boxColor: chores,
    ));

    post.add(HistoryModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "1 hour ago",
      quest:
          "Organize the study materials for next semester", // Education quest
      boxColor: education,
    ));

    post.add(HistoryModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "2 hours ago",
      quest: "Complete physical therapy exercises", // Physical quest
      boxColor: physical,
    ));

    post.add(HistoryModel(
      image: MicahPhoto,
      name: MicahUser,
      time: "3 hours ago",
      quest:
          "Complete and submit the work project proposal", // Professional quest
      boxColor: professional,
    ));

    return post;
  }
}
