// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 0;

  @override
  Article read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Article(
      section: fields[0] as String,
      subsection: fields[1] as String,
      title: fields[2] as String,
      resultAbstract: fields[3] as String,
      url: fields[4] as String,
      uri: fields[5] as String,
      byline: fields[6] as String,
      updatedDate: fields[8] as DateTime,
      createdDate: fields[9] as DateTime,
      publishedDate: fields[10] as DateTime,
      materialTypeFacet: fields[11] as String,
      kicker: fields[12] as String,
      desFacet: (fields[13] as List).cast<String>(),
      orgFacet: (fields[14] as List).cast<String>(),
      perFacet: (fields[15] as List).cast<String>(),
      geoFacet: (fields[16] as List).cast<String>(),
      multimedia: (fields[17] as List).cast<Multimedia>(),
      shortUrl: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.section)
      ..writeByte(1)
      ..write(obj.subsection)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.resultAbstract)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.uri)
      ..writeByte(6)
      ..write(obj.byline)
      ..writeByte(8)
      ..write(obj.updatedDate)
      ..writeByte(9)
      ..write(obj.createdDate)
      ..writeByte(10)
      ..write(obj.publishedDate)
      ..writeByte(11)
      ..write(obj.materialTypeFacet)
      ..writeByte(12)
      ..write(obj.kicker)
      ..writeByte(13)
      ..write(obj.desFacet)
      ..writeByte(14)
      ..write(obj.orgFacet)
      ..writeByte(15)
      ..write(obj.perFacet)
      ..writeByte(16)
      ..write(obj.geoFacet)
      ..writeByte(17)
      ..write(obj.multimedia)
      ..writeByte(7)
      ..write(obj.shortUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MultimediaAdapter extends TypeAdapter<Multimedia> {
  @override
  final int typeId = 1;

  @override
  Multimedia read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Multimedia(
      url: fields[0] as String,
      height: fields[2] as int,
      width: fields[3] as int,
      caption: fields[4] as String,
      copyright: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Multimedia obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.width)
      ..writeByte(4)
      ..write(obj.caption)
      ..writeByte(5)
      ..write(obj.copyright);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultimediaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
