import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/models/buddyListModel.dart';
import 'package:quest/utils/colors.dart';

class BuddyList extends StatefulWidget {
  final Function(int) onGoToBuddy;
  final bool afterAddedBuddy;
  final bool alreadyLoaded;
  static final GlobalKey<_BuddyListState> _buddyListKey = GlobalKey();

  const BuddyList(
      {super.key, required this.onGoToBuddy, required this.afterAddedBuddy, required this.alreadyLoaded});

  @override
  State<BuddyList> createState() => _BuddyListState();
}

class _BuddyListState extends State<BuddyList> {
  final TextEditingController _controller = TextEditingController();

  // The full list of buddies
  List<BuddyListModel> buddies = [];
  // The list of buddies that match the search criteria
  List<BuddyListModel> searchBuddies = [];

  @override
  void initState() {
    super.initState();

    // Initialize the list only once when the widget is first created
    setState(() {
      if (buddies.isEmpty) {
      if (!widget.afterAddedBuddy) {
        // Load the full list of buddies initially
        buddies = BuddyListModel.getBeforeCategories();
      } else {
        // Load the full list of buddies after adding a buddy
        buddies = BuddyListModel.getAfterCategories();
      }
      // Start by showing all buddies
      searchBuddies = List.from(buddies);
    }
    });
    
    
  }

  @override
  void dispose(){
    buddies.clear();
    searchBuddies.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: BuddyList._buddyListKey,
      body: ListView.builder(
        itemCount: searchBuddies.length + 1,
        itemBuilder: (context, index) {
          // First item is the search bar
          if (index == 0) {
            return SearchBar();
          } else {
            return ListOfBuddies(index);
          }
        },
      ),
    );
  }

  // Display each buddy in the list
  Container ListOfBuddies(int index) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Buddy image
          ClipOval(
            child: Image.asset(
              searchBuddies[index - 1].image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          // Buddy name container
          Container(
            height: 50,
            width: 225,
            decoration: BoxDecoration(
              color: OurColors().lightPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    searchBuddies[index - 1].username,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          // Arrow button to go to buddy detail
          GestureDetector(
            onTap: () {
              widget.onGoToBuddy(index - 1);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: OurColors().lightPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const SizedBox(
                height: 35,
                width: 35,
                child: Icon(Icons.arrow_right_alt),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Search bar to filter buddies
  Container SearchBar() {
    return Container(
      margin: const EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _controller,
        style: GoogleFonts.lato(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 232, 219, 240),
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search by Username',
          hintStyle:
              GoogleFonts.lato(color: const Color(0x66262626), fontSize: 14),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  GestureDetector(
                    onTap: () {
                      String user = _controller.text;

                      // If the search text is empty, show all buddies
                      if (user.isEmpty) {
                        setState(() {
                          searchBuddies = List.from(buddies);
                        });
                      } else {
                        // Filter the buddies based on the search text
                        setState(() {
                          searchBuddies = buddies
                              .where((buddy) => buddy.username
                                  .toLowerCase()
                                  .contains(user.toLowerCase()))
                              .toList();
                        });
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search, color: Color(0x66262626)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
