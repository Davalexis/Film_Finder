import 'package:flutter/material.dart';
import 'package:Film_Finder/constants/constants_files.dart';

class TabbarWidget extends StatelessWidget {

  final TabController tabController;
  final List<String> genre;

  const TabbarWidget({super.key, required this.tabController, required this.genre});
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      indicatorColor: Colors.black,
    
      labelColor: Colors.transparent,
      unselectedLabelColor: Colors.grey,
        tabs: genre.map((genre)=>Tab(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, ),
            child: Text(genre, 
            style: TextStyle(
              fontSize: 20,
              fontFamily: '',
              fontWeight: FontWeight.normal,
              color: kTextColor
            ) ,
            ),
          ),
        )
      ).toList(),
    );
  }
}