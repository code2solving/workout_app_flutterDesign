import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workouthelper/models/fullModel.dart';
import 'package:workouthelper/models/lowerModel.dart';
import 'package:workouthelper/models/model.dart';
import 'package:workouthelper/models/upperModel.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});


  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  var heartRate;
  var toDo;
  var calories;
  int _activPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  List<FullModel> listFull=[];
  List<UpperModel> listUpper=[];
  List<LowerModel> listLower=[];
  List<List<Model>> listAct=[];
  List<String> exercises =[];


  void init(){
    listFull=FullModel.getFull();
    listUpper=UpperModel.getUpper();
    listLower=LowerModel.getLower();
    heartRate=81;
    toDo=32.5;
    calories=1000;
    listAct=[listFull,listUpper,listLower];
    exercises=['Full Body', 'Upper Body', 'Lower Body'];
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Column(
          children: [
            userStats(),
            SizedBox(height: 24),
            workoutProgramm()
          ],
        );
  }
  Column workoutProgramm() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Workout programs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              ),
              SizedBox(height: 16),
              Stack(
                children:[
                  SizedBox(
                    width: double.infinity,
                    height: 550,
                    child: Padding(
                      padding: const EdgeInsets.only(top:50),
                      child: PageView.builder(
                        onPageChanged: (value){
                          setState(() {
                            _activPage=value;
                          });
                        },
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int listIndex) {
                          return Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.only(left:9,right:9 ),
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 326,
                                    height: 174,
                                    decoration: BoxDecoration(
                                      color: Color(0xffEAECF5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:  Stack(
                                      children: [
                                        Positioned(
                                          left: 16,
                                          top: 15,
                                          child: Container(
                                            width:68,
                                            height: 36,
                                            child: Center(
                                              child: Text(
                                                listAct[listIndex][index].duration +' days',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xffFCFCFD),
                                              borderRadius: BorderRadius.circular(999),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 53,
                                          left: 16,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                //width:280,
                                                height:120,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        listAct[listIndex][index].theme,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        listAct[listIndex][index].themeText,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Icon(Icons.lock_clock),
                                                          SizedBox(width: 6),
                                                          Text('30 min',
                                                          style: TextStyle(
                                                            fontSize: 12
                                                          ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                ),
                                              ),
                                            SizedBox(width: 3,),

                                              Container(
                                                width: 160,
                                                height: 118,
                                                 decoration: BoxDecoration(
                                                   image: DecorationImage(
                                                     image: AssetImage(listAct[listIndex][index].imagePath),
                                                     fit: BoxFit.cover
                                                   ),
                                                 ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 24),
                              ),
                          );
                        },
                      ),
                    )
                ),
                  Positioned(
                    top:0,
                    child: Container(
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List<Widget>.generate(3, (index) =>
                        InkWell(
                          onTap: (){
                            _pageController.animateToPage(index, duration: Duration(microseconds: 900), curve: Curves.easeIn);
                          },
                            child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _activPage==index?Colors.grey.withOpacity(0.3):Colors.transparent,
                              ),
                              width: 115,
                              height: 44,
                              child: Center(
                                child: Text(
                                  exercises[index],
                                  style: TextStyle(
                                  fontSize: 16
                                ),
                                ),
                              ),
                        )
                        )
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
  }

  Container userStats() {
    return Container(
            padding: EdgeInsets.only(top: 27),
            width: 330,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/heartRate.svg"),
                    Text("$heartRate BPM",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/to-do.svg"),
                    Text("$toDo %",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/Calories.svg"),
                    Text("$calories Cal",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }

}
