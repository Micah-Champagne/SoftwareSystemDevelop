import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quest/models/post_model.dart';

class OurHomePage extends StatefulWidget {
  const OurHomePage({super.key});

  @override
  State<OurHomePage> createState() => _OurHomePageState();
}

class _OurHomePageState extends State<OurHomePage> {
  final Color _OurLightPurple = const Color(0x99838ef4);
  final Color _OurDarkGrey = const Color(0xff262626);
  final Color _OurPurpleBackground = const Color(0xff838ef4);
  final Color _OurCremeColor = const Color(0xfffefdf5);

  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    posts = PostModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _OurCremeColor,
        body: ListView.builder(
            itemCount: posts.length + 1, // Total number of containers
            itemBuilder: (context, index) {
              if (index == 0) {
                // First container with different style
                return Leaderboard();
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
          border: Border.all(width: 1, color: _OurDarkGrey),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 5.0)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: _OurDarkGrey)),
                child: ClipOval(
                  child: Image.asset(
                    posts[index - 1].image,
                    height: 50,
                    width: 50,
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
                      '${posts[index - 1].name} Completed',
                      softWrap: true,
                      style: TextStyle(
                          color: _OurDarkGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    posts[index - 1].time,
                    style: TextStyle(color: _OurDarkGrey, fontSize: 14),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 0.3,
            width: 375,
            decoration: BoxDecoration(
                color: _OurDarkGrey, borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(posts[index - 1].quest,
                  style: TextStyle(color: _OurDarkGrey, fontSize: 20)),
              const Spacer(),
              SvgPicture.asset("assets/icons/checkcircle.svg")
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (posts[index - 1].isFavorited) {
                  posts[index - 1].isFavorited = false;
                  posts[index - 1].likedAmount--;
                } else {
                  posts[index - 1].isFavorited = true;
                  posts[index - 1].likedAmount++;
                }
              });
            },
            child: Row(
              children: [
                Icon(
                    posts[index - 1].isFavorited
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: posts[index - 1].isFavorited
                        ? Colors.red
                        : _OurDarkGrey),
                Text(
                  posts[index - 1].likedAmount.toString(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container Leaderboard() {
    return Container(
        width: 200,
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.all(8.0),
        //padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _OurCremeColor,
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
                  Container(
                    child: SvgPicture.asset("assets/icons/2ndplace.svg",
                        //color: Colors.grey,
                        height: 40,
                        width: 40),
                  ),
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
                            width: 4, color: const Color(0xff8EC0DD))),
                    child: ClipOval(
                        child: Image.asset("assets/icons/arushi.jpeg",
                            height: 85, width: 85)),
                  ),
                  const Text("@Yoshi", style: TextStyle(fontSize: 16)),
                  const Text("102",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
                ],
              ),
              Column(
                children: [
                  Container(
                    // height: 60, width: 60,
                    // decoration: BoxDecoration(

                    //   shape: BoxShape.circle,
                    //   color: Color(0xffe2de01)
                    //),
                    child: SvgPicture.asset("assets/icons/crown.svg",
                        //color: Colors.orangeAccent,
                        height: 50,
                        width: 50),
                  ),
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
                            width: 4, color: const Color(0xffBFEAE7))),
                    child: ClipOval(
                        child: Image.asset("assets/icons/abby.jpeg",
                            height: 125, width: 125)),
                  ),
                  const SizedBox(height: 10),
                  const Text("@AbEE33", style: TextStyle(fontSize: 16)),
                  const Text("123",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    child: SvgPicture.asset("assets/icons/3rdpalce.svg",
                        //color: Colors.brown,
                        height: 40,
                        width: 40),
                  ),
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
                          color: const Color(0xff8EC0DD),
                          width: 4,
                        )),
                    child: ClipOval(
                        child: Image.asset("assets/icons/tyler.jpeg",
                            height: 85, width: 85)),
                  ),
                  const Text("@StayZan234", style: TextStyle(fontSize: 16)),
                  const Text("82",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 0.3,
            width: 375,
            decoration: BoxDecoration(
                color: _OurDarkGrey, borderRadius: BorderRadius.circular(5)),
          )
        ]));
  }
}
