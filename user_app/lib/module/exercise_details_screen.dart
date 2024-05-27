import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/Classes/language_constants.dart';
import 'package:user_app/module/exercise-screen.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  const ExerciseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/img/bridge.png",
            width:MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 7,),
            SharedColorText(
            text: translation(context).bridge,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 7,),
            SharedColorText(
            text: translation(context).text,
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: CupertinoColors.black,
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
      
                SizedBox(
                  width: 30,
                  height: 30,
                  child: MaterialButton(
                    onPressed: () {},
                    color:const  Color.fromRGBO(9, 107, 97, 0.2),
                    height: 30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child:const Align(
                      alignment: AlignmentDirectional.center,
                      child: SharedColorText(
                        text: "-",
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
               const SharedColorText(
                  text:" 00:30",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.black,
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: MaterialButton(
                    onPressed: () {},
                    color:const  Color.fromRGBO(12, 138, 125, 0.6),
                    height: 30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child:const Align(
                      alignment: AlignmentDirectional.center,
                      child: SharedColorText(
                        text: "+",
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Row(
            children: [
              const Expanded(child:  Center()),
              MaterialButton(
                onPressed: () {},
                color:const  Color(0XFF0C8A7D),
                height: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: SharedColorText(
                      text: translation(context).save,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Expanded(child:  Center()),
      
            ],
          ),
        ],
      ),
    );
  }
}
