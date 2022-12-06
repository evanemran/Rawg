class StoreResponse {
  int? id;
  String? name;
  String? domain;
  String? slug;
  int? gamesCount;
  String? imageBackground;
  List<Games>? games;

  StoreResponse(
      {this.id,
        this.name,
        this.domain,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.games});

  StoreResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    domain = json['domain'];
    slug = json['slug'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
    if (json['games'] != null) {
      games = <Games>[];
      json['games'].forEach((v) {
        games!.add(new Games.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['domain'] = this.domain;
    data['slug'] = this.slug;
    data['games_count'] = this.gamesCount;
    data['image_background'] = this.imageBackground;
    if (this.games != null) {
      data['games'] = this.games!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Games {
  int? id;
  String? slug;
  String? name;
  int? added;

  Games({this.id, this.slug, this.name, this.added});

  Games.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    added = json['added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['added'] = this.added;
    return data;
  }
}
