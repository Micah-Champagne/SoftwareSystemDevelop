
class BuddyListModel {
String image;
String name;


BuddyListModel(
    {required this.image,
    required this.name,});
static List<BuddyListModel> getCategories() {
    List<BuddyListModel> buddy = [];


    String AbbyPhoto = "assets/icons/abby.jpeg";
    String ArushiPhoto = "assets/icons/arushi.jpeg";
    String TylerPhoto = "assets/icons/tyler.jpeg";
    String ReinhardPhoto = "assets/icons/reinhard.jpeg";
    String NashPhoto = "assets/icons/nash.jpeg";
    String WillPhoto = "assets/icons/will.jpeg";
    String LeePhoto = "assets/icons/lee.jpeg";
    String GoldenPhoto = "assets/icons/golden.jpeg";

    String AbbyUser = "@AbEE33";
    String ArushiUser = "@Yoshi";
    String TylerUser = "@StayZan234";
    String ReinhardUser = "@RineH3art";
    String NashUser = "@Nash1_Bo1";
    String WillUser = "@Bi.ll.iam";
    String LeeUser = "@Le0p0ld";
    String GoldenUser = "Goled";
    

    buddy.add(BuddyListModel(
        image: NashPhoto,
        name: NashUser,
    ));

        buddy.add(BuddyListModel(
        image: TylerPhoto,
        name: TylerUser,
    ));

        buddy.add(BuddyListModel(
        image: WillPhoto,
        name: WillUser,
    ));

        buddy.add(BuddyListModel(
        image: ReinhardPhoto,
        name: ReinhardUser,
    ));

        buddy.add(BuddyListModel(
        image: LeePhoto,
        name: LeeUser,
    ));

        buddy.add(BuddyListModel(
        image: AbbyPhoto,
        name: AbbyUser,
    ));

        buddy.add(BuddyListModel(
        image: ArushiPhoto,
        name: ArushiUser,
    ));

    
    return buddy;
}
}
