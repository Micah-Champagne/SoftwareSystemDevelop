import 'package:flutter/material.dart';

class CurrentQuestModel {

  String time;
  String quest;
  Color boxColor;

  CurrentQuestModel({
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


    post.add(CurrentQuestModel(
      time: "Just now",
      quest: "Complete the online course on Data Science",
      boxColor: education,
    ));

    post.add(CurrentQuestModel(
      time: "1 hour ago",
      quest: "Read the chapter on Artificial Intelligence in the textbook",
      boxColor: education,
    ));

    post.add(CurrentQuestModel(
      time: "30 minutes ago",
      quest: "Go for a morning jog in the park",
      boxColor: physical,
    ));

    post.add(CurrentQuestModel(
      time: "2 hours ago",
      quest: "Do a full-body workout at the gym",
      boxColor: physical,
    ));

    post.add(CurrentQuestModel(
      time: "2 hours ago",
      quest: "Attend the quarterly business strategy meeting",
      boxColor: professional,
    ));

    post.add(CurrentQuestModel(
      time: "5 hours ago",
      quest: "Prepare the presentation for the client pitch",
      boxColor: professional,
    ));

    post.add(CurrentQuestModel(
      time: "1 hour ago",
      quest: "Wash the dishes and clean the kitchen",
      boxColor: chores,
    ));

    post.add(CurrentQuestModel(
      time: "3 hours ago",
      quest: "Vacuum the entire house and organize the living room",
      boxColor: chores,
    ));

    post.add(CurrentQuestModel(
      time: "6 hours ago",
      quest: "Pick up groceries for the week",
      boxColor: chores,
    ));

    post.add(CurrentQuestModel(
      time: "7 hours ago",
      quest: "Review and revise the project budget",
      boxColor: professional,
    ));

    return post;
  }
}
