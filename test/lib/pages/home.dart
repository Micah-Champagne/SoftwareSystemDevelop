// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/models/category_model.dart';
import 'package:test/models/diets.dart';
import 'package:test/models/popular.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> pops = [];

  void _getInitInfo() {
    categories = CategoryModel.getCats();
    diets = DietModel.getDiets();
    pops = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitInfo();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _SearchContainer(),

            const SizedBox(height: 40),

            _categoriesSection(),

            const SizedBox(height: 40),

            _DietsSection(),

            const SizedBox(height: 40),

            _popsSection(),

            const SizedBox(height: 40),

          ],

        )
      );
  }

  Column _popsSection() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Popular',
                  style: TextStyle( 
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )
                ),
              ),
              const SizedBox(height: 15),
              ListView.separated(
                itemCount: pops.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 25),
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index){
                  return Container( 
                    //color: Colors.blue,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          pops[index].iconPath,
                          width: 65,
                          height: 65),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pops[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                              )
                            ),
                            Text(
                              '${pops[index].level} | ${pops[index].duration} | ${pops[index].calorie}',
                              style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                              )
                            )
                          ]
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 30,
                            height: 30
                          ), 
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: pops[index].boxIsSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: pops[index].boxIsSelected ? [
                        BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(.07),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0
                        )
                      ] : []
                    )
                  );
                }
              ),
            ]
          );
  }

  Column _DietsSection() {
    return Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Recommendation\nfor Diet',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                //color: Colors.blue,
                height: 200,
                child: ListView.separated(
                  itemBuilder: (context, index){
                    return Container(
                      width: 210,
                      decoration: BoxDecoration(
                        color: diets[index].boxColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(diets[index].iconPath),
                          
                          Column(
                            children: [
                              Text(
                                diets[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )
                              ),
                              
                              Text(
                                '${diets[index].level} | ${diets[index].duration} | ${diets[index].calories}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                )
                              ),
                            ],
                          ),

                          Container( 
                            height:35,
                            width:100,
                            child: Center( 
                              child: Text(
                                'View',
                                style: TextStyle(
                                  color: diets[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                                )
                              ),),
                            //color: Colors.yellow,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  diets[index].viewIsSelected ? const Color(0xff9DCEff) : Colors.transparent,
                                  diets[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent
                                ]
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            
                            )
                        ],
                      )
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(width: 25),
                  itemCount: diets.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left:20, right:20),
                )
              ),
            ]
          );
  }

  Column _categoriesSection() {
    return Column(
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
              SizedBox(
                  height: 120,
                  //color: Colors.green,
                  child: ListView.separated(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    separatorBuilder: (context, index) => const SizedBox(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(categories[index].iconPath),
                                ),
                              ),
                              Text(
                                categories[index].name,
                                style: const TextStyle( 
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 13,
                                )
                              )
                            ]
                          )
                        );
                    },
                  ))
            ],
          );
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
