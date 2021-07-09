class LeaveDayInfoMain {
  String idLeaveRequest = '';
  String idUser = '';
  String userName = '';
  String reason = '';

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  double leaveTime = 0;


  LeaveDayInfoMain createRequestLeaveDay(String username, String reason, DateTime startD, DateTime endD, double timeLeave) {
    var itemLeave = LeaveDayInfoMain();
    itemLeave.reason = reason;
    itemLeave.startDate = startD;
    itemLeave.endDate = endD;
    itemLeave.leaveTime = timeLeave;
    return itemLeave;
  }
}
