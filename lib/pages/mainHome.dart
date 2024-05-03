import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/feature_model.dart';
import '../models/mood_model.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  var currentIndex=0;
  List<MoodModel> moods = [];
  List<FeatureModel> features = [];
  List<SvgPicture> listOfNav = [];
  int _activPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _initState() {
    moods = MoodModel.getMoods();
    features = FeatureModel.getFeatures();
    listOfNav=[
      SvgPicture.asset('assets/icons/home.svg'),
      SvgPicture.asset('assets/icons/grid.svg'),
      SvgPicture.asset('assets/icons/calendar.svg'),
      SvgPicture.asset('assets/icons/user.svg')
    ];
  }

  @override
  Widget build(BuildContext context) {
    _initState();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
              children: [
                moodBlock(),
                SizedBox(height: 40),
                getFeatures(),
                SizedBox(height: 40),
                getExercise()
              ]
          ),
        ),
      ),
    );
  }


  Container getExercise() {
    return Container(
        height: 175,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Exercise',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text('See more',
                            style: TextStyle(
                              color: Color(0xff027A48),
                              fontSize: 14,
                            )),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.arrow_forward_sharp,
                            color: Color(0xff027A48),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width:152,
                      height: 57,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffB692F6).withOpacity(0.4)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/icons/relax.svg'),
                          const Text(
                            'Relaxtion',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          )
                        ],
                      )
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width:152,
                      height: 57,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffFAA7E0).withOpacity(0.4)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/icons/medi.svg'),
                          const Text(
                            'Meditation',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width:152,
                      height: 57,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffFEB273).withOpacity(0.4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/icons/breath.svg'),
                          const Text(
                            'Breathing',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          )
                        ],
                      )
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width:152,
                      height: 57,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff7CD4FD).withOpacity(0.4)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/icons/yoga.svg'),
                          const Text(
                            'Yoga',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          )
                        ],
                      )
                  ),
                )
              ],
            )
          ],
        )
    );
  }




  Container getFeatures() {
    return Container(
        height: 230,
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Feature',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Text('See more',
                                  style: TextStyle(
                                    color: Color(0xff027A48),
                                    fontSize: 14,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Color(0xff027A48),
                                ),
                              )
                            ],
                          ))
                    ]),
                SizedBox(
                  width: double.infinity,
                  height: 186,
                  child: PageView.builder(
                    onPageChanged: (value){
                      setState(() {
                        _activPage=value;
                      });
                    },
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height:150,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(30),
                            color: features[index].color.withOpacity(0.7)
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    features[index].theme,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    features[index].themeText,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: SvgPicture.asset(
                                            'assets/icons/play.svg'),
                                      ),
                                      Text(
                                        '10 min',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ]),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  features[index].imagePath,
                                  height: 90,
                                  width: 90,
                                ))
                          ],
                        ),
                      );
                    },
                    itemCount: features.length,
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      features.length,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap:(){
                            _pageController.animateToPage(index, duration: const Duration(microseconds: 300), curve: Curves.easeIn);
                          },
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: _activPage==index?Colors.grey:Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      )),
                ),
              ),
            )
          ],
        ));
  }



  Container moodBlock() {
    return Container(
        padding: EdgeInsets.only(left: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 24),
          Text(
            'Hello,Sara Rose',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 13),
          Text(
            'How are you feeling today?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Container(
            height: 90,
            width: 326,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 88,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: SvgPicture.asset(moods[index].iconpath),
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          moods[index].name,
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 20),
                itemCount: moods.length),
          ),
        ]));
  }
}



AppBar appBar() {
  return AppBar(
    titleSpacing: 0.0,
    title: Transform(
        transform: Matrix4.translationValues(-1.0, 0.0, 0.0),
        child: Text(
          "Moody",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )),
    leading: GestureDetector(
      onTap: () {},
      child: Padding(
          padding: const EdgeInsets.only(top: 9, left: 9, bottom: 9, right: 0),
          child: SvgPicture.asset('assets/icons/logo.svg')),
    ),
    actions: [
      GestureDetector(
          onTap: () {},
          child: Padding(
            padding:
            const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
            child: SvgPicture.asset('assets/icons/bell.svg'),
          )),
    ],
  );
}

class ImagePlaceholder extends StatelessWidget {
  final String? path;

  const ImagePlaceholder({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path!,
      fit: BoxFit.cover,
    );
  }
}
