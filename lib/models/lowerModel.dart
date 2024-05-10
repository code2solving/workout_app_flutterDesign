import 'package:workouthelper/models/model.dart';

class LowerModel extends Model{
  String imagePath;
  String theme;
  String themeText;
  String duration;

  LowerModel({
    required this.theme,
    required this.themeText,
    required this.imagePath,
    required this.duration,
  }) : super(theme: theme, themeText: themeText, imagePath: imagePath, duration: duration);


  static List<LowerModel> getLower(){
    List <LowerModel> list=[];
    list.add(LowerModel(theme: 'Squat', themeText: 'Grow your chicken legs', imagePath: 'assets/images/squat.png', duration: '2'));
    list.add(LowerModel(theme: 'Press Squat', themeText: 'Add the weight for \n your squat', imagePath: 'assets/images/pressSquat.png', duration: '5'));
    list.add(LowerModel(theme: 'Leaning', themeText: 'Get flexible lower body', imagePath: 'assets/images/leaning.png', duration: '4'));
    return list;
  }
}