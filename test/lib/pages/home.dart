import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/models/category_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  void _getCats() {
    categories = CategoryModel.getCats();
  }

  @override
  Widget build(BuildContext context) {
    _getCats();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SearchContainer(),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Category',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    height: 120,
                    //color: Colors.green,
                    child: ListView.separated(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 25,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color:
                                    categories[index].boxColor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle))
                                ]));
                      },
                    ))
              ],
            )
          ],
        ));
  }

  Container _SearchContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(.3),
            blurRadius: 40,
            spreadRadius: 1.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search for recipes',
            hintStyle: const TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 14,
            ),
            prefixIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child:
                    SvgPicture.asset('assets/icons/search-5-svgrepo-com.svg')),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.7,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(7),
                        child: SvgPicture.asset(
                            'assets/icons/filter-svgrepo-com.svg')),
                  ], //child
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfasts',
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold)),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/left-arrow-svgrepo-com.svg',
              height: 30, width: 30),
          decoration: BoxDecoration(
              color: const Color(0x000000ff),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              // ignore: sort_child_properties_last
              child: SvgPicture.asset(
                  'assets/icons/dots-horizontal-svgrepo-com.svg',
                  height: 50,
                  width: 50),
              decoration: BoxDecoration(
                  color: const Color(0x000000ff),
                  borderRadius: BorderRadius.circular(10)),
            ))
      ],
    );
  }
}
