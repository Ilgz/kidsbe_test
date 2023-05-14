import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:times_wire/application/article/article_manager/article_manager_cubit.dart';
import 'package:times_wire/application/article/fav_article_watcher/fav_article_watcher_cubit.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/presentation/article/widgets/article_card.dart';
import 'package:times_wire/presentation/core/widgets/custom_icon.dart';
import 'package:times_wire/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:times_wire/presentation/core/widgets/custom_scaffold.dart';
import 'package:times_wire/presentation/profile/sub_pages/language_page.dart';
import 'package:times_wire/presentation/profile/sub_pages/privacy_page.dart';
import 'package:times_wire/presentation/profile/sub_pages/terms_and_conditions_page.dart';
import 'package:times_wire/presentation/profile/widgets/profile_section_widget.dart';
import 'package:times_wire/presentation/profile/widgets/push_notification_switch.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Clear focus when tapped outside
        FocusScope.of(context).unfocus();
      },
      child: CustomScaffold(
        isScrolling: true,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile",
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 32,
            ),
            Row(children: [
              CircleAvatar(radius:32,backgroundColor:Colors.white,child: CustomIcon(iconName: "user",size: 40,color: Colors.grey,)),
              SizedBox(width: 16,),
              Expanded(
                child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                  const Text("User",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 4,),
                  Text("user@gmail.com",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500)),
                ],),
              ),
            ],),
            SizedBox(height: 24,),
            ProfileSectionWidget(name: "Notifications", onPressed: (){

            },trailingWidget: PushNotificationSwitch()),
            SizedBox(height: 16,),
            ProfileSectionWidget(name: "Language", onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguagePage()));
            }),
            SizedBox(height: 32,),
            ProfileSectionWidget(name: "Privacy", onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPage()));
            }),
            SizedBox(height: 16,),
            ProfileSectionWidget(name: "Terms & Conditions", onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndConditionsPage()));
            }),

          ],
        ),
      ),
    );
  }

}
