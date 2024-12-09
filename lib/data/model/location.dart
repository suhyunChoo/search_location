// <title>도이치증권</title>
//             <link></link>
//             <category>금융,보험&gt;투자기관</category>
//             <description></description>
//             <telephone></telephone>
//             <address>서울특별시 종로구 공평동 17 센트로폴리스 A동 12층</address>
//             <roadAddress>서울특별시 종로구 우정국로 26 센트로폴리스 A동 11층</roadAddress>
//             <mapx>1269835457</mapx>
//             <mapy>375714716</mapy>

class Location {
  String title;
  String link;
  String category;
  String? description;
  String? telephone;
  String address;
  String roadAddress;
  String mapx;
  String mapy;
  bool favorite;

  Location({
    required this.address,
    required this.category,
    required this.description,
    required this.mapx,
    required this.mapy,
    required this.roadAddress,
    required this.telephone,
    required this.title,
    required this.link,
    required this.favorite,
  });

  Location.fromJson(Map<String, dynamic> map)
      : this(
        address: map['address'],
        category: map['category'],
        description: map['description'],
        mapx: map['mapx'],
        mapy: map['mapy'],
        roadAddress: map['roadAddress'],
        telephone: map['telephone'],
        title: map['title'],
        link: map['link'],
        favorite: map['favorite']??false,
        );
  Map<String, dynamic> toJson() => {
    'title': title,
    'telephone':telephone,
    'roadAddress':roadAddress,
    'mapx':mapx,
    'mapy':mapy,
    'description':description,
    'category':category,
    'address':address,
    'link':link,
    'favorite':favorite,
  };
  Location copyWith({
    String? title,
    String? link,
    String? category,
    String? description,
    String? telephone,
    String? address,
    String? roadAddress,
    String? mapx,
    String? mapy,
    bool? favorite,
  }) {
    return Location(
      title: title ?? this.title,
      link: link ?? this.link,
      category: category ?? this.category,
      description: description ?? this.description,
      telephone: telephone ?? this.telephone,
      address: address ?? this.address,
      roadAddress: roadAddress ?? this.roadAddress,
      mapx: mapx ?? this.mapx,
      mapy: mapy ?? this.mapy,
      favorite: favorite ?? this.favorite,
    );
  }
}