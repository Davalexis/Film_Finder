// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:Film_Finder/core/constants/constants_files.dart';
import 'package:Film_Finder/model/category_Config_model.dart';
import 'package:Film_Finder/views/Home_views/widget/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Film_Finder/Providers/movie_provider.dart';
import 'package:Film_Finder/widget/background_fade_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CategoryConfigModel> categories = [
      CategoryConfigModel(
        name: 'Popular',
        provider: popularMovieProvider,
      ),
      CategoryConfigModel(
        name: 'Trending',
        provider: trendingMovieProvider,
      ),

      CategoryConfigModel(
      name: 'Top Rated', 
      provider: nowPlayingMovieProvider)
    ];

    // final movieAsync = ref.watch(popularMovieProvider);
    return Scaffold(
      body: Stack(
        children: [
          BackgroundFadeWidget(),
          PageView.builder(
            scrollDirection: Axis.vertical,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final movieAsync = ref.watch(category.provider);
                return movieAsync.when(
                  data: (movies) {
                    return MovieCardWidget(
                      title: category.name,
                      movies: movies,
                    );
                  },
                  loading: () {
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator(
                        color: kPrimaryColor,
                        strokeWidth: 2,
                      )),
                    );
                  },
                  error: (err, _) {
                    return Center(
                      child: Text(
                        err.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}
