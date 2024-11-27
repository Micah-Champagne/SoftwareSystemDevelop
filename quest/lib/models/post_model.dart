import 'package:flutter/material.dart';

class PostModel {
  String image;
  String username;
  String time;
  String fullName;
  String quest;
  Color boxColor;
  bool isFavorited;
  int likedAmount;

  PostModel({
    required this.fullName,
    required this.image,
    required this.username,
    required this.time,
    required this.quest,
    required this.boxColor,
    this.isFavorited = false,
    required this.likedAmount,
  });

  static List<PostModel> getAfterCategories() {
    List<PostModel> post = [];

    Color education = const Color(0xffE2F0F5);
    Color physical = const Color(0xffFBE1D2);
    Color professional = const Color(0xffE1F4D8);
    Color chores = const Color(0xffFFF6C9);

    String AbbyPhoto = "assets/icons/abby.jpeg";
    String ArushiPhoto = "assets/icons/arushi.jpeg";
    String TylerPhoto = "assets/icons/tyler.jpeg";
    String ReinhardPhoto = "assets/icons/reinhard.jpeg";
    String MicahPhoto = "assets/icons/Micah.jpeg";
    String NashPhoto = "assets/icons/nash.jpeg";
    String WillPhoto = "assets/icons/will.jpeg";
    String LeePhoto = "assets/icons/lee.jpeg";

    String AbbyUser = "@AbEE33";
    String ArushiUser = "@Yoshi";
    String TylerUser = "@StayZan234";
    String ReinhardUser = "@RineH3art";
    String MicahUser = "@ChampagnePapi";
    String NashUser = "@Nash1_Bo1";
    String WillUser = "@Bi.ll.iam";
    String LeeUser = "@Le0p0old";

    String AbbyFullName = "Abby Debenport";
    String ArushiFullName = "Arushi Ghildiyal";
    String TylerFullName = "Tyler Saizan";
    String ReinhardFullName = "Reinhard Perez";
    String MicahFullName = "Micah Champagne";
    String NashFullName = "Nash";
    String WillFullName = "William Cathy";
    String LeeFullName = "Lee Bledsoe";

    // Adding more posts for everyone with specific times, and ordered by most recent
    post.add(PostModel(
        fullName: MicahFullName,
        image: MicahPhoto,
        username: MicahUser,
        time: "Just now",
        quest: "Read a book",
        boxColor: education,
        likedAmount: 0));

    post.add(PostModel(
      image: NashPhoto,
      username: NashUser,
      time: "Just now",
      fullName: NashFullName,
      quest: "Plan weekend getaway",
      boxColor: physical,
      likedAmount: 73,
    ));

    post.add(PostModel(
      image: LeePhoto,
      username: LeeUser,
      time: "5 minutes ago",
      fullName: LeeFullName,
      quest: "Wash the dishes",
      boxColor: chores,
      likedAmount: 40,
    ));

    post.add(PostModel(
      image: AbbyPhoto,
      username: AbbyUser,
      time: "10 minutes ago",
      fullName: AbbyFullName,
      quest: "Clean my room",
      boxColor: chores,
      likedAmount: 34,
    ));

    post.add(PostModel(
      image: TylerPhoto,
      username: TylerUser,
      time: "15 minutes ago",
      fullName: TylerFullName,
      quest: "Study for exam",
      boxColor: education,
      likedAmount: 78,
    ));

    post.add(PostModel(
      image: ArushiPhoto,
      username: ArushiUser,
      time: "20 minutes ago",
      fullName: ArushiFullName,
      quest: "Submit hours in workday",
      boxColor: professional,
      likedAmount: 55,
    ));

    post.add(PostModel(
      image: ReinhardPhoto,
      username: ReinhardUser,
      time: "25 minutes ago",
      fullName: ReinhardFullName,
      quest: "Run for Physical Fitness test",
      boxColor: physical,
      likedAmount: 92,
    ));

    post.add(PostModel(
      image: NashPhoto,
      username: NashUser,
      time: "30 minutes ago",
      fullName: NashFullName,
      quest: "Review meeting agenda",
      boxColor: professional,
      likedAmount: 51,
    ));

    post.add(PostModel(
      image: MicahPhoto,
      username: MicahUser,
      time: "1 hour ago",
      fullName: MicahFullName,
      quest: "Cried",
      boxColor: professional,
      likedAmount: 28,
    ));

    post.add(PostModel(
      image: WillPhoto,
      username: WillUser,
      time: "1 hours ago",
      fullName: WillFullName,
      quest: "Work on new project",
      boxColor: professional,
      likedAmount: 50,
    ));

    post.add(PostModel(
      image: AbbyPhoto,
      username: AbbyUser,
      time: "1 hour ago",
      fullName: AbbyFullName,
      quest: "Finish Milestone 2",
      boxColor: education,
      likedAmount: 68,
    ));

    post.add(PostModel(
      image: ArushiPhoto,
      username: ArushiUser,
      time: "1 hour ago",
      fullName: ArushiFullName,
      quest: "Complete project report",
      boxColor: professional,
      likedAmount: 62,
    ));

    post.add(PostModel(
      image: NashPhoto,
      username: NashUser,
      time: "2 hours ago",
      fullName: NashFullName,
      quest: "Update personal website",
      boxColor: professional,
      likedAmount: 80,
    ));

    post.add(PostModel(
      image: LeePhoto,
      username: LeeUser,
      time: "2 hours ago",
      fullName: LeeFullName,
      quest: "Launch new campaign",
      boxColor: education,
      likedAmount: 90,
    ));

    post.add(PostModel(
      image: TylerPhoto,
      username: TylerUser,
      time: "2 hours ago",
      fullName: TylerFullName,
      quest: "Go for a morning run",
      boxColor: physical,
      likedAmount: 59,
    ));

    post.add(PostModel(
      image: ReinhardPhoto,
      username: ReinhardUser,
      time: "2 hours ago",
      fullName: ReinhardFullName,
      quest: "Write a blog post",
      boxColor: professional,
      likedAmount: 65,
    ));

    post.add(PostModel(
      image: MicahPhoto,
      username: MicahUser,
      time: "3 hours ago",
      fullName: MicahFullName,
      quest: "Buy groceries",
      boxColor: chores,
      likedAmount: 56,
    ));

    post.add(PostModel(
      image: NashPhoto,
      username: NashUser,
      time: "4 hours ago",
      fullName: NashFullName,
      quest: "Clean out email inbox",
      boxColor: education,
      likedAmount: 60,
    ));

    post.add(PostModel(
      image: AbbyPhoto,
      username: AbbyUser,
      time: "4 hours ago",
      fullName: AbbyFullName,
      quest: "Complete online course",
      boxColor: education,
      likedAmount: 78,
    ));

    post.add(PostModel(
      image: TylerPhoto,
      username: TylerUser,
      time: "5 hours ago",
      fullName: TylerFullName,
      quest: "Prepare for presentation",
      boxColor: professional,
      likedAmount: 92,
    ));

    post.add(PostModel(
      image: ReinhardPhoto,
      username: ReinhardUser,
      time: "6 hours ago",
      fullName: ReinhardFullName,
      quest: "Stretching exercises",
      boxColor: physical,
      likedAmount: 49,
    ));

    post.add(PostModel(
      image: MicahPhoto,
      username: MicahUser,
      time: "7 hours ago",
      fullName: MicahFullName,
      quest: "Clean kitchen",
      boxColor: chores,
      likedAmount: 88,
    ));

    // Additional posts for Will
    post.add(PostModel(
      image: WillPhoto,
      username: WillUser,
      time: "8 hours ago",
      fullName: WillFullName,
      quest: "Plan vacation",
      boxColor: education,
      likedAmount: 64,
    ));

    post.add(PostModel(
      image: LeePhoto,
      username: LeeUser,
      time: "10 hours ago",
      fullName: LeeFullName,
      quest: "Attend business meeting",
      boxColor: professional,
      likedAmount: 75,
    ));

    return post;
  }

  static List<PostModel> getBeforeCategories() {
    List<PostModel> post = [];

    Color education = const Color(0xffE2F0F5);
    Color physical = const Color(0xffFBE1D2);
    Color professional = const Color(0xffE1F4D8);
    Color chores = const Color(0xffFFF6C9);

    String AbbyPhoto = "assets/icons/abby.jpeg";
    String ArushiPhoto = "assets/icons/arushi.jpeg";
    String TylerPhoto = "assets/icons/tyler.jpeg";
    String ReinhardPhoto = "assets/icons/reinhard.jpeg";
    String MicahPhoto = "assets/icons/Micah.jpeg";
    String NashPhoto = "assets/icons/nash.jpeg";
    String WillPhoto = "assets/icons/will.jpeg";
    String LeePhoto = "assets/icons/lee.jpeg";

    String AbbyUser = "@AbEE33";
    String ArushiUser = "@Yoshi";
    String TylerUser = "@StayZan234";
    String ReinhardUser = "@RineH3art";
    String MicahUser = "@ChampagnePapi";
    String NashUser = "@Nash1_Bo1";
    String WillUser = "@Bi.ll.iam";
    String LeeUser = "@Le0p0old";

    String AbbyFullName = "Abby Debenport";
    String ArushiFullName = "Arushi Ghildiyal";
    String TylerFullName = "Tyler Saizan";
    String ReinhardFullName = "Reinhard Perez";
    String MicahFullName = "Micah Champagne";
    String NashFullName = "Nash";
    String WillFullName = "William Cathy";
    String LeeFullName = "Lee Bledsoe";

    // Adding more posts for everyone with specific times, and ordered by most recent
    post.add(PostModel(
      image: NashPhoto,
      username: NashUser,
      time: "Just now",
      fullName: NashFullName,
      quest: "Plan weekend getaway",
      boxColor: physical,
      likedAmount: 73,
    ));

    post.add(PostModel(
      image: LeePhoto,
      username: LeeUser,
      time: "5 minutes ago",
      fullName: LeeFullName,
      quest: "Wash the dishes",
      boxColor: chores,
      likedAmount: 40,
    ));

    post.add(PostModel(
      image: AbbyPhoto,
      username: AbbyUser,
      time: "10 minutes ago",
      fullName: AbbyFullName,
      quest: "Clean my room",
      boxColor: chores,
      likedAmount: 34,
    ));

    post.add(PostModel(
      image: TylerPhoto,
      username: TylerUser,
      time: "15 minutes ago",
      fullName: TylerFullName,
      quest: "Study for exam",
      boxColor: education,
      likedAmount: 78,
    ));

    post.add(PostModel(
      image: ArushiPhoto,
      username: ArushiUser,
      time: "20 minutes ago",
      fullName: ArushiFullName,
      quest: "Submit hours in workday",
      boxColor: professional,
      likedAmount: 55,
    ));

    post.add(PostModel(
      image: ReinhardPhoto,
      username: ReinhardUser,
      time: "25 minutes ago",
      fullName: ReinhardFullName,
      quest: "Run for Physical Fitness test",
      boxColor: physical,
      likedAmount: 92,
    ));

    post.add(PostModel(
      image: NashPhoto,
      username: NashUser,
      time: "30 minutes ago",
      fullName: NashFullName,
      quest: "Review meeting agenda",
      boxColor: professional,
      likedAmount: 51,
    ));

    post.add(PostModel(
      image: MicahPhoto,
      username: MicahUser,
      time: "1 hour ago",
      fullName: MicahFullName,
      quest: "Cried",
      boxColor: professional,
      likedAmount: 28,
    ));

    post.add(PostModel(
      image: WillPhoto,
      username: WillUser,
      time: "1 hours ago",
      fullName: WillFullName,
      quest: "Work on new project",
      boxColor: professional,
      likedAmount: 50,
    ));

    post.add(PostModel(
      image: AbbyPhoto,
      username: AbbyUser,
      time: "1 hour ago",
      fullName: AbbyFullName,
      quest: "Finish Milestone 2",
      boxColor: education,
      likedAmount: 68,
    ));

    post.add(PostModel(
      image: ArushiPhoto,
      username: ArushiUser,
      time: "1 hour ago",
      fullName: ArushiFullName,
      quest: "Complete project report",
      boxColor: professional,
      likedAmount: 62,
    ));

    post.add(PostModel(
      image: NashPhoto,
      username: NashUser,
      time: "2 hours ago",
      fullName: NashFullName,
      quest: "Update personal website",
      boxColor: professional,
      likedAmount: 80,
    ));

    post.add(PostModel(
      image: LeePhoto,
      username: LeeUser,
      time: "2 hours ago",
      fullName: LeeFullName,
      quest: "Launch new campaign",
      boxColor: education,
      likedAmount: 90,
    ));

    post.add(PostModel(
      image: TylerPhoto,
      username: TylerUser,
      time: "2 hours ago",
      fullName: TylerFullName,
      quest: "Go for a morning run",
      boxColor: physical,
      likedAmount: 59,
    ));

    post.add(PostModel(
      image: ReinhardPhoto,
      username: ReinhardUser,
      time: "2 hours ago",
      fullName: ReinhardFullName,
      quest: "Write a blog post",
      boxColor: professional,
      likedAmount: 65,
    ));

    post.add(PostModel(
      image: MicahPhoto,
      username: MicahUser,
      time: "3 hours ago",
      fullName: MicahFullName,
      quest: "Buy groceries",
      boxColor: chores,
      likedAmount: 56,
    ));

    post.add(PostModel(
      image: NashPhoto,
      username: NashUser,
      time: "4 hours ago",
      fullName: NashFullName,
      quest: "Clean out email inbox",
      boxColor: education,
      likedAmount: 60,
    ));

    post.add(PostModel(
      image: AbbyPhoto,
      username: AbbyUser,
      time: "4 hours ago",
      fullName: AbbyFullName,
      quest: "Complete online course",
      boxColor: education,
      likedAmount: 78,
    ));

    post.add(PostModel(
      image: TylerPhoto,
      username: TylerUser,
      time: "5 hours ago",
      fullName: TylerFullName,
      quest: "Prepare for presentation",
      boxColor: professional,
      likedAmount: 92,
    ));

    post.add(PostModel(
      image: ReinhardPhoto,
      username: ReinhardUser,
      time: "6 hours ago",
      fullName: ReinhardFullName,
      quest: "Stretching exercises",
      boxColor: physical,
      likedAmount: 49,
    ));

    post.add(PostModel(
      image: MicahPhoto,
      username: MicahUser,
      time: "7 hours ago",
      fullName: MicahFullName,
      quest: "Clean kitchen",
      boxColor: chores,
      likedAmount: 88,
    ));

    // Additional posts for Will
    post.add(PostModel(
      image: WillPhoto,
      username: WillUser,
      time: "8 hours ago",
      fullName: WillFullName,
      quest: "Plan vacation",
      boxColor: education,
      likedAmount: 64,
    ));

    post.add(PostModel(
      image: LeePhoto,
      username: LeeUser,
      time: "10 hours ago",
      fullName: LeeFullName,
      quest: "Attend business meeting",
      boxColor: professional,
      likedAmount: 75,
    ));

    return post;
  }
}
