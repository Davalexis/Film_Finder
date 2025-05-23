import 'package:flutter/material.dart';
import 'package:Film_Finder/constants/constants_files.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class BottomnavigationWidget extends StatelessWidget {
  const BottomnavigationWidget({super.key , required this.onItemTaped, required this.selectedIndex});


  final int selectedIndex;
  final Function(int) onItemTaped; 

  @override
  Widget build(BuildContext context) {
    return 
        Container(
          height: 80,
          decoration: BoxDecoration(
            color:Colors.black,

            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,

              )
            ]
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [

               _buildNavItem(
                icon: IconsaxPlusLinear.home_2,
                label: "Discover", 
                onTap: (){onItemTaped (0);}, 
                isSelected: selectedIndex== 0),

                
               _buildNavItem(
                icon: IconsaxPlusLinear.search_normal, 
                label: "Search", 
                onTap: (){onItemTaped(1);}, 
                isSelected: selectedIndex == 1),
                
                _buildNavItem(
                icon: IconsaxPlusLinear.archive_minus, 
                label: "Saved", 
                onTap: (){onItemTaped(2);}, 
                isSelected: selectedIndex == 2),

                _buildNavItem(
                icon: IconsaxPlusLinear.profile , 
                label: "Me", 
                onTap: (){onItemTaped(3);}, 
                isSelected: selectedIndex == 3),

          ],
        ),
      ); 
    }
  }


Widget _buildNavItem({
  required  IconData icon,
  required  String label,
  required  VoidCallback onTap ,
  required bool isSelected,
      }){
    final Color color = isSelected ? kPrimaryColor : kTextSecondaryColor;

    return InkWell(
      customBorder: CircleBorder(), 
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Icon(icon,
            color: color,
            size: 30,),

            SizedBox(height: 5,),

           Text(label,
           style: TextStyle(
            color: color,
            fontWeight : isSelected ? FontWeight.bold : FontWeight.normal
           ),
           )
          ],
        ),
      ),
    );
  }