class UserResponse {
  String? msg;
  int? usersCount;
  List<Users>? data;

  UserResponse({this.msg, this.usersCount, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    usersCount = json['users_count'];
    if (json['data'] != null) {
      data = <Users>[];
      json['data'].forEach((v) {
        data!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['users_count'] = this.usersCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? email;
  String? image;
  int? followers;
  int? likes;
  int? following;
  String? bio;
  String? createdAt;
  String? updatedAt;
  List<Tips>? tips;
  List<Recipes>? recipes;
  List<Categories>? categories;

  Users(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.followers,
      this.likes,
      this.following,
      this.bio,
      this.createdAt,
      this.updatedAt,
      this.tips,
      this.recipes,
      this.categories});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    followers = json['followers'];
    likes = json['likes'];
    following = json['following'];
    bio = json['bio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tips'] != null) {
      tips = <Tips>[];
      json['tips'].forEach((v) {
        tips!.add(new Tips.fromJson(v));
      });
    }
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(new Recipes.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['followers'] = this.followers;
    data['likes'] = this.likes;
    data['following'] = this.following;
    data['bio'] = this.bio;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.tips != null) {
      data['tips'] = this.tips!.map((v) => v.toJson()).toList();
    }
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tips {
  int? id;
  String? tips;
  int? userId;
  int? recipesId;
  String? createdAt;
  String? updatedAt;

  Tips(
      {this.id,
      this.tips,
      this.userId,
      this.recipesId,
      this.createdAt,
      this.updatedAt});

  Tips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tips = json['tips'];
    userId = json['user_id'];
    recipesId = json['recipes_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tips'] = this.tips;
    data['user_id'] = this.userId;
    data['recipes_id'] = this.recipesId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Recipes {
  int? id;
  String? name;
  String? description;
  String? image;
  String? totalTime;
  String? prepTime;
  String? cookTime;
  String? ingredients;
  String? nutrition;
  String? steps;
  int? categoryId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Recipes(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.totalTime,
      this.prepTime,
      this.cookTime,
      this.ingredients,
      this.nutrition,
      this.steps,
      this.categoryId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    totalTime = json['total_time'];
    prepTime = json['prep_time'];
    cookTime = json['cook_time'];
    ingredients = json['ingredients'];
    nutrition = json['nutrition'];
    steps = json['steps'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['total_time'] = this.totalTime;
    data['prep_time'] = this.prepTime;
    data['cook_time'] = this.cookTime;
    data['ingredients'] = this.ingredients;
    data['nutrition'] = this.nutrition;
    data['steps'] = this.steps;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? userId;
  List<Recipes>? recipes;

  Categories(
      {this.id,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.recipes});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(new Recipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
