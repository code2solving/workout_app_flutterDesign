import 'package:workouthelper/models/model.dart';

class UpperModel extends Model{
  String imagePath;
  String theme;
  String themeText;
  String duration;

  UpperModel({
    required this.theme,
    required this.themeText,
    required this.imagePath,
    required this.duration
  }) : super(theme: theme, themeText: themeText, imagePath: imagePath, duration: duration);
  static List<UpperModel> getUpper(){
    List <UpperModel> list=[];
    list.add(UpperModel(theme: 'Incline Bench', themeText: 'Grow your chest immediately', imagePath: 'assets/images/bench.png', duration: '2'));
    list.add(UpperModel(theme: 'Lateral Raises', themeText: 'This ensure your back growth', imagePath: 'assets/images/raise.png', duration: '5'));
    list.add(UpperModel(theme: 'Cable Raises', themeText: 'Upper chest is also important', imagePath: 'assets/images/cable.png', duration: '4'));
    return list;
  }
}