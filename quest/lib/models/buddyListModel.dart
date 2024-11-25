class BuddyListModel {
  String image;
  String username;

  BuddyListModel.BuddyListModel({
    required this.image,
    required this.username,
  });

    static List<BuddyListModel> buddyBefore = [];
    static List<BuddyListModel> buddyAfter = [];

    static String AbbyPhoto = "assets/icons/abby.jpeg";
    static String ArushiPhoto = "assets/icons/arushi.jpeg";
    static String TylerPhoto = "assets/icons/tyler.jpeg";
    static String ReinhardPhoto = "assets/icons/reinhard.jpeg";
    static String NashPhoto = "assets/icons/nash.jpeg";
    static String WillPhoto = "assets/icons/will.jpeg";
    static String LeePhoto = "assets/icons/lee.jpeg";
    static String AnindoPhoto = "assets/icons/anindo.jpeg";
    static String PeytonPhoto = "assets/icons/peyton.jpeg";

    static String AbbyUser = "@AbEE33";
    static String ArushiUser = "@Yoshi";
    static String TylerUser = "@StayZan234";
    static String ReinhardUser = "@RineH3art";
    static String NashUser = "@Nash1_Bo1";
    static String WillUser = "@Bi.ll.iam";
    static String LeeUser = "@Le0p0ld";
    static String AnindoUser = "@N1tind0";
    static String PeytonUser = "@Paintin'";

  static List<BuddyListModel> getBeforeCategories() {
    buddyBefore.add(BuddyListModel.BuddyListModel(
      image: NashPhoto,
      username: NashUser,
    ));
    buddyBefore.add(BuddyListModel.BuddyListModel(
      image: TylerPhoto,
      username: TylerUser,
    ));
    buddyBefore.add(BuddyListModel.BuddyListModel(
      image: WillPhoto,
      username: WillUser,
    ));
    buddyBefore.add(BuddyListModel.BuddyListModel(
      image: ReinhardPhoto,
      username: ReinhardUser,
    ));
    buddyBefore.add(BuddyListModel.BuddyListModel(
      image: LeePhoto,
      username: LeeUser,
    ));
    buddyBefore.add(BuddyListModel.BuddyListModel(
      image: AbbyPhoto,
      username: AbbyUser,
    ));
    buddyBefore.add(BuddyListModel.BuddyListModel(
      image: ArushiPhoto,
      username: ArushiUser,
    ));

    return buddyBefore;
  }

  static List<BuddyListModel> getAfterCategories() {
    buddyAfter = buddyBefore;
    buddyAfter.add(BuddyListModel.BuddyListModel(
      image: AnindoPhoto,
      username: AnindoUser,
    ));

    buddyAfter.add(BuddyListModel.BuddyListModel(
      image: PeytonPhoto,
      username: PeytonUser,
    ));

    return buddyAfter;
  }

  static List<BuddyListModel> getNewBuddyCategories() {
    List<BuddyListModel> addBuddy = [];

    String AnindoPhoto = "assets/icons/anindo.jpeg";
    String PeytonPhoto = "assets/icons/peyton.jpeg";
    String PhilPhoto = "assets/icons/philnew.jpeg";
    String EllenPhoto = 'assets/icons/ellen.jpeg';
    String TimmyPhoto = "assets/icons/timmy.jpeg";
    String HabeebPhoto = "assets/icons/habeeb.jpeg";
    String GoldenPhoto = "assets/icons/golden.jpeg";
    String TamPhoto = "assets/icons/tam.jpeg";

    String AnindoUser = "@N1tind0";
    String PeytonUser = "@Paintin'";
    String PhilUser = "@Fil";
    String EllenUser = "@EllenDeGenrous";
    String TimmyUser = "@TimmyTurner";
    String HabeebUser = "@Scooter_Boy123";
    String GoldenUser = "@KingRichard";
    String TamUser = "@TAMarind";

    addBuddy.add(BuddyListModel.BuddyListModel(
      image: AnindoPhoto,
      username: AnindoUser,
      
    ));

    addBuddy.add(BuddyListModel.BuddyListModel(
      image: PeytonPhoto,
      username: PeytonUser,
      
    ));

    addBuddy.add(BuddyListModel.BuddyListModel(
      image: PhilPhoto,
      username: PhilUser,
      
    ));

    addBuddy.add(BuddyListModel.BuddyListModel(
      image: EllenPhoto,
      username: EllenUser,
      
    ));

    addBuddy.add(BuddyListModel.BuddyListModel(
      image: TimmyPhoto,
      username: TimmyUser,
      
    ));

    addBuddy.add(BuddyListModel.BuddyListModel(
      image: HabeebPhoto,
      username: HabeebUser,
      
    ));

    addBuddy.add(BuddyListModel.BuddyListModel(
      image: GoldenPhoto,
      username: GoldenUser,
      
    ));

    addBuddy.add(BuddyListModel.BuddyListModel(
      image: TamPhoto,
      username: TamUser,
      
    ));

    return addBuddy;
  }
}
