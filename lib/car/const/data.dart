//대시보드 데이터
final List<Map<String, dynamic>> carDashBoardData = [
  {
    'carType': 'all',
    'value': 121,
  },
  {
    'carType': 'resident',
    'value': 86,
  },
  {
    'carType': 'visit',
    'value': 29,
  },
  {
    'carType': 'outside',
    'value': 6,
  },
];

//주차 차량 목록 데이터
final List<Map<String, dynamic>> carParkingData = [
  // Resident cars
  {
    'id': 'resident-001',
    'number': '서울 1234',
    'name': '김철수',
    'carType': 'resident',
    'entryTime': DateTime(2025, 2, 18, 8, 30).toIso8601String(),
  },
  {
    'id': 'resident-002',
    'number': '경기 5678',
    'name': '박영희',
    'carType': 'resident',
    'entryTime': DateTime(2025, 2, 18, 9, 15).toIso8601String(),
  },
  {
    'id': 'resident-003',
    'number': '인천 9012',
    'name': '이민호',
    'carType': 'resident',
    'entryTime': DateTime(2025, 2, 18, 7, 45).toIso8601String(),
  },

  // Visit cars
  {
    'id': 'visit-001',
    'number': '서울 5647',
    'name': '방문객1',
    'carType': 'visit',
    'entryTime': DateTime(2025, 2, 18, 10, 30).toIso8601String(),
  },
  {
    'id': 'visit-002',
    'number': '부산 7891',
    'name': '방문객2',
    'carType': 'visit',
    'entryTime': DateTime(2025, 2, 18, 11, 20).toIso8601String(),
  },
  {
    'id': 'visit-003',
    'number': '대구 3456',
    'name': '방문객3',
    'carType': 'visit',
    'entryTime': DateTime(2025, 2, 18, 13, 45).toIso8601String(),
  },

  // Outside cars
  {
    'id': 'outside-001',
    'number': '경기 1122',
    'name': '외부인1',
    'carType': 'outside',
    'entryTime': DateTime(2025, 2, 18, 12, 15).toIso8601String(),
  },
  {
    'id': 'outside-002',
    'number': '광주 3344',
    'name': '외부인2',
    'carType': 'outside',
    'entryTime': DateTime(2025, 2, 18, 14, 30).toIso8601String(),
  },
  {
    'id': 'outside-003',
    'number': '울산 5566',
    'name': '외부인3',
    'carType': 'outside',
    'entryTime': DateTime(2025, 2, 18, 15, 20).toIso8601String(),
  },
];
