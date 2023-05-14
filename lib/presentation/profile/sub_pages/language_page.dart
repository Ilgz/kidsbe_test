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
import 'package:times_wire/presentation/profile/widgets/profile_section_widget.dart';
import 'package:times_wire/presentation/profile/widgets/push_notification_switch.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap:(){
                  Navigator.pop(context);
                },child: Icon(Icons.arrow_back,size: 20,color: Color(0xff6f7494),)),
                Text("Language",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 22,
                        fontWeight: FontWeight.w600)),
                Icon(Icons.arrow_back,size: 20,color: Colors.transparent,),
              ],
            ),
            SizedBox(height: 24,),
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              color: Color(0xff485ad6), borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  "English",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                    Icon(
                      Icons.done_rounded,
                      color: Colors.white,
                      size: 20,
                    )
              ],
            ),
          ),
        )
          ],
        ),
      ),
    );
  }

}
