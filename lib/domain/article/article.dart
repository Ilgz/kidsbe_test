// To parse this JSON data, do
//
//     final docModel = docModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';


part 'article.g.dart';

ArticleCollection articleCollectionModelFromJson(String str) =>
    ArticleCollection.fromJson(json.decode(str));

String articleCollectionToJson(ArticleCollection data) =>
    json.encode(data.toJson());

class ArticleCollection {
  final String status;
  final String copyright;
  final String section;
  final DateTime lastUpdated;
  final int numResults;
  final List<Article> results;

  ArticleCollection({
    required this.status,
    required this.copyright,
    required this.section,
    required this.lastUpdated,
    required this.numResults,
    required this.results,
  });

  factory ArticleCollection.fromJson(Map<String, dynamic> json) =>
      ArticleCollection(
        status: json["status"],
        copyright: json["copyright"],
        section: json["section"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        numResults: json["num_results"],
        results:
            List<Article>.from(json["results"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "section": section,
        "last_updated": lastUpdated.toIso8601String(),
        "num_results": numResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
@HiveType(typeId: 2)
class ArticleList{
  @HiveField(0)
  final List<Article> articleList;
  ArticleList(this.articleList);
}
@HiveType(typeId: 0)
class Article {
  @HiveField(0)
  final String section;
  @HiveField(1)
  final String subsection;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String resultAbstract;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final String uri;
  @HiveField(6)
  final String byline;
  @HiveField(8)
  final DateTime updatedDate;
  @HiveField(9)
  final DateTime createdDate;
  @HiveField(10)
  final DateTime publishedDate;
  @HiveField(11)
  final String materialTypeFacet;
  @HiveField(12)
  final String kicker;
  @HiveField(13)
  final List<String> desFacet;
  @HiveField(14)
  final List<String> orgFacet;
  @HiveField(15)
  final List<String> perFacet;
  @HiveField(16)
  final List<String> geoFacet;
  @HiveField(17)
  final List<Multimedia> multimedia;
  final bool isFavorite;
  @HiveField(7)
  final String shortUrl;

  Article({
    required this.section,
    required this.subsection,
    required this.title,
    required this.resultAbstract,
    required this.url,
    required this.uri,
    required this.byline,
    required this.updatedDate,
    required this.createdDate,
    required this.publishedDate,
    required this.materialTypeFacet,
    required this.kicker,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.multimedia,
    required this.shortUrl,
    this.isFavorite = false,
  });

  Article copyWith({
    String? section,
    String? subsection,
    String? title,
    String? resultAbstract,
    String? url,
    String? uri,
    String? byline,
    DateTime? updatedDate,
    DateTime? createdDate,
    DateTime? publishedDate,
    String? materialTypeFacet,
    String? kicker,
    List<String>? desFacet,
    List<String>? orgFacet,
    List<String>? perFacet,
    List<String>? geoFacet,
    List<Multimedia>? multimedia,
    String? shortUrl,
    bool? isFavorite,
  }) {
    return Article(
      section: section ?? this.section,
      subsection: subsection ?? this.subsection,
      title: title ?? this.title,
      resultAbstract: resultAbstract ?? this.resultAbstract,
      url: url ?? this.url,
      uri: uri ?? this.uri,
      byline: byline ?? this.byline,
      updatedDate: updatedDate ?? this.updatedDate,
      createdDate: createdDate ?? this.createdDate,
      publishedDate: publishedDate ?? this.publishedDate,
      materialTypeFacet: materialTypeFacet ?? this.materialTypeFacet,
      kicker: kicker ?? this.kicker,
      desFacet: desFacet ?? this.desFacet,
      orgFacet: orgFacet ?? this.orgFacet,
      perFacet: perFacet ?? this.perFacet,
      geoFacet: geoFacet ?? this.geoFacet,
      multimedia: multimedia ?? this.multimedia,
      shortUrl: shortUrl ?? this.shortUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        section: json["section"],
        subsection: json["subsection"],
        title: json["title"],
        resultAbstract: json["abstract"],
        url: json["url"],
        uri: json["uri"],
        byline: json["byline"],
        updatedDate: DateTime.parse(json["updated_date"]),
        createdDate: DateTime.parse(json["created_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        materialTypeFacet: json["material_type_facet"],
        kicker: json["kicker"],
        desFacet: List<String>.from(json["des_facet"].map((x) => x)),
        orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
        perFacet: List<String>.from(json["per_facet"].map((x) => x)),
        geoFacet: List<String>.from(json["geo_facet"].map((x) => x)),
        multimedia: json["multimedia"] != null
            ? List<Multimedia>.from(
                json["multimedia"].map((x) => Multimedia.fromJson(x)))
            : [],
        shortUrl: json["short_url"],
      );

  Map<String, dynamic> toJson() => {
        "section": section,
        "subsection": subsection,
        "title": title,
        "abstract": resultAbstract,
        "url": url,
        "uri": uri,
        "byline": byline,
        "updated_date": updatedDate.toIso8601String(),
        "created_date": createdDate.toIso8601String(),
        "published_date": publishedDate.toIso8601String(),
        "material_type_facet": materialTypeFacet,
        "kicker": kicker,
        "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
        "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
        "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
        "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
        "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
        "short_url": shortUrl,
      };
}

@HiveType(typeId: 1)
class Multimedia {
  @HiveField(0)
  final String url;
  @HiveField(2)
  final int height;
  @HiveField(3)
  final int width;
  @HiveField(4)
  final String caption;
  @HiveField(5)
  final String copyright;

  Multimedia({
    required this.url,
    required this.height,
    required this.width,
    required this.caption,
    required this.copyright,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        url: json["url"],
        height: json["height"],
        width: json["width"],
        caption: json["caption"],
        copyright: json["copyright"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "height": height,
        "width": width,
        "caption": caption,
        "copyright": copyright,
      };
}

enum Format { SUPER_JUMBO, THREE_BY_TWO_SMALL_AT2_X, LARGE_THUMBNAIL }

final formatValues = EnumValues({
  "Large Thumbnail": Format.LARGE_THUMBNAIL,
  "Super Jumbo": Format.SUPER_JUMBO,
  "threeByTwoSmallAt2X": Format.THREE_BY_TWO_SMALL_AT2_X
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
