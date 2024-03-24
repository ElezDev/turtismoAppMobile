// To parse this JSON data, do
//
//     final perfilUser = perfilUserFromJson(jsonString);

import 'dart:convert';

PerfilUser perfilUserFromJson(String str) => PerfilUser.fromJson(json.decode(str));

String perfilUserToJson(PerfilUser data) => json.encode(data.toJson());

class PerfilUser {
    User? user;
    List<String>? roles;

    PerfilUser({
        this.user,
        this.roles,
    });

    factory PerfilUser.fromJson(Map<String, dynamic> json) => PerfilUser(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
    };
}

class User {
    int? id;
    String? name;
    String? email;
    dynamic emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Role>? roles;

    User({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.roles,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        roles: json["roles"] == null ? [] : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
    };
}

class Role {
    int? id;
    String? name;
    String? guardName;
    DateTime? createdAt;
    DateTime? updatedAt;
    Pivot? pivot;

    Role({
        this.id,
        this.name,
        this.guardName,
        this.createdAt,
        this.updatedAt,
        this.pivot,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
    };
}

class Pivot {
    String? modelType;
    int? modelId;
    int? roleId;

    Pivot({
        this.modelType,
        this.modelId,
        this.roleId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelType: json["model_type"],
        modelId: json["model_id"],
        roleId: json["role_id"],
    );

    Map<String, dynamic> toJson() => {
        "model_type": modelType,
        "model_id": modelId,
        "role_id": roleId,
    };
}
