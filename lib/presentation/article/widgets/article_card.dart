import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times_wire/application/article/fav_article_actor/fav_article_actor_cubit.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/presentation/article/article_page.dart';
import 'package:times_wire/presentation/core/widgets/custom_icon.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticlePage( articleLink: article.url)));
      },
      child: Material(
        elevation: 0.5,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                         child: ClipRRect(borderRadius:BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),child: CachedNetworkImage(imageUrl:article.multimedia.isNotEmpty?article.multimedia.first.url:"https://www.tckpublishing.com/wp-content/uploads/2021/05/question-mark.jpg",errorWidget: (context, url, error) => Icon(Icons.error),width: double.infinity,height: double.infinity,fit: BoxFit.cover,)),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: new BorderRadius.all(const Radius.circular(12.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(article.isFavorite){
                            context.read<FavArticleActorCubit>().deleteFavArticle(article);
                          }else{
                            context.read<FavArticleActorCubit>().createFavArticle(article);
                          }
                        },
                        child: CustomIcon(iconName: article.isFavorite?'bookmark_filled':'bookmark',size: 24,color: article.isFavorite?null:Colors.grey[400])
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
