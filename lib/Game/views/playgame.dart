import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jisan/Game/animation/animation.dart';
import 'package:jisan/Game/animation/FadeAnimation.dart';
import 'package:jisan/Game/levels/esay.dart';
import 'package:jisan/Game/levels/hard.dart';
import 'package:jisan/Game/levels/normal.dart';


class Starttogame extends StatefulWidget {
  const Starttogame({Key? key}) : super(key: key);

  @override
  _StarttogameState createState() => _StarttogameState();
}

class _StarttogameState extends State<Starttogame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070121),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFE5CD64).withOpacity(0.1),
                        offset: const Offset(0, 0.8),
                        blurRadius: 100,
                      )
                    ]
                ),
                child:AnimationImage(Imagefullname: 'images/wave-spiral-sphere.png',width: 320,height: 320)
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Imagelevels(Imagefilename: "images/icons8-diamond-green.png",buttontext: "স্তর 1",levelstxt: "সহজ",actiontext: "সহজ",),
            SizedBox(
              height: 15.0.h,
            ),
            Imagelevels(Imagefilename: "images/icons8-diamond-blue.png",buttontext: "স্তর 2",levelstxt: "স্বাভাবিক",actiontext: "স্বাভাবিক",),
            SizedBox(
              height: 15.0.h,
            ),
            Imagelevels(Imagefilename: "images/icons8-diamond-red.png",buttontext: "স্তর 3",levelstxt: "কঠিন",actiontext: "কঠিন",),

          ],
        ),
      ),
    );
  }
}



// Images of levels
class Imagelevels extends StatelessWidget {
  Imagelevels({required this.Imagefilename,required this.buttontext,required this.levelstxt,required this.actiontext});
  String Imagefilename;
  String buttontext;
  String levelstxt;
  String actiontext;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(delay: 0.8,
      child:SizedBox(
        width: 340.0.w,
        child: Container(
          margin: EdgeInsets.only(left: 30.0.w),
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: const LinearGradient(
              colors: [Color(0xFF4F2FF8), Color(0xFF5639E3)],
              begin:  FractionalOffset(0.0, 0.0),
              end:  FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
            ),
            boxShadow: const [
              BoxShadow(
                  color:  Color(0xFF4F2FF8),
                blurRadius: 8.0,
                offset:  Offset(0, 1),
              )
            ]
          ),
          child: TextButton(
            onPressed: (){
          Navigator.of(context).push(MaterialPageRoute (builder: (context){
            if (actiontext == "সহজ"){
              return  Esplay();
            }
            else if (actiontext == "স্বাভাবিক"){
              return  Normalplay();
            }
            else if (actiontext == "কঠিন"){
              return  Hardplay();
            }
            return Esplay();
          }));
            },
            child: Row(
              children: <Widget>[
                SizedBox(

                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white
                    ),
                    child:Image(image: AssetImage(Imagefilename)),
                  ),
                ),
                 SizedBox(
                  width: 60.0.w,
                ),
                SizedBox(
                  width: 100.0.w,
                  child: Container(
                    alignment: Alignment.center,
                      height: 70.0.h,
                      child: Column(
                        children: <Widget>[
                          Text(buttontext,style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0.sp),),
                          Text(levelstxt,style: const TextStyle(color: Colors.white54,fontWeight: FontWeight.bold),)
                        ],
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
