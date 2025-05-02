import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:Film_Finder/constants/constants_files.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
                         padding: const EdgeInsets.symmetric(horizontal:100, ),
                         child: Center(
                           child: Column(
                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                             children: [
                               
                                  
                              Icon(IconsaxPlusLinear.archive_minus,
                               size:200 ,
                               color: kTextColor.withOpacity(0.6),
                               ),
                               
                               SizedBox(height: 12,),
                               Text('NO SAVED MOVIE YET ',
                                style: TextStyle(
                                  fontFamily: 'inriaSans',
                                  fontSize: 23,
                              color: kTextSecondaryColor.withOpacity(0.6)
                                ),
                                                       
                             ),
                                
                             ],
                           ),
                         ),
                         ),
      
    );
  }
}