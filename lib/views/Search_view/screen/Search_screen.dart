import 'package:Film_Finder/core/constants/constants_files.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> actors = [
    'Leonardo DiCaprio',
    'Scarlett Johansson',
    'Tom Hardy',
    'Natalie Portman',
    'Chris Hemsworth',
    'Zendaya',
    'Denzel Washington',
    'Angela Bassett',
    'Idris Elba',
    'Lupita Nyong\'o',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              TextField(
                cursorColor: kPrimaryColor,
                onChanged: (value) {},
                autofocus: false,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  prefixIcon: const Icon(
                    IconsaxPlusLinear.search_normal,
                    color: kTextColor,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                  filled: true,
                  fillColor: kBackgroundColor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30),
              Text(
                'Actors',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemExtent: 200,
                  padding: EdgeInsets.only(top: 8, left: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: actors.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage(
                            'assets/images/actor${index + 1}.jpg',
                          ),
                          backgroundColor: kBackgroundColor,
                        ),
                        SizedBox(height: 5),
                        Text(
                          actors[index],
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Text('Recommended',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white)),

              SizedBox(height: 20,),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:  kBackgroundColor,
                      ),
                      child: Center(
                          child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                          )
                        ],
                      )),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 16,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  