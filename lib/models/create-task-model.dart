import 'package:cloud_firestore/cloud_firestore.dart';

class CreateTaskModel{


  String taskName;
  dynamic taskDate;
  dynamic taskStartTime;
  dynamic taskEndTime;
  String taskDescription;
  String taskPriority;
  String taskStatus;
  List<Map<String,dynamic>>comments;
  String taskId;

  CreateTaskModel({
    required this.taskName,
    required this.taskDate,
    required this.taskStartTime,
    required this.taskEndTime,
    required this.taskDescription,
    required this.taskPriority,
    required this.taskStatus,
    required this.comments,
    required this.taskId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreateTaskModel &&
          runtimeType == other.runtimeType &&
          taskName == other.taskName &&
          taskDate == other.taskDate &&
          taskStartTime == other.taskStartTime &&
          taskEndTime == other.taskEndTime &&
          taskDescription == other.taskDescription &&
          taskPriority == other.taskPriority &&
          taskStatus == other.taskStatus &&
          comments == other.comments &&
          taskId == other.taskId);

  @override
  int get hashCode =>
      taskName.hashCode ^
      taskDate.hashCode ^
      taskStartTime.hashCode ^
      taskEndTime.hashCode ^
      taskDescription.hashCode ^
      taskPriority.hashCode ^
      taskStatus.hashCode ^
      comments.hashCode ^
      taskId.hashCode;

  @override
  String toString() {
    return 'CreateTaskModel{' +
        ' taskName: $taskName,' +
        ' taskDate: $taskDate,' +
        ' taskStartTime: $taskStartTime,' +
        ' taskEndTime: $taskEndTime,' +
        ' taskDescription: $taskDescription,' +
        ' taskPriority: $taskPriority,' +
        ' taskStatus: $taskStatus,' +
        ' comments: $comments,' +
        ' taskId: $taskId,' +
        '}';
  }

  CreateTaskModel copyWith({
    String? taskName,
    dynamic? taskDate,
    dynamic? taskStartTime,
    dynamic? taskEndTime,
    String? taskDescription,
    String? taskPriority,
    String? taskStatus,
    List<Map<String, dynamic>>? comments,
    String? taskId,
  }) {
    return CreateTaskModel(
      taskName: taskName ?? this.taskName,
      taskDate: taskDate ?? this.taskDate,
      taskStartTime: taskStartTime ?? this.taskStartTime,
      taskEndTime: taskEndTime ?? this.taskEndTime,
      taskDescription: taskDescription ?? this.taskDescription,
      taskPriority: taskPriority ?? this.taskPriority,
      taskStatus: taskStatus ?? this.taskStatus,
      comments: comments ?? this.comments,
      taskId: taskId ?? this.taskId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'taskName': this.taskName,
      'taskDate': this.taskDate,
      'taskStartTime': this.taskStartTime,
      'taskEndTime': this.taskEndTime,
      'taskDescription': this.taskDescription,
      'taskPriority': this.taskPriority,
      'taskStatus': this.taskStatus,
      'comments': this.comments,
      'taskId': this.taskId,
    };
  }

  factory CreateTaskModel.fromMap(Map<String, dynamic> map) {
    return CreateTaskModel(
      taskName: map['taskName'] as String,
      taskDate: map['taskDate'] as dynamic,
      taskStartTime: map['taskStartTime'] as dynamic,
      taskEndTime: map['taskEndTime'] as dynamic,
      taskDescription: map['taskDescription'] as String,
      taskPriority: map['taskPriority'] as String,
      taskStatus: map['taskStatus'] as String,
      comments: map['comments'] as List<Map<String, dynamic>>,
      taskId: map['taskId'] as String,
    );
  }
  factory CreateTaskModel.fromDoc(DocumentSnapshot map) {
    List<Map<String, dynamic>> parsedComments = [];
    if (map['comments'] != null) {
      var commentsList = map['comments'] as List;
      parsedComments = commentsList.map((comment) {
        Map<String, dynamic> parsedComment = Map<String, dynamic>.from(comment);
        // Convert timestamp to DateTime
        if (parsedComment['date'] is Timestamp) {
          parsedComment['date'] = (parsedComment['date'] as Timestamp).toDate();
        }
        return parsedComment;
      }).toList();
    }
    return CreateTaskModel(
      taskId: map.id,
      taskName: map['taskName'] as String,
      taskDate: (map['taskDate'] is Timestamp ? (map['taskDate'] as Timestamp).toDate() : DateTime.now()),
      taskStartTime: (map['taskStartTime'] is Timestamp ? (map['taskStartTime'] as Timestamp).toDate() : DateTime.now()),
      taskEndTime: (map['taskEndTime'] is Timestamp ? (map['taskEndTime'] as Timestamp).toDate() : DateTime.now()),
      taskDescription: map['taskDescription'] as String,
      taskPriority: map['taskPriority'] as String,
      taskStatus: map['taskStatus'] as String,
      comments: parsedComments,
    );
  }

}
