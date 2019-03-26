import 'dart:convert' show json;

class GanHo {
  bool error;
  List<String> category;
  Result results;

  GanHo.fromParams({this.error, this.category, this.results});

  factory GanHo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new GanHo.fromJson(json.decode(jsonStr))
          : new GanHo.fromJson(jsonStr);

  GanHo.fromJson(jsonRes) {
    error = jsonRes['error'];
    category = jsonRes['category'] == null ? null : [];

    for (var categoryItem in category == null ? [] : jsonRes['category']) {
      category.add(categoryItem);
    }

    results = jsonRes['results'] == null
        ? null
        : new Result.fromJson(jsonRes['results']);
  }

  @override
  String toString() {
    return '{"error": $error,"category": $category,"results": $results}';
  }
}

class Result {
  List<Android> android;
  List<App> app;
  List<IOS> ios;
  List<Rest> rest;
  List<Web> web;
  List<Expand> expand;
  List<Other> other;
  List<Fuli> fuli;

  Result.fromParams(
      {this.android,
      this.app,
      this.ios,
      this.rest,
      this.web,
      this.expand,
      this.other,
      this.fuli});

  Result.fromJson(jsonRes) {
    android = jsonRes['Android'] == null ? null : [];

    for (var androidItem in android == null ? [] : jsonRes['Android']) {
      android
          .add(androidItem == null ? null : new Android.fromJson(androidItem));
    }

    app = jsonRes['App'] == null ? null : [];

    for (var appItem in app == null ? [] : jsonRes['App']) {
      app.add(appItem == null ? null : new App.fromJson(appItem));
    }

    ios = jsonRes['iOS'] == null ? null : [];

    for (var iosItem in ios == null ? [] : jsonRes['iOS']) {
      ios.add(iosItem == null ? null : new IOS.fromJson(iosItem));
    }

    rest = jsonRes['休息视频'] == null ? null : [];

    for (var restItem in rest == null ? [] : jsonRes['休息视频']) {
      rest.add(restItem == null ? null : new Rest.fromJson(restItem));
    }

    web = jsonRes['前端'] == null ? null : [];

    for (var webItem in web == null ? [] : jsonRes['前端']) {
      web.add(webItem == null ? null : new Web.fromJson(webItem));
    }

    expand = jsonRes['拓展资源'] == null ? null : [];

    for (var expandItem in expand == null ? [] : jsonRes['拓展资源']) {
      expand.add(expandItem == null ? null : new Expand.fromJson(expandItem));
    }

    other = jsonRes['瞎推荐'] == null ? null : [];

    for (var otherItem in other == null ? [] : jsonRes['瞎推荐']) {
      other.add(otherItem == null ? null : new Other.fromJson(otherItem));
    }

    fuli = jsonRes['福利'] == null ? null : [];

    for (var fuliItem in fuli == null ? [] : jsonRes['福利']) {
      fuli.add(fuliItem == null ? null : new Fuli.fromJson(fuliItem));
    }
  }

  @override
  String toString() {
    return '{"Android": $android,"App": $app,"iOS": $ios,"休息视频": $rest,"前端": $web,"拓展资源": $expand,"瞎推荐": $other,"福利": $fuli}';
  }
}

class Fuli {
  bool used;
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;

  Fuli.fromParams(
      {this.used,
      this.id,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who});

  Fuli.fromJson(jsonRes) {
    used = jsonRes['used'];
    id = jsonRes['id'];
    createdAt = jsonRes['createdAt'];
    desc = jsonRes['desc'];
    publishedAt = jsonRes['publishedAt'];
    source = jsonRes['source'];
    type = jsonRes['type'];
    url = jsonRes['url'];
    who = jsonRes['who'];
  }

  @override
  String toString() {
    return '{"used": $used,"id": ${id != null ? '${json.encode(id)}' : 'null'},"createdAt": ${createdAt != null ? '${json.encode(createdAt)}' : 'null'},"desc": ${desc != null ? '${json.encode(desc)}' : 'null'},"publishedAt": ${publishedAt != null ? '${json.encode(publishedAt)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"who": ${who != null ? '${json.encode(who)}' : 'null'}}';
  }
}

class Other {
  bool used;
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;

  Other.fromParams(
      {this.used,
      this.id,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who});

  Other.fromJson(jsonRes) {
    used = jsonRes['used'];
    id = jsonRes['id'];
    createdAt = jsonRes['createdAt'];
    desc = jsonRes['desc'];
    publishedAt = jsonRes['publishedAt'];
    source = jsonRes['source'];
    type = jsonRes['type'];
    url = jsonRes['url'];
    who = jsonRes['who'];
  }

  @override
  String toString() {
    return '{"used": $used,"id": ${id != null ? '${json.encode(id)}' : 'null'},"createdAt": ${createdAt != null ? '${json.encode(createdAt)}' : 'null'},"desc": ${desc != null ? '${json.encode(desc)}' : 'null'},"publishedAt": ${publishedAt != null ? '${json.encode(publishedAt)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"who": ${who != null ? '${json.encode(who)}' : 'null'}}';
  }
}

class Expand {
  bool used;
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;

  Expand.fromParams(
      {this.used,
      this.id,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who});

  Expand.fromJson(jsonRes) {
    used = jsonRes['used'];
    id = jsonRes['id'];
    createdAt = jsonRes['createdAt'];
    desc = jsonRes['desc'];
    publishedAt = jsonRes['publishedAt'];
    source = jsonRes['source'];
    type = jsonRes['type'];
    url = jsonRes['url'];
    who = jsonRes['who'];
  }

  @override
  String toString() {
    return '{"used": $used,"id": ${id != null ? '${json.encode(id)}' : 'null'},"createdAt": ${createdAt != null ? '${json.encode(createdAt)}' : 'null'},"desc": ${desc != null ? '${json.encode(desc)}' : 'null'},"publishedAt": ${publishedAt != null ? '${json.encode(publishedAt)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"who": ${who != null ? '${json.encode(who)}' : 'null'}}';
  }
}

class Web {
  bool used;
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;

  Web.fromParams(
      {this.used,
      this.id,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who});

  Web.fromJson(jsonRes) {
    used = jsonRes['used'];
    id = jsonRes['id'];
    createdAt = jsonRes['createdAt'];
    desc = jsonRes['desc'];
    publishedAt = jsonRes['publishedAt'];
    source = jsonRes['source'];
    type = jsonRes['type'];
    url = jsonRes['url'];
    who = jsonRes['who'];
  }

  @override
  String toString() {
    return '{"used": $used,"id": ${id != null ? '${json.encode(id)}' : 'null'},"createdAt": ${createdAt != null ? '${json.encode(createdAt)}' : 'null'},"desc": ${desc != null ? '${json.encode(desc)}' : 'null'},"publishedAt": ${publishedAt != null ? '${json.encode(publishedAt)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"who": ${who != null ? '${json.encode(who)}' : 'null'}}';
  }
}

class Rest {
  bool used;
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;

  Rest.fromParams(
      {this.used,
      this.id,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who});

  Rest.fromJson(jsonRes) {
    used = jsonRes['used'];
    id = jsonRes['id'];
    createdAt = jsonRes['createdAt'];
    desc = jsonRes['desc'];
    publishedAt = jsonRes['publishedAt'];
    source = jsonRes['source'];
    type = jsonRes['type'];
    url = jsonRes['url'];
    who = jsonRes['who'];
  }

  @override
  String toString() {
    return '{"used": $used,"id": ${id != null ? '${json.encode(id)}' : 'null'},"createdAt": ${createdAt != null ? '${json.encode(createdAt)}' : 'null'},"desc": ${desc != null ? '${json.encode(desc)}' : 'null'},"publishedAt": ${publishedAt != null ? '${json.encode(publishedAt)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"who": ${who != null ? '${json.encode(who)}' : 'null'}}';
  }
}

class IOS {
  bool used;
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;
  List<String> images;

  IOS.fromParams(
      {this.used,
      this.id,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who,
      this.images});

  IOS.fromJson(jsonRes) {
    used = jsonRes['used'];
    id = jsonRes['id'];
    createdAt = jsonRes['createdAt'];
    desc = jsonRes['desc'];
    publishedAt = jsonRes['publishedAt'];
    source = jsonRes['source'];
    type = jsonRes['type'];
    url = jsonRes['url'];
    who = jsonRes['who'];
    images = jsonRes['images'] == null ? null : [];

    for (var imagesItem in images == null ? [] : jsonRes['images']) {
      images.add(imagesItem);
    }
  }

  @override
  String toString() {
    return '{"used": $used,"id": ${id != null ? '${json.encode(id)}' : 'null'},"createdAt": ${createdAt != null ? '${json.encode(createdAt)}' : 'null'},"desc": ${desc != null ? '${json.encode(desc)}' : 'null'},"publishedAt": ${publishedAt != null ? '${json.encode(publishedAt)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"who": ${who != null ? '${json.encode(who)}' : 'null'},"images": $images}';
  }
}

class App {
  bool used;
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;

  App.fromParams(
      {this.used,
      this.id,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who});

  App.fromJson(jsonRes) {
    used = jsonRes['used'];
    id = jsonRes['id'];
    createdAt = jsonRes['createdAt'];
    desc = jsonRes['desc'];
    publishedAt = jsonRes['publishedAt'];
    source = jsonRes['source'];
    type = jsonRes['type'];
    url = jsonRes['url'];
    who = jsonRes['who'];
  }

  @override
  String toString() {
    return '{"used": $used,"id": ${id != null ? '${json.encode(id)}' : 'null'},"createdAt": ${createdAt != null ? '${json.encode(createdAt)}' : 'null'},"desc": ${desc != null ? '${json.encode(desc)}' : 'null'},"publishedAt": ${publishedAt != null ? '${json.encode(publishedAt)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"who": ${who != null ? '${json.encode(who)}' : 'null'}}';
  }
}

class Android {
  bool used;
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;

  Android.fromParams(
      {this.used,
      this.id,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who});

  Android.fromJson(jsonRes) {
    used = jsonRes['used'];
    id = jsonRes['id'];
    createdAt = jsonRes['createdAt'];
    desc = jsonRes['desc'];
    publishedAt = jsonRes['publishedAt'];
    source = jsonRes['source'];
    type = jsonRes['type'];
    url = jsonRes['url'];
    who = jsonRes['who'];
  }

  @override
  String toString() {
    return '{"used": $used,"id": ${id != null ? '${json.encode(id)}' : 'null'},"createdAt": ${createdAt != null ? '${json.encode(createdAt)}' : 'null'},"desc": ${desc != null ? '${json.encode(desc)}' : 'null'},"publishedAt": ${publishedAt != null ? '${json.encode(publishedAt)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"who": ${who != null ? '${json.encode(who)}' : 'null'}}';
  }
}
