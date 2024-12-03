import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/models/post_model.dart';
import 'package:quest/utils/colors.dart';

class BuddyProfileFromFeed extends StatefulWidget {
  final int index;

  const BuddyProfileFromFeed({super.key, required this.index});

  @override
  State<BuddyProfileFromFeed> createState() => _BuddyProfileFromFeedState();
}

class _BuddyProfileFromFeedState extends State<BuddyProfileFromFeed>
    with TickerProviderStateMixin {
  List<PostModel> posts = [];
  List<PostModel> selectedPosts = [];

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for scaling and shaking effects
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Scale animation (for enlarging)
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    // Shake animation (to make it shake left and right)
    _shakeAnimation = Tween<double>(begin: 0.0, end: 15.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticIn),
    );

    // Listen for the status of the animation to reverse when done
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Reverse the animation after it completes
        _animationController.reverse();
      }
    });

    posts = PostModel.getBeforeCategories(); // Load all posts once
    String selectedUser = posts[widget.index].username;

    // Select posts for the selected user
    selectedPosts =
        posts.where((post) => post.username == selectedUser).toList();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleFavorite(int index) {
    setState(() {
      if (selectedPosts[index].isFavorited) {
        selectedPosts[index].likedAmount -= 1;
        selectedPosts[index].isFavorited = false;
      } else {
        selectedPosts[index].likedAmount += 1;
        selectedPosts[index].isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColors().cremeColor,
      body: Column(
        children: [
          ProfileHeader(),
          QuestHistoryTab(),
          Quests(),
        ],
      ),
    );
  }

  Expanded Quests() {
    return Expanded(
      child: ListView.builder(
        itemCount: selectedPosts.length, // Total number of containers
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: selectedPosts[index]
                    .boxColor, // Adjusted index for HistModel list
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: .5, color: OurColors().darkGrey),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff1D1617).withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2.0)
                ]),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quest Completed',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        selectedPosts[index].time,
                        style:
                            GoogleFonts.lato(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 300,
                      child: Text(
                        selectedPosts[index].quest,
                        softWrap: true,
                        style:
                            GoogleFonts.lato(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/icons/checkcircle.svg")
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 0.3,
                  width: 375,
                  decoration: BoxDecoration(
                      color: OurColors().darkGrey,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => toggleFavorite(index),
                      child: AnimatedScale(
                        scale: selectedPosts[index].isFavorited
                            ? 1.0
                            : 1.0, // Scale up when favorited
                        duration: const Duration(
                            milliseconds: 300), // Smooth transition
                        curve: Curves
                            .easeInOut, // Use an easing curve for a smooth effect
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            // You can customize the transition animation here
                            return ScaleTransition(
                                scale: animation, child: child);
                          },
                          child: Icon(
                            selectedPosts[index].isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            key: ValueKey<bool>(
                                selectedPosts[index].isFavorited),
                            color: selectedPosts[index].isFavorited
                                ? Colors.red
                                : OurColors().darkGrey, // Color change
                            size: 25, // Icon size
                          ),
                        ),
                      ),
                    ),
                    Text(
                      selectedPosts[index].likedAmount.toString(),
                      style:
                          GoogleFonts.lato(fontSize: 12, color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Container QuestHistoryTab() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 35,
      width: 350,
      decoration: BoxDecoration(
        color: const Color(0xffCCB3DE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          "Quest History",
          style: GoogleFonts.lato(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Row ProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipOval(
          child: Image.asset(
            posts[widget.index].image,
            width: 100,
          ),
        ),
        Container(
          height: 115,
          width: 2,
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
        ),
        Container(
          height: 150,
          width: 225,
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                posts[widget.index].fullName,
                style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                posts[widget.index].username,
                style: GoogleFonts.lato(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Stack
              (
              alignment: Alignment.center,
                children: 
                [
                  Align
                  (
                    alignment: Alignment.centerRight,
                    child: RemoveBuddyButton(),
                  ),
                  Align
                  (
                    alignment: Alignment.centerLeft,
                    child: TauntButton(),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
GestureDetector TauntButton() {
    return GestureDetector(
      onTap: () {
        // Start the animation when the button is pressed
        _animationController.forward();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          // Apply the scaling and shaking animations
          return Transform.translate(
            offset:
                Offset(_shakeAnimation.value, 0), // Apply shaking (left-right)
            child: Transform.scale(
              scale: _scaleAnimation.value, // Apply scaling (enlarging)
              child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.4),
                          blurRadius: 1,
                          spreadRadius: 1.0,
                          offset: const Offset(0, 2))
                    ],
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffCCB3DE),
                  ),
                  child: Center(
                      child: Text("Taunt",
                          style: GoogleFonts.lato(
                              color: Colors.black, fontSize: 18)))),
            ),
          );
        },
      ),
    );
  }
  GestureDetector RemoveBuddyButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.4),
                blurRadius: 1,
                spreadRadius: 1.0,
                offset: const Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffCCB3DE),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(child: Icon(Icons.delete)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text("Remove",
                        style: GoogleFonts.lato(color: Colors.black))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
