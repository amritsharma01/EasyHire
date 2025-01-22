import 'dart:convert';
import 'package:easyhire_app/features/jobseekerapp/data/model/job_model.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/entity/job_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../abstractservices/storage_services.dart';
import '../../../../../core/services/get.dart';

import '../../../../core/services/storage_services/hive_keys.dart';

class BookmarkNotifier extends ChangeNotifier {
  BookmarkNotifier(this._storageServices);
  final StorageServices _storageServices;

  List<Map<String, dynamic>> jobJsonList = [];
  List<JobEntity> jobList = [];

  Future<BookmarkNotifier> init() async {
    final storedJson = await _storageServices.get(StorageKeys.bookmarks);
    if (storedJson != null) {
      for (var i in jsonDecode(storedJson)) {
        jobJsonList.add(i);
        jobList.add(JobModel.fromJson(i));
      }
    }
    return this;
  }

  _add(JobEntity job) async {
    jobList.add(job);
    jobJsonList.add((job as JobModel).toJson());
    _storageServices.set(StorageKeys.bookmarks, jsonEncode(jobJsonList));
    Get.snackbar("Bookmarked", color: Colors.teal);
    notifyListeners();
  }

  _remove(JobEntity job) async {
    jobList.removeWhere((element) => element.id == job.id);
    jobJsonList.removeWhere((element) => element['id'] == job.id);
    _storageServices.set(StorageKeys.bookmarks, jsonEncode(jobJsonList));
    Get.snackbar("Bookmark removed");
    notifyListeners();
  }

  update(JobEntity job, bool isBookMarked) {
    if (!isBookMarked) {
      _add(job);
      return;
    }
    _remove(job);
  }
}
