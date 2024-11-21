class BuddyListModel1 {
  String image;
  String name;

  BuddyListModel1.buddyListModel1({
    required this.image,
    required this.name,
  });
  static List<BuddyListModel1> getCategories() {
    List<BuddyListModel1> buddy = [];

    String AbbyPhoto = "assets/icons/abby.jpeg";
    String ArushiPhoto = "assets/icons/arushi.jpeg";
    String TylerPhoto = "assets/icons/tyler.jpeg";
    String ReinhardPhoto = "assets/icons/reinhard.jpeg";
    String NashPhoto = "assets/icons/nash.jpeg";
    String WillPhoto = "assets/icons/will.jpeg";
    String LeePhoto = "assets/icons/lee.jpeg";

    String AbbyUser = "@AbEE33";
    String ArushiUser = "@Yoshi";
    String TylerUser = "@StayZan234";
    String ReinhardUser = "@RineH3art";
    String NashUser = "@Nash1_Bo1";
    String WillUser = "@Bi.ll.iam";
    String LeeUser = "@Le0p0ld";

    buddy.add(BuddyListModel1.buddyListModel1(
      image: NashPhoto,
      name: NashUser,
    ));

    buddy.add(BuddyListModel1.buddyListModel1(
      image: TylerPhoto,
      name: TylerUser,
    ));

    buddy.add(BuddyListModel1.buddyListModel1(
      image: WillPhoto,
      name: WillUser,
    ));

    buddy.add(BuddyListModel1.buddyListModel1(
      image: ReinhardPhoto,
      name: ReinhardUser,
    ));

    buddy.add(BuddyListModel1.buddyListModel1(
      image: LeePhoto,
      name: LeeUser,
    ));

    buddy.add(BuddyListModel1.buddyListModel1(
      image: AbbyPhoto,
      name: AbbyUser,
    ));

    buddy.add(BuddyListModel1.buddyListModel1(
      image: ArushiPhoto,
      name: ArushiUser,
    ));

    return buddy;
  }
}
