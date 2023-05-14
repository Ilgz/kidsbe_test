import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times_wire/application/article/article_manager/article_manager_cubit.dart';
import 'package:times_wire/domain/article/article_categories.dart';

class ArticleCategorySelector extends StatelessWidget {
  const ArticleCategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleManagerCubit, ArticleManagerState>(
      builder: (context, state) {
        return SizedBox(
          height: 32,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: ArticleCategoryEnum.values.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = ArticleCategoryEnum.values[index];
                return GestureDetector(
                    onTap: () {
                      if (category != state.category) {
                        context
                            .read<ArticleManagerCubit>()
                            .categoryChanged(category);
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                            vertical: 2, horizontal: 20),
                        decoration: BoxDecoration(
                            color: category == state.category
                                ? Color(0xff485ad6)
                                : Color(0xfff3f4f6),
                            borderRadius:
                            BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            category.description[0].toUpperCase() +
                                category.description.substring(1),
                            style: TextStyle(
                                fontSize: 12,
                                color: category == state.category
                                    ? Colors.white
                                    : Color(0xff8b90ac)),
                          ),
                        )));
              }),
        );
      },
    );
  }
}
