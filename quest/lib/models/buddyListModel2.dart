class BuddyListModel2 {
  String image;
  String name;

  BuddyListModel2.buddyListModel2({
    required this.image,
    required this.name,
  });
  static List<BuddyListModel2> getCategories() {
    List<BuddyListModel2> buddy = [];

    String AbbyPhoto = "assets/icons/abby.jpeg";
    String ArushiPhoto = "assets/icons/arushi.jpeg";
    String TylerPhoto = "assets/icons/tyler.jpeg";
    String ReinhardPhoto = "assets/icons/reinhard.jpeg";
    String NashPhoto = "assets/icons/nash.jpeg";
    String WillPhoto = "assets/icons/will.jpeg";
    String LeePhoto = "assets/icons/lee.jpeg";
    String AnindoPhoto = "assets/icons/anindo.jpeg";
    String PeytonPhoto = "assets/icons/peyton.jpeg";

    String AbbyUser = "@AbEE33";
    String ArushiUser = "@Yoshi";
    String TylerUser = "@StayZan234";
    String ReinhardUser = "@RineH3art";
    String NashUser = "@Nash1_Bo1";
    String WillUser = "@Bi.ll.iam";
    String LeeUser = "@Le0p0ld";
    String AnindoUser = "@N1tind0";
    String PeytonUser = "@Paintin'";

    buddy.add(BuddyListModel2.buddyListModel2(
      image: NashPhoto,
      name: NashUser,
    ));

    buddy.add(BuddyListModel2.buddyListModel2(
      image: TylerPhoto,
      name: TylerUser,
    ));

    buddy.add(BuddyListModel2.buddyListModel2(
      image: WillPhoto,
      name: WillUser,
    ));

    buddy.add(BuddyListModel2.buddyListModel2(
      image: ReinhardPhoto,
      name: ReinhardUser,
    ));

    buddy.add(BuddyListModel2.buddyListModel2(
      image: LeePhoto,
      name: LeeUser,
    ));

    buddy.add(BuddyListModel2.buddyListModel2(
      image: AbbyPhoto,
      name: AbbyUser,
    ));

    buddy.add(BuddyListModel2.buddyListModel2(
      image: ArushiPhoto,
      name: ArushiUser,
    ));

    buddy.add(BuddyListModel2.buddyListModel2(
      image: AnindoPhoto,
      name: AnindoUser,
    ));

    buddy.add(BuddyListModel2.buddyListModel2(
      image: PeytonPhoto,
      name: PeytonUser,
    ));

    return buddy;
  }
}
