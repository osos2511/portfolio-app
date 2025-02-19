import 'dart:convert';
import 'package:info_tech/core/constants/end_points.dart';
import 'package:info_tech/core/constants/result.dart';
import 'package:info_tech/data/model/projects/ProjectsResponse.dart';
import 'package:http/http.dart' as http;
import '../model/projects/Project.dart';

class ApiManager {
  static Future<Result<ProjectsResponse>> getAllProjects() async {
    try {
      final url = Uri.http(EndPoints.host, EndPoints.projects);
      print('Request URL: $url');

      final http.Response response = await http.get(url);
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        ProjectsResponse projectsResponse = ProjectsResponse.fromJson(jsonData);
        print('Parsed ProjectsResponse successfully.');
        return Success(data: projectsResponse);
      } else {
        print('Server Error: ${jsonData['message'] ?? 'Server Error'}');
        return ServerError(
          message: jsonData['message'] ?? 'Server Error',
          code: response.statusCode.toString(),
        );
      }
    } catch (e) {
      print('Exception caught: $e');
      return Error(exception: Exception(e));
    }
  }

  static Future<Result<Project>> getProjectDetails(num? id) async {
    try {
      final url = Uri.http(EndPoints.host, '/api/projects/$id');
      print('Request URL: $url');

      final http.Response response = await http.get(url);
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Project project = Project.fromJson(jsonData);
        print('Parsed Project successfully.');
        return Success(data: project);
      } else {
        print('Server Error: ${jsonData['message'] ?? 'Server Error'}');
        return ServerError(
          message: jsonData['message'] ?? 'Server Error',
          code: response.statusCode.toString(),
        );
      }
    } catch (e) {
      print('Exception caught: $e');
      return Error(exception: Exception(e));
    }
  }

}
