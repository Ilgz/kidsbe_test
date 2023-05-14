import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times_wire/application/article/article_manager/article_manager_cubit.dart';
import 'package:times_wire/application/article/article_searcher/article_searcher_cubit.dart';
import 'package:times_wire/application/article/article_slider_watcher/article_slider_watcher_cubit.dart';
import 'package:times_wire/application/article/fav_article_actor/fav_article_actor_cubit.dart';
import 'package:times_wire/application/article/fav_article_watcher/fav_article_watcher_cubit.dart';
import 'package:times_wire/application/notification/notification_manager_cubit.dart';
import 'package:times_wire/application/topic/topic_cubit.dart';
import 'package:times_wire/injection.dart';
import 'package:times_wire/presentation/article/widgets/article_slider.dart';
import 'package:times_wire/presentation/core/widgets/scaffold_with_bottom.dart';

class AppWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  AppWidget({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ArticleSearcherCubit>(),
        ),
        BlocProvider(
          create: (context) =>
          getIt<ArticleManagerCubit>()
            ..getArticles()
            ..init(),
        ),
        BlocProvider(
          create: (context) =>
          getIt<ArticleSliderWatcherCubit>()
            ..init(),
        ),
        BlocProvider(
          create: (context) =>
          getIt<TopicCubit>()
            ..getFavCategories(),
        ),
        BlocProvider(
          create: (context) =>
          getIt<NotificationManagerCubit>()
            ..initializePushNotifications(),
        ),
        BlocProvider(
            create: (context) =>
            getIt<FavArticleWatcherCubit>()
              ..getFavArticles(),
            lazy: false),
        BlocProvider(
          create: (context) => getIt<FavArticleActorCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        FirebaseMessaging.instance.subscribeToTopic("all");
        FirebaseMessaging.onMessage.listen((_) {
        });
        return MultiBlocListener(
          listeners: [
            BlocListener<ArticleManagerCubit, ArticleManagerState>(
                listenWhen: (p, c) =>
                p.initialArticlesFetched != c.initialArticlesFetched,
                listener: (context, state) {
                  context.read<ArticleSliderWatcherCubit>().getSliderArticles();
                }),
            BlocListener<FavArticleActorCubit, FavArticleActorState>(
              listenWhen: (p, c) {
                return true;
              },
              listener: (context, state) {
                state.map(
                    initial: (_) {},
                    deleteFavArticleSuccess: (state) {
                      context.read<FavArticleWatcherCubit>().getFavArticles();
                    },
                    deleteFavArticleFailure: (state) {
                      //TODO notify user about deleteFavArticleFailure
                    },
                    createFavArticleSuccess: (state) {
                      context.read<FavArticleWatcherCubit>().getFavArticles();
                    },
                    createFavArticleFailure: (state) {
                      //TODO notify user about createFavArticleFailure
                    },
                    loadInProgress: (_) {});
              },
            ),
          ],
          child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor:
                Colors.grey[50]!, // set your desired status bar color here
              ),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: () {
                    return ScaffoldWithBottomNavBar();
                  }())),
        );
      }),
    );
  }
}
