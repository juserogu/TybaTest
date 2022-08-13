class Response {
  Response({
    this.error,
    this.statusCode,
    this.results,
  });

  String? error;
  int? statusCode;
  List<Result>? results;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        error: json["error"],
        statusCode: json["status_code"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "status_code": statusCode,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.apiDetailUrl,
    this.dateAdded,
    this.id,
    this.image,
    this.issueNumber,
    this.name,
  });

  String? apiDetailUrl;
  String? dateAdded;
  int? id;
  Image? image;
  String? issueNumber;
  String? name;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        apiDetailUrl: json['api_detail_url'],
        dateAdded: json["date_added"],
        id: json["id"],
        image: Image.fromJson(json["image"]),
        issueNumber: json["issue_number"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        'api_detail_url': apiDetailUrl,
        "date_added": dateAdded,
        "id": id,
        "image": image?.toJson(),
        "issue_number": issueNumber,
        "name": name == null ? null : name,
      };
}

class Image {
  Image({
    this.originalUrl,
  });

  String? originalUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        originalUrl: json["original_url"],
      );

  Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
      };
}
