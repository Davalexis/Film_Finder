
import 'package:Film_Finder/model/movie_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryConfigModel {
  final String name; 
  final FutureProvider<List<Movie>> provider;

  CategoryConfigModel({
    required this.name, 
    required this.provider
    });  
}
