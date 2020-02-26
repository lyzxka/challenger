import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// author: zzxka
/// date: 2020/2/27
/// description:  文件操作
class FileUtils{
  Future<File> _getLocalFile(String fileName) async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/$fileName');
  }

  // 读取文件信息
  Future<String> readFile(String fileName) async {
    try {
      File file = await _getLocalFile(fileName);
      // 读取文件字符串
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return null;
    }
  }
  //数据写入文件中
  Future<Null> writeFile(String fileName, dynamic contents) async {
    String data=contents.toString();
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile(fileName)).writeAsString('$data');
  }

}
