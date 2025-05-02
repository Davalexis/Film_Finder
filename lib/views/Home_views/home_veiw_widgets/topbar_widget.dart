import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:Film_Finder/constants/constants_files.dart';

class TopbarWidget extends StatelessWidget {
  const TopbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Positioned.fill(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
      
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 10),
              child: Text('Trending movies ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white
              ),
              ),
            ),

            Spacer(),

            ClipRRect(
              child: InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                                 color: kTextColor.withOpacity(0.2), // Semi-transparent white
                                 shape: BoxShape.circle,
                                 border: Border.all(color: kTextColor.withOpacity(0.2), 
                                 width: 2
                                 ),
                               ),
                  
                  child: Icon(IconsaxPlusLinear.notification,
                  size: 20,
                  color: kTextColor),
                  ),
              ),
            ),
            

              SizedBox(width: 14),


              ClipRRect(
                child: InkWell(
                  onTap: (){},
                  child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                                 color: kTextColor.withOpacity(0.2), // Semi-transparent white
                                 shape: BoxShape.circle,
                                 border: Border.all(color: kTextColor.withOpacity(0.2), 
                                 width: 2
                                 ),
                               ),
                  
                  child: Icon(IconsaxPlusLinear.search_normal,
                  size: 20,
                  color: kTextColor),
                  ),
                            ),
              ), 
          ],
        ),
        ),
    );

  }
}