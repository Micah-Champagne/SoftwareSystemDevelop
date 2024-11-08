import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quest/models/historymodel.dart';

class OurHistory extends StatefulWidget {
  const OurHistory({super.key});

  @override
  State<OurHistory> createState() => _OurHistoryState();
}

class _OurHistoryState extends State<OurHistory> {
  final Color _OurLightPurple = const Color(0x99838ef4);
  final Color _OurDarkGrey = const Color(0xff262626);
  final Color _OurPurpleBackground = const Color(0xff838ef4);
  final Color _OurCremeColor = const Color(0xfffefdf5);
  List<HistoryModel> HistModel = [];

  @override
  Widget build(BuildContext context) {
    HistModel = HistoryModel.getCategories();
    return Scaffold(
      body: ListView.builder(
        itemCount: HistModel.length,
        itemBuilder: (context, index){
          return Container(
                  height: 150,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: HistModel[index].boxColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: _OurDarkGrey),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff1D1617).withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 5.0)
                      ]),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            const Text(
                              'Quest Completed',
                              style: TextStyle(
                                  
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              HistModel[index].time,
                              style: const TextStyle(
                              fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 0.3,
                        width: 375,
                        decoration: BoxDecoration(
                            color: _OurDarkGrey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 300,
                            child: Text(HistModel[index].quest,
                            //overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            
                                style: const TextStyle(
                                  
                                fontSize: 20)),
                          ),
                          const Spacer(),
                          SvgPicture.asset("assets/icons/checkcircle.svg")
                        ],
                      )
                    ],
                  ),
                );
        }));
    
  }
}