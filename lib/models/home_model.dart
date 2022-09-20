class HomeModel {
  int? id;
  String? date;
  String? dateGmt;
  // Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  // Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  int? parent;
  int? menuOrder;
  String? commentStatus;
  String? pingStatus;
  String? template;
  // Meta? meta;
  List<dynamic>? acf;
  List<dynamic>? aioseoNotices;
  String? lang;
  // Translations? translations;
  List<dynamic>? pllSyncPost;
  // Links? lLinks;

  HomeModel({
    this.id,
    this.date,
    this.dateGmt,
    // this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    // this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.parent,
    this.menuOrder,
    this.commentStatus,
    this.pingStatus,
    this.template,
    // this.meta,
    this.acf,
    this.aioseoNotices,
    this.lang,
    // this.translations,
    this.pllSyncPost,
    // this.lLinks
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    // guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    // title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    excerpt =
        json['excerpt'] != null ? new Content.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    parent = json['parent'];
    menuOrder = json['menu_order'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    template = json['template'];
    // meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    // if (json['acf'] != null) {
    //   acf = <Null>[];
    //   json['acf'].forEach((v) {
    //     acf!.add( .fromJson(v));
    //   });
    // }
    // if (json['aioseo_notices'] != null) {
    //   aioseoNotices = <Null>[];
    //   json['aioseo_notices'].forEach((v) {
    //     aioseoNotices!.add(new Null.fromJson(v));
    //   });
    // }
    // lang = json['lang'];
    // translations = json['translations'] != null
    // ? new Translations.fromJson(json['translations'])
    //     : null;
    // if (json['pll_sync_post'] != null) {
    //   pllSyncPost = <Null>[];
    //   json['pll_sync_post'].forEach((v) {
    //     pllSyncPost!.add(new Null.fromJson(v));
    //   });
    // }
    // lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }
}

// class Guid {
//   String? rendered;

//   Guid({this.rendered});

//   Guid.fromJson(Map<String, dynamic> json) {
//     rendered = json['rendered'];
//   }

// }

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }
}

// class Meta {
//   bool? bMiSkipTracking;

//   Meta({this.bMiSkipTracking});

//   Meta.fromJson(Map<String, dynamic> json) {
//     bMiSkipTracking = json['_mi_skip_tracking'];
//   }

//   }

// class Translations {
//   int? ar;
//   int? en;

//   Translations({this.ar, this.en});

//   Translations.fromJson(Map<String, dynamic> json) {
//     ar = json['ar'];
//     en = json['en'];
//   }

// }

// class Links {
//   List<Self>? self;
//   List<Collection>? collection;
//   List<About>? about;
//   List<Author>? author;
//   List<Replies>? replies;
//   List<VersionHistory>? versionHistory;
//   List<PredecessorVersion>? predecessorVersion;
//   List<WpAttachment>? wpAttachment;
//   List<Curies>? curies;

//   Links(
//       {this.self,
//       this.collection,
//       this.about,
//       this.author,
//       this.replies,
//       this.versionHistory,
//       this.predecessorVersion,
//       this.wpAttachment,
//       this.curies});

//   Links.fromJson(Map<String, dynamic> json) {
//     if (json['self'] != null) {
//       self = <Self>[];
//       json['self'].forEach((v) {
//         self!.add(new Self.fromJson(v));
//       });
//     }
//     if (json['collection'] != null) {
//       collection = <Collection>[];
//       json['collection'].forEach((v) {
//         collection!.add(new Collection.fromJson(v));
//       });
//     }
//     if (json['about'] != null) {
//       about = <About>[];
//       json['about'].forEach((v) {
//         about!.add(new About.fromJson(v));
//       });
//     }
//     if (json['author'] != null) {
//       author = <Author>[];
//       json['author'].forEach((v) {
//         author!.add(new Author.fromJson(v));
//       });
//     }
//     if (json['replies'] != null) {
//       replies = <Replies>[];
//       json['replies'].forEach((v) {
//         replies!.add(new Replies.fromJson(v));
//       });
//     }
//     if (json['version-history'] != null) {
//       versionHistory = <VersionHistory>[];
//       json['version-history'].forEach((v) {
//         versionHistory!.add(new VersionHistory.fromJson(v));
//       });
//     }
//     if (json['predecessor-version'] != null) {
//       predecessorVersion = <PredecessorVersion>[];
//       json['predecessor-version'].forEach((v) {
//         predecessorVersion!.add(new PredecessorVersion.fromJson(v));
//       });
//     }
//     if (json['wp:attachment'] != null) {
//       wpAttachment = <WpAttachment>[];
//       json['wp:attachment'].forEach((v) {
//         wpAttachment!.add(new WpAttachment.fromJson(v));
//       });
//     }
//     if (json['curies'] != null) {
//       curies = <Curies>[];
//       json['curies'].forEach((v) {
//         curies!.add(new Curies.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.self != null) {
//       data['self'] = this.self!.map((v) => v.toJson()).toList();
//     }
//     if (this.collection != null) {
//       data['collection'] = this.collection!.map((v) => v.toJson()).toList();
//     }
//     if (this.about != null) {
//       data['about'] = this.about!.map((v) => v.toJson()).toList();
//     }
//     if (this.author != null) {
//       data['author'] = this.author!.map((v) => v.toJson()).toList();
//     }
//     if (this.replies != null) {
//       data['replies'] = this.replies!.map((v) => v.toJson()).toList();
//     }
//     if (this.versionHistory != null) {
//       data['version-history'] =
//           this.versionHistory!.map((v) => v.toJson()).toList();
//     }
//     if (this.predecessorVersion != null) {
//       data['predecessor-version'] =
//           this.predecessorVersion!.map((v) => v.toJson()).toList();
//     }
//     if (this.wpAttachment != null) {
//       data['wp:attachment'] =
//           this.wpAttachment!.map((v) => v.toJson()).toList();
//     }
//     if (this.curies != null) {
//       data['curies'] = this.curies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Self {
//   String? href;

//   Self({this.href});

//   Self.fromJson(Map<String, dynamic> json) {
//     href = json['href'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['href'] = this.href;
//     return data;
//   }
// }

// class Author {
//   bool? embeddable;
//   String? href;

//   Author({this.embeddable, this.href});

//   Author.fromJson(Map<String, dynamic> json) {
//     embeddable = json['embeddable'];
//     href = json['href'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['embeddable'] = this.embeddable;
//     data['href'] = this.href;
//     return data;
//   }
// }

// class VersionHistory {
//   int? count;
//   String? href;

//   VersionHistory({this.count, this.href});

//   VersionHistory.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     href = json['href'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     data['href'] = this.href;
//     return data;
//   }
// }

// class PredecessorVersion {
//   int? id;
//   String? href;

//   PredecessorVersion({this.id, this.href});

//   PredecessorVersion.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     href = json['href'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['href'] = this.href;
//     return data;
//   }
// }

// class Curies {

//   String? name;
//   String? href;
//   bool? templated;

//   Curies({this.name, this.href, this.templated});

//   Curies.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     href = json['href'];
//     templated = json['templated'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['href'] = this.href;
//     data['templated'] = this.templated;
//     return data;
//   }
// }