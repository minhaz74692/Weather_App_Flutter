import 'dart:io';

void main(){
  performTask();
}

void performTask() async{
  task1();
  String task2Result =await task2();
  task3(task2Result);
}
void task1(){
  print("Complete task 1");
}
Future<String> task2() async {
  String result="";
  Duration threeSecond = const Duration(seconds: 3);
  // sleep(threeSecond);
  await Future.delayed(threeSecond,() {
    print("Complete task 2");
    result = "Task 2 Data";
  });
  return result;
}
void task3(task2Data){
    print("Complete task 3 : $task2Data");
}