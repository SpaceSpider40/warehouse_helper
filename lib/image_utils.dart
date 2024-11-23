import 'package:image_input/image_input.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageUtils{
  static final String _imagesFolder = "${getApplicationDocumentsDirectory()}/images";

  static String getSavePath(XFile file)=>"$_imagesFolder/${basename(file.path)}";
  static Future<void> saveFile(XFile file) async => file.saveTo("$_imagesFolder/${basename(file.path)}");
}