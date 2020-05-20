class User {
  // String login;
  // int id;
  String url;
  String reposUrl;

  User({
    // this.login,
    // this.id,
    this.url,
    this.reposUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    // login = json['login'];
    // id = json['id'];
    url = json['url'];
    reposUrl = json['repos_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['login'] = this.login;
    // data['id'] = this.id;
    data['url'] = this.url;
    data['repos_url'] = this.reposUrl;
    return data;
  }
}
