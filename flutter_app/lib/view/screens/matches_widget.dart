import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/star_ratting_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/screens/conversation_call_screen.dart';

class MatchesWidget extends StatefulWidget {
  @override
  _MatchesWidgetState createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  int ratting;
  bool favorateIcon=false;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,

        itemCount:10,
        separatorBuilder: (_,__)=>Container(
          height: 10,
        ),
        itemBuilder: (context, snapshot) {
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 2,right: 2),
              child:
              Container(

                padding: EdgeInsets.symmetric(vertical: AppConstants.defaultPadding, horizontal: AppConstants.defaultPadding),
                decoration: BoxDecoration(
                    color: ColorConstants.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x14000000),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height * 0.14,
                      height: MediaQuery.of(context).size.height * 0.14,
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                        borderRadius:
                        BorderRadius.circular(AppConstants.defaultPadding),

                      ),
                      child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(AppConstants.defaultPadding),

                          child: Image.asset(AssetConstants.dummyImage5,fit: BoxFit.cover,)),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeadings.heading1('Pamela Helbert',textScaleFactor: 1.2,
                            textAlign: TextAlign.left
                            ),

                            TextHeadings.simpleText('Pamela Helbert',
                                textAlign: TextAlign.left,
                            height: 1.4),


                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  StatefulWrtieReviewStarRating(
                                    rating: ratting,
                                    onRating: (int rating) {
                                      setState(() {
                                        this.ratting = rating;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ratting == null || ratting == 0
                                        ? Text('')
                                        : TextHeadings.simpleText(
                                        ratting.toString(),
                                        color: ColorConstants.reviewStarColor,
                                        isBold: true),
                                  ),

                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 3, horizontal: 3),
                          decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ]),
                          child: Icon(

                            favorateIcon?Icons.favorite: Icons.favorite_outline,
                            color:favorateIcon?Colors.red: ColorConstants.greyColor,

                          ),
                        ),
                        onTap: () {
                          setState(() {
                            favorateIcon=!favorateIcon;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ConversationCallScreen()));
            },
          );
        }
    );
  }
}
