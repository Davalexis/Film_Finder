import 'package:Film_Finder/constants/constants_files.dart';
import 'package:flutter/material.dart';

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
                onChanged: (value) {},
                autofocus: false,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search movies...',
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
                            'assets/actors/${actors[index].toLowerCase().replaceAll(" ", "_")}.jpg',
                          ), // Optional: use a default image
                          backgroundColor: kBackgroundColor,
                        ),
                        SizedBox(height: 5),
                        Text(
                          actors[index],
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
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
