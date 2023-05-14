import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times_wire/application/article/article_manager/article_manager_cubit.dart';
import 'package:times_wire/application/article/fav_article_watcher/fav_article_watcher_cubit.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/presentation/article/widgets/article_card.dart';
import 'package:times_wire/presentation/core/widgets/custom_icon.dart';
import 'package:times_wire/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:times_wire/presentation/core/widgets/custom_scaffold.dart';

class ArticleBookmarkOverviewPage extends StatelessWidget {
  const ArticleBookmarkOverviewPage({Key? key}) : super(key: key);

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
            Text("Bookmarks",
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 8,
            ),
            Text("Saved articles to the library",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 32,
            ),
            BlocBuilder<FavArticleWatcherCubit, FavArticleWatcherState>(
              builder: (context, state) {
             return    state.maybeMap(loadInProgress: (_){
               return CustomProgressIndicator();
             },loadSuccess: (state){
               final List<Article> articles = state.articleList;
               if (articles.isEmpty) {
                 return Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       CircleAvatar(
                         backgroundColor: Color(0xffeef0fb),
                         radius: 32,
                         child: CustomIcon(iconName: "book-alt",size: 24 ,),
                       ),
                       SizedBox(height: 24,),
                       SizedBox(
                         width: 256,
                         child: Text(
                           "You haven't saved any articles yet. Start reading and bookmarking them now",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               fontSize: 16,
                               color: Color(0xff4d4f5e),
                               fontWeight: FontWeight.w600),
                         ),
                       ),
                       SizedBox(height: 128,)
                     ],
                   ),
                 );
               } else {
                 return ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: articles.length,
                     itemBuilder: (context, index) {
                       final article = articles[index];
                       return Padding(
                         padding: const EdgeInsets.only(bottom: 16.0),
                         child: ArticleCard(
                           article: article,
                         ),
                       );
                     });
               }
             },orElse: () => SizedBox(),);

              },
            )
          ],
        ),
      ),
    );
  }
}
