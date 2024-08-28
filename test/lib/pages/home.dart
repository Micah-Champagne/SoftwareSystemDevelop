import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          
          Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff1D1617).withOpacity(.3),
                  blurRadius: 40,
                  spreadRadius: 1.0
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset('assets/icons/search-5-svgrepo-com.svg')
                ),
                suffixIcon: IntrinsicHeight( 
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ 
                      VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.7,
                      ),
                      Padding( 
                        padding: const EdgeInsets.all(7),
                        child: SvgPicture.asset('assets/icons/filter-svgrepo-com.svg')
                      )
                    ] //child
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                )
              ),
            ),
          )
        ],
      )
    );
  }

  AppBar appBar(){
    return AppBar(
        title: const Text(
          'Breakfasts',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold
          )
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,

        leading: GestureDetector(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/left-arrow-svgrepo-com.svg',
              height: 30,
              width: 30
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),

        actions: [
          GestureDetector(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/dots-horizontal-svgrepo-com.svg',
                height: 50,
                width: 50
              ),
              decoration: BoxDecoration(
                color: Color(0xFF),
                borderRadius: BorderRadius.circular(10)
              ),
            )
          )
        ],

    );
  }
}