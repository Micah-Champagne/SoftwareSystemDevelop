import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/models/post_model.dart';

class OurFriendsPage extends StatefulWidget {
  final int index;

  const OurFriendsPage({super.key, required this.index});

  @override
  State<OurFriendsPage> createState() => _OurFriendsPageState();
}

class _OurFriendsPageState extends State<OurFriendsPage> with TickerProviderStateMixin {
  final Color _OurCremeColor = const Color(0xfffefdf5);
  final Color _OurDarkGrey = const Color(0xff262626);
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

  posts = PostModel.getCategories(); // Load all posts once
  String selectedUser = posts[widget.index].name;

  // Select posts for the selected user
  selectedPosts = posts.where((post) => post.name == selectedUser).toList();
}


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _OurCremeColor,
      body: Column(
        children: [
          Row(
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
                      posts[widget.index].FullName,
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      posts[widget.index].name,
                      style: GoogleFonts.lato(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        TauntButton(),
                        const SizedBox(width: 5),
                        RemoveBuddyButton(),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Expanded(
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
                      border: Border.all(width: .5, color: _OurDarkGrey),
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
                              selectedPosts[index]
                                  .time, // Adjusted index for HistModel list
                              style: GoogleFonts.lato(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 0.3,
                        width: 375,
                        decoration: BoxDecoration(
                            color: _OurDarkGrey,
                            borderRadius: BorderRadius.circular(5)),
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
                              style: GoogleFonts.lato(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset("assets/icons/checkcircle.svg")
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedPosts[index].isFavorited) {
                              selectedPosts[index].isFavorited = false;
                              selectedPosts[index].likedAmount--;
                            } else {
                              selectedPosts[index].isFavorited = true;
                              selectedPosts[index].likedAmount++;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                                selectedPosts[index].isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: selectedPosts[index].isFavorited
                                    ? Colors.red
                                    : _OurDarkGrey),
                            Text(
                              selectedPosts[index].likedAmount.toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
              offset: Offset(0,2))
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
                height: 50, width: 100, 
                decoration: BoxDecoration(
                            boxShadow: [
            BoxShadow(
              color: const Color(0xff1D1617).withOpacity(0.4),
              blurRadius: 1,
              spreadRadius: 1.0,
              offset: Offset(0,2))
          ],
                  border:  Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffCCB3DE),
                ),
                child: Center(child: Text("Taunt",style: GoogleFonts.lato(color: Colors.black, fontSize: 18)))
              ),
            ),
          );
        },
      ),
    );
  }
}
