import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest/models/buddyListModel.dart';
import 'package:quest/utils/colors.dart';

class AddBuddy extends StatefulWidget {
  const AddBuddy({super.key});

  @override
  State<AddBuddy> createState() => _AddBuddyState();
}

class _AddBuddyState extends State<AddBuddy> {
  final TextEditingController _controller = TextEditingController();

  List<BuddyListModel> AddBuddies = [];
  List<BuddyListModel> searchBuddies = []; // Initialize as empty
  List<bool> added = List.filled(8, false);

  @override
  void initState() {
    super.initState();
    // Initialize AddBuddies and searchBuddies
    AddBuddies = BuddyListModel.getNewBuddyCategories();
    searchBuddies = List.from(AddBuddies); // Start by showing all buddies
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 219, 240),
      body: ListView.builder(
        
        itemCount:
            searchBuddies.length + 1, // Use searchBuddies for the item count
        itemBuilder: (context, index) {
          if (index == 0) {
            return SearchBar();
          } else {
            return ListOfBuddies(index);
          }
        },
      ),
    );
  }

  Container ListOfBuddies(int index) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(left: 24, right: 24),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color: added[index-1] ? OurColors().lightPurple : Colors.transparent,
            borderRadius: BorderRadius.circular(20), 
            border: Border.all(
                color: OurColors().darkGrey,
                width: 1,
              
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: ClipOval(
                
                  child: Image.asset(
                    searchBuddies[index - 1].image,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 225,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        searchBuddies[index - 1].username,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    added[index - 1] = !added[index - 1];
                  });
                },
                child: Container(
                  height: 70,
                  width: 50,
                  color: Colors.transparent,
                  child: SizedBox(
                    height: 70,
                    width: 50,
                    child: added[index - 1]
                        ? const Icon(Icons.check)
                        : const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
          fillColor: OurColors().cremeColor,
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
                      setState(() {
                        if (user.isEmpty) {
                          searchBuddies =
                              List.from(AddBuddies); // Show all if empty
                        } else {
                          searchBuddies = AddBuddies.where((buddy) => buddy
                              .username
                              .toLowerCase()
                              .contains(user.toLowerCase())).toList();
                        }
                      });
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
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
