import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times_wire/application/topic/topic_cubit.dart';
import 'package:times_wire/domain/article/article_categories.dart';
import 'package:times_wire/presentation/core/widgets/custom_scaffold.dart';

class TopicOverviewPage extends StatelessWidget {
  const TopicOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrolling: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select your favorite topics",
              style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 22,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 8,
          ),
          Text(
              "Select some of your favorite topics to let us suggest better news for you",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  topicCard(ArticleCategoryEnum.values[1]),
                  topicCard(ArticleCategoryEnum.values[2]),
                  topicCard(ArticleCategoryEnum.values[3]),
                  topicCard(ArticleCategoryEnum.values[4]),
                  topicCard(ArticleCategoryEnum.values[5]),
                  topicCard(ArticleCategoryEnum.values[6]),
                  topicCard(ArticleCategoryEnum.values[7]),
                  topicCard(ArticleCategoryEnum.values[8]),
                  topicCard(ArticleCategoryEnum.values[9]),
                  topicCard(ArticleCategoryEnum.values[10]),
                  topicCard(ArticleCategoryEnum.values[11]),
                  topicCard(ArticleCategoryEnum.values[12]),
                ],
              )),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  topicCard(ArticleCategoryEnum.values[13]),
                  topicCard(ArticleCategoryEnum.values[14]),
                  topicCard(ArticleCategoryEnum.values[15]),
                  topicCard(ArticleCategoryEnum.values[16]),
                  topicCard(ArticleCategoryEnum.values[17]),
                  topicCard(ArticleCategoryEnum.values[18]),
                  topicCard(ArticleCategoryEnum.values[19]),
                  topicCard(ArticleCategoryEnum.values[20]),
                  topicCard(ArticleCategoryEnum.values[21]),
                  topicCard(ArticleCategoryEnum.values[22]),
                  topicCard(ArticleCategoryEnum.values[23]),
                  topicCard(ArticleCategoryEnum.values[24]),
                ],
              )),
            ],
          )
        ],
      ),
    );
  }

  Widget topicCard(ArticleCategoryEnum categoryEnum) {
    return BlocBuilder<TopicCubit, TopicState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (state.favoriteCategories.contains(categoryEnum.name)) {
              context.read<TopicCubit>().deleteFavCategory(categoryEnum);
            } else {
              context.read<TopicCubit>().createFavCategory(categoryEnum);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
                decoration: BoxDecoration(
                    color: state.favoriteCategories.contains(categoryEnum.name)
                        ? Color(0xff485ad6)
                        : Color(0xfff3f4f6),
                    borderRadius: BorderRadius.circular(12)),
                width: double.infinity,
                height: 80,
                child: Center(
                  child: Text(
                      categoryEnum.description[0].toUpperCase() +
                          categoryEnum.description.substring(1),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: state.favoriteCategories
                                  .contains(categoryEnum.name)
                              ? Colors.white
                              : Color(0xff8b90ac))),
                )),
          ),
        );
      },
    );
  }
}
