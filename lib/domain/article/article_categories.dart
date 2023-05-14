enum ArticleCategoryEnum {
    home,arts, automobiles, books, business, fashion, food, health,  insider, magazine, movies, nyregion, obituaries, opinion, politics, realestate, science, sports, sundayreview, technology, theater, travel, upshot, us, world
}

extension MyEnumDescription on ArticleCategoryEnum {
  String get description {
    if(name=="t_magazine"){
      return "t-magazine";
    }else if(name=="home"){
      return "random";
    }
    else{
      return name;
    }
  }
}