// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i4;
import 'package:http/http.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:times_wire/application/article/article_manager/article_manager_cubit.dart'
    as _i17;
import 'package:times_wire/application/article/article_searcher/article_searcher_cubit.dart'
    as _i3;
import 'package:times_wire/application/article/article_slider_watcher/article_slider_watcher_cubit.dart'
    as _i18;
import 'package:times_wire/application/article/fav_article_actor/fav_article_actor_cubit.dart'
    as _i15;
import 'package:times_wire/application/article/fav_article_watcher/fav_article_watcher_cubit.dart'
    as _i16;
import 'package:times_wire/application/notification/notification_manager_cubit.dart'
    as _i13;
import 'package:times_wire/application/topic/topic_cubit.dart' as _i14;
import 'package:times_wire/domain/article/article.dart' as _i5;
import 'package:times_wire/domain/article/i_article_repository.dart' as _i9;
import 'package:times_wire/domain/notification/i_notification_facade.dart'
    as _i11;
import 'package:times_wire/infrastructure/article/article_repository.dart'
    as _i10;
import 'package:times_wire/infrastructure/core/app_injectable_module.dart'
    as _i19;
import 'package:times_wire/infrastructure/notification/notification_facade.dart'
    as _i12;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appInjectableProdModule = _$AppInjectableProdModule();
    gh.factory<_i3.ArticleSearcherCubit>(() => _i3.ArticleSearcherCubit());
    await gh.factoryAsync<_i4.Box<List<_i5.Article>>>(
      () => appInjectableProdModule.cachedArticleBox,
      instanceName: 'cachedArticleBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i4.Box<_i5.Article>>(
      () => appInjectableProdModule.favArticleBox,
      instanceName: 'favArticleUidBox',
      preResolve: true,
    );
    gh.lazySingleton<_i6.Client>(() => appInjectableProdModule.httpClient);
    gh.lazySingleton<_i7.FirebaseMessaging>(
        () => appInjectableProdModule.firebaseMessaging);
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => appInjectableProdModule.sharedPreference,
      preResolve: true,
    );
    gh.lazySingleton<_i9.IArticleRepository>(() => _i10.ArticleRepository(
          gh<_i4.Box<_i5.Article>>(instanceName: 'favArticleUidBox'),
          gh<_i4.Box<List<_i5.Article>>>(instanceName: 'cachedArticleBox'),
          gh<_i8.SharedPreferences>(),
          gh<_i7.FirebaseMessaging>(),
        ));
    gh.lazySingleton<_i11.INotificationFacade>(
        () => _i12.NotificationFacade(gh<_i8.SharedPreferences>()));
    gh.factory<_i13.NotificationManagerCubit>(
        () => _i13.NotificationManagerCubit(gh<_i11.INotificationFacade>()));
    gh.factory<_i14.TopicCubit>(
        () => _i14.TopicCubit(gh<_i9.IArticleRepository>()));
    gh.singleton<_i15.FavArticleActorCubit>(
        _i15.FavArticleActorCubit(gh<_i9.IArticleRepository>()));
    gh.singleton<_i16.FavArticleWatcherCubit>(
        _i16.FavArticleWatcherCubit(gh<_i9.IArticleRepository>()));
    gh.factory<_i17.ArticleManagerCubit>(() => _i17.ArticleManagerCubit(
          gh<_i9.IArticleRepository>(),
          gh<_i16.FavArticleWatcherCubit>(),
        ));
    gh.factory<_i18.ArticleSliderWatcherCubit>(
        () => _i18.ArticleSliderWatcherCubit(
              gh<_i9.IArticleRepository>(),
              gh<_i16.FavArticleWatcherCubit>(),
            ));
    return this;
  }
}

class _$AppInjectableProdModule extends _i19.AppInjectableProdModule {}
