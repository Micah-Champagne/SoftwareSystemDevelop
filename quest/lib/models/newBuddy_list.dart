class AddBuddyListModel {
  String image;
  String name;

  AddBuddyListModel({
    required this.image,
    required this.name,
  });
  static List<AddBuddyListModel> getCategories() {
    List<AddBuddyListModel> addBuddy = [];

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

    addBuddy.add(AddBuddyListModel(
      image: AnindoPhoto,
      name: AnindoUser,
      
    ));

    addBuddy.add(AddBuddyListModel(
      image: PeytonPhoto,
      name: PeytonUser,
      
    ));

    addBuddy.add(AddBuddyListModel(
      image: PhilPhoto,
      name: PhilUser,
      
    ));

    addBuddy.add(AddBuddyListModel(
      image: EllenPhoto,
      name: EllenUser,
      
    ));

    addBuddy.add(AddBuddyListModel(
      image: TimmyPhoto,
      name: TimmyUser,
      
    ));

    addBuddy.add(AddBuddyListModel(
      image: HabeebPhoto,
      name: HabeebUser,
      
    ));

    addBuddy.add(AddBuddyListModel(
      image: GoldenPhoto,
      name: GoldenUser,
      
    ));

    addBuddy.add(AddBuddyListModel(
      image: TamPhoto,
      name: TamUser,
      
    ));

    return addBuddy;
  }
}
