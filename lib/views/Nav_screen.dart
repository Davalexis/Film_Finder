import 'package:flutter/material.dart';
import 'package:Film_Finder/views/Download_view/dowload_screen.dart';
import 'package:Film_Finder/views/Genre_view/genre_screen.dart';
import 'package:Film_Finder/views/Home_views/home_screen.dart';
import 'package:Film_Finder/views/Home_views/home_veiw_widgets/bottomnavigation_widget.dart';
import 'package:Film_Finder/views/Saved_view/Saved_screen.dart';


class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  int _currentIndex = 0;
//  final int _selectedIndex = 0;
  

  
   final List<Widget> _screens = [
     HomeScreen(),    // Index 0
     GenreScreen(),   // Index 1
     SavedScreen(),   // Index 2
     DowloadScreen(),// Index 3
  ];


 

  // Callback function passed to the BottomnavigationWidget
  void _onItemTapped(int index) {
    // Update the state when an item is tapped
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: IndexedStack( // Use IndexedStack to keep screen states alive
         index: _currentIndex,
         children: _screens,
      ),

      bottomNavigationBar: BottomnavigationWidget(
        selectedIndex: _currentIndex,
        onItemTaped: _onItemTapped, // Correct function name passed
      ),
    );
  }
}