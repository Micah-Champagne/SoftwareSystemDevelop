import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/models/post_model.dart';
import 'package:quest/utils/colors.dart';

class HomePage extends StatefulWidget {
  final Function(int) onGoToBuddy;
  final bool afterPosted;
  const HomePage(
      {super.key, required this.onGoToBuddy, required this.afterPosted});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    if (widget.afterPosted) {
      posts = PostModel.getAfterCategories();
    } else {
      posts = PostModel.getBeforeCategories();
    }
  }

  void toggleFavorite(int index) {
    setState(() {
      if (posts[index].isFavorited) {
        posts[index].likedAmount -= 1;
        posts[index].isFavorited = false;
      } else {
        posts[index].likedAmount += 1;
        posts[index].isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: OurColors().cremeColor,
        body: ListView.builder(
            itemCount: posts.length + 1, // Total number of containers
            itemBuilder: (context, index) {
              if (index == 0) {
                // First container with different style
                return Leaderboard(index);
              } else {
                // Subsequent containers with identical style
                return FeedModels(index);
              }
            }));
  }

  Container FeedModels(int index) {
    return Container(
      //height: 150,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: posts[index - 1].boxColor,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  widget.onGoToBuddy(index - 1);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: OurColors().darkGrey)),
                  child: ClipOval(
                    child: Image.asset(
                      posts[index - 1].image,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      '${posts[index - 1].username} Completed',
                      softWrap: true,
                      style: GoogleFonts.lato(
                          color: OurColors().darkGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    posts[index - 1].time,
                    style: GoogleFonts.lato(color: OurColors().darkGrey, fontSize: 16),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(posts[index - 1].quest,
                  style: GoogleFonts.lato(color: OurColors().darkGrey, fontSize: 20)),
              const Spacer(),
              SvgPicture.asset("assets/icons/checkcircle.svg")
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 0.1,
            width: 325,
            decoration: BoxDecoration(
                color: OurColors().darkGrey,
                borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => toggleFavorite(index - 1),
                child: AnimatedScale(
                  scale: posts[index - 1].isFavorited
                      ? 1.0
                      : 1.0, // Scale up when favorited
                  duration:
                      const Duration(milliseconds: 300), // Smooth transition
                  curve: Curves
                      .easeInOut, // Use an easing curve for a smooth effect
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      // You can customize the transition animation here
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      posts[index - 1].isFavorited
                          ? Icons.favorite
                          : Icons.favorite_border,
                      key: ValueKey<bool>(posts[index - 1].isFavorited),
                      color: posts[index - 1].isFavorited
                          ? Colors.red
                          : OurColors().darkGrey, // Color change
                      size: 25, // Icon size
                    ),
                  ),
                ),
              ),
              Text(
                posts[index - 1].likedAmount.toString(),
                style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container Leaderboard(int index) {
    return Container(
        width: 200,
        //padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.all(8.0),
        //padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: OurColors().cremeColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          const SizedBox(height: 5),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(height: 50),
                  SvgPicture.asset("assets/icons/2ndplace.svg",
                      //color: Colors.grey,
                      height: 40,
                      width: 40),
                  const SizedBox(height: 7),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 5, // Blur radius of the shadow
                              spreadRadius: 2),
                        ],
                        border: Border.all(
                            width: 4, color: const Color(0x99838ef4))),
                    child: GestureDetector(
                      onTap: () {
                        widget.onGoToBuddy(index + 4);
                      },
                      child: ClipOval(
                          child: Image.asset("assets/icons/arushi.jpeg",
                              height: 85, width: 85)),
                    ),
                  ),
                  Text("@Yoshi",
                      style: GoogleFonts.lato(fontSize: 16, color: Colors.black)),
                  Text("102",
                      style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset("assets/icons/crown.svg",
                      //color: Colors.orangeAccent,
                      height: 50,
                      width: 50),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 5),
                              blurRadius: 5, // Blur radius of the shadow
                              spreadRadius: 2),
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 4, color: const Color(0x99838ef4))),
                    child: GestureDetector(
                      onTap: () {
                        widget.onGoToBuddy(index + 2);
                      },
                      child: ClipOval(
                          child: Image.asset("assets/icons/abby.jpeg",
                              height: 125, width: 125)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("@AbEE33",
                      style: GoogleFonts.lato(fontSize: 16, color: Colors.black)),
                  Text("123",
                      style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 50),
                  SvgPicture.asset("assets/icons/3rdpalce.svg",
                      //color: Colors.brown,
                      height: 40,
                      width: 40),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 5, // Blur radius of the shadow
                              spreadRadius: 2),
                        ],
                        border: Border.all(
                          color: const Color(0x99838ef4),
                          width: 4,
                        )),
                    child: GestureDetector(
                      onTap: () {
                        widget.onGoToBuddy(index + 3);
                      },
                      child: ClipOval(
                          child: Image.asset("assets/icons/tyler.jpeg",
                              height: 85, width: 85)),
                    ),
                  ),
                  Text("@StayZan234",
                      style: GoogleFonts.lato(fontSize: 16, color: Colors.black)),
                  Text("82",
                      style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 0.3,
            width: 375,
            decoration: BoxDecoration(
                color: OurColors().darkGrey,
                borderRadius: BorderRadius.circular(5)),
          )
        ]));
  }
}
