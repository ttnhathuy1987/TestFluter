
class UserInfoModel {
  String idUser = '';
  String userName = '';
  String fullName = '';
  String employeeCode = '';
  DateTime joinDay = DateTime.now();
  String position = '';
  String projectName = '';
  String projectManager = '';

  //Info leave day
  double leaveDay = 0.0;
  double leaveDaySent = 0.0;

  static UserInfoModel createUserFake() {
    UserInfoModel item = UserInfoModel();
    item.idUser = '123';
    item.userName = 'team.ado.s3@gmail.com';
    item.fullName = 'Team ADO S3 Segregation';
    item.employeeCode = '231446456';
    item.joinDay = DateTime.now().subtract(Duration(days: -200));
    item.position = 'Developer';
    item.projectManager = 'ADO';
    item.projectManager = 'Hanh Nguyen';

    return item;
  }
}