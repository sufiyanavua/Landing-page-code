import 'dart:convert';
import 'dart:developer';

import 'package:avua/core/strings.dart';
import 'package:avua/domain/blog_list_model/blog_list_model.dart';
import 'package:avua/domain/blog_model/blog_model.dart';
import 'package:http/http.dart' as http;

class BlogListServices {
  static Future<BlogListModel?> listAllBlogs(
      {required int pageNo, required int blogLength}) async {
    String path = Urls.baseUrl +
        Urls.listBlogPageNo +
        pageNo.toString() +
        Urls.listBlogPageBlogLength +
        blogLength.toString();
    var url = Uri.parse(path);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        log(response.body.toString());
        BlogListModel blogModel =
            BlogListModel.fromJson(jsonDecode(response.body));

        // log(blogModel.data!.blog!.length.toString(), name: "blog data length");
        // log(blogModel.data!.metadata!.currentPage.toString(),
        //     name: "meta data length");

        return blogModel;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<BlogModel?> getBlogById({required String id}) async {
    String path = Urls.baseUrl + Urls.viewBlogById + id;
    Uri url = Uri.parse(path);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        log(response.body);
        BlogModel blogModel = BlogModel.fromJson(jsonDecode(response.body));
        return blogModel;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
