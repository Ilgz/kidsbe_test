import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:times_wire/application/article/article_slider_watcher/article_slider_watcher_cubit.dart';
import 'package:times_wire/application/article/fav_article_actor/fav_article_actor_cubit.dart';
import 'package:times_wire/presentation/article/article_page.dart';
import 'package:times_wire/presentation/core/widgets/custom_icon.dart';
import 'package:times_wire/presentation/core/widgets/custom_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ArticleSlider extends HookWidget {
  ArticleSlider({Key? key}) : super(key: key);

  final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleSliderWatcherCubit, ArticleSliderWatcherState>(
      builder: (context, state) {
        if (state.isLoading) {
          return CarouselSlider.builder(
            options: CarouselOptions(height: 250, enableInfiniteScroll: false),
            itemCount: 7,
            itemBuilder: (context, index, pageViewIndex) {
              return CustomShimmer(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(12)),
                  height: 250,
                  width: 250,
                ),
              );
            },
          );
        }
        return state.articles.isEmpty
            ? SizedBox()
            : CarouselSlider.builder(
                carouselController: carouselController,
                options:
                    CarouselOptions(height: 250, enableInfiniteScroll: false),
                itemCount: state.articles.length,
                itemBuilder: (context, index, pageViewIndex) {
                  final article = state.articles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ArticlePage(articleLink: article.url)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      height: 250,
                      width: 250,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: article.multimedia.isNotEmpty
                                  ? article.multimedia.first.url
                                  : "https://i.insider.com/60df54bc4a93e20019129b92?width=700",
                              placeholder: (context, status) {
                                return CustomShimmer(
                                  child: Center(
                                      child: Container(
                                    color: Colors.red,
                                    width: double.infinity,
                                    height: double.infinity,
                                  )),
                                );
                              },
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(12)),
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            if (article.isFavorite) {
                                              context
                                                  .read<FavArticleActorCubit>()
                                                  .deleteFavArticle(article);
                                            } else {
                                              context
                                                  .read<FavArticleActorCubit>()
                                                  .createFavArticle(article);
                                            }
                                          },
                                          child: CustomIcon(
                                              iconName: article.isFavorite
                                                  ? 'bookmark_filled'
                                                  : 'bookmark',
                                              size: 24,
                                              color: Colors.white))
                                    ],
                                  ))),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.section.toUpperCase(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        article.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ))),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.section.toUpperCase(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        article.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )))
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
