class task {
  String content;
  DateTime timestamp;
  bool done;

  task({
    required this.content,
    required this.timestamp,
    required this.done,
  });

  factory task.frommap(Map Task) {
    return task(
      content: Task["content"],
      timestamp: Task["timestamp"],
      done: Task["done"],
    );
  }
  Map toMap() {
    return {
      "content": content,
      "timestamp": timestamp,
      "done": done,
    };
  }
}
