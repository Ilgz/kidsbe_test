import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times_wire/application/article/article_manager/article_manager_cubit.dart';
import 'package:times_wire/application/article/article_searcher/article_searcher_cubit.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/presentation/article/widgets/article_card.dart';
import 'package:times_wire/presentation/article/widgets/article_category_selector.dart';
import 'package:times_wire/presentation/article/widgets/article_slider.dart';
import 'package:times_wire/presentation/article/widgets/search_bar.dart';
import 'package:times_wire/presentation/article/widgets/shimmer_article_card.dart';
import 'package:times_wire/presentation/core/constants.dart';
import 'package:times_wire/presentation/core/widgets/custom_scaffold.dart';

class ArticleOverviewPage extends StatelessWidget {
  const ArticleOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CustomScaffold(
        isScrolling: true,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Browse",
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 8,
            ),
            const Text("Discover things of this world",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 32,
            ),
            SearchBar(onChanged: (text) {
              List<Article> articles =
                  context.read<ArticleManagerCubit>().state.articles;
              context.read<ArticleSearcherCubit>().searchArticles(text);
              context.read<ArticleSearcherCubit>().updateArticles(articles);
            }),
            const SizedBox(
              height: 20,
            ),
            const ArticleCategorySelector(),
            const SizedBox(
              height: 20,
            ),
            ArticleSlider(),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<ArticleManagerCubit, ArticleManagerState>(
              listenWhen: (p, c) => p.articles != c.articles,
              listener: (context, state) {
                context
                    .read<ArticleSearcherCubit>()
                    .updateArticles(state.articles);
              },
              builder: (context, state) {
                return () {
                  if (state.unexpectedError) {
                    return const SizedBox();
                  } else if (state.isInProgress) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return const ShimmerArticleCard();
                            }),
                        const SizedBox(
                          height: 32,
                        )
                      ],
                    );
                  }
                  return BlocBuilder<ArticleSearcherCubit,
                      ArticleSearcherState>(
                    builder: (context, searcherState) {
                      final isSearching = searcherState.query.isNotEmpty;
                      final List<Article> articles =
                          getDisplayedArticles(state, searcherState);
                      if (articles.isEmpty) {
                        return const Text(
                          "No results found",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        );
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                final article = articles[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: ArticleCard(
                                    article: article,
                                  ),
                                );
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () => goToPreviousPage(
                                    context,
                                    isSearching,
                                    context.read<ArticleManagerCubit>(),
                                    context.read<ArticleSearcherCubit>()),
                                child: const CircleAvatar(
                                  backgroundColor: AppColors.primaryPurple,
                                  child: Icon(Icons.arrow_back,
                                      size: 18, color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                  isSearching
                                      ? searcherState.page.toString()
                                      : state.page.toString(),
                                  style: const TextStyle(
                                      backgroundColor: AppColors.primaryPurple,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                onTap: () => goToNextPage(
                                    context,
                                    isSearching,
                                    context.read<ArticleManagerCubit>(),
                                    context.read<ArticleSearcherCubit>()),
                                child: const CircleAvatar(
                                  backgroundColor: AppColors.primaryPurple,
                                  child: Icon(Icons.arrow_forward,
                                      size: 18, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          )
                        ],
                      );
                    },
                  );
                }();
              },
            )
          ],
        ),
      ),
    );
  }

  void goToNextPage(BuildContext context, bool isSearching,
      ArticleManagerCubit managerCubit, ArticleSearcherCubit searcherCubit) {
    if (isSearching) {
      if (searcherCubit.state.queriedArticles.length >
          searcherCubit.state.page * 5) {
        context.read<ArticleSearcherCubit>().nextPage();
      }
    } else {
      if (managerCubit.state.articles.length > managerCubit.state.page * 5) {
        context.read<ArticleManagerCubit>().nextPage();
      }
    }
  }

  void goToPreviousPage(BuildContext context, bool isSearching,
      ArticleManagerCubit managerCubit, ArticleSearcherCubit searcherCubit) {
    if (isSearching) {
      if (searcherCubit.state.page > 1) {
        context.read<ArticleSearcherCubit>().previousPage();
      }
    } else {
      if (managerCubit.state.page > 1) {
        context.read<ArticleManagerCubit>().previousPage();
      }
    }
  }

  List<Article> getDisplayedArticles(
      ArticleManagerState managerState, ArticleSearcherState searcherState) {
    final isSearching = searcherState.query.isNotEmpty;
    final int page = isSearching ? searcherState.page : managerState.page;
    final List<Article> articles =
        isSearching ? searcherState.queriedArticles : managerState.articles;
    final int startIndex = (page - 1) * 5;
    final int endIndex = min(startIndex + 5, articles.length);
    return articles.sublist(startIndex, endIndex);
  }
}
