import 'package:workouthelper/models/model.dart';

class FullModel extends Model{
  String imagePath;
  String theme;
  String themeText;
  String duration;

  FullModel({
    required this.theme,
    required this.themeText,
    required this.imagePath,
    required this.duration
}) : super(theme: theme, themeText: themeText, imagePath: imagePath, duration: duration);
  static List<FullModel> getFull(){
    List <FullModel> list=[];
    list.add(FullModel(theme: 'Morning Yoga', themeText: 'Improve mental focus.', imagePath: 'assets/images/yoga.png', duration: '7'));
    list.add(FullModel(theme: 'Plank Exercise', themeText: 'Improve posture and \n stability.', imagePath: 'assets/images/plank.png', duration: '3'));
    list.add(FullModel(theme: 'Push-ups', themeText: 'Start your day with power', imagePath: 'assets/images/push.png', duration: '5'));
    return list;
  }
}