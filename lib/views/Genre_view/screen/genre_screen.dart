import 'package:Film_Finder/views/Genre_view/widget/genre_grid_view.dart';
import 'package:Film_Finder/views/Genre_view/widget/genre_tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:Film_Finder/Data/movie_data.dart';
import 'package:Film_Finder/constants/constants_files.dart';




class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<GenreScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  final List<String> genre = [
    'Sci-Fi',
    'Adventure',
    'Horror',
    'Action',
    'Romance',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: genre.length, 
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Genres",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
            ),
            TabbarWidget(
              tabController: _tabController,
              genre: genre,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: genre.map((g) {
                  // Filter movies based on genre
                  final filteredMovies = trendingMovies
                      .where((m) => m.genre.toLowerCase() == g.toLowerCase())
                      .toList();
                  return GridViewWidget(movies: filteredMovies);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}