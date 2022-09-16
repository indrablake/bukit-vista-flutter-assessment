class GuestModel {
  late final String id;
  late final String avatar;
  late final String name;
  late final String email;
  late final String phone;
  late final String origin;
  late final String joindate;
  late List<Booking> booking;

  GuestModel(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.email,
      required this.phone,
      required this.origin,
      required this.joindate,
      required this.booking});

  GuestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    origin = json['origin'];
    joindate = json['joindate'];
    if (json['booking'] != null) {
      booking = <Booking>[];
      json['booking'].forEach((v) {
        booking.add(Booking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['avatar'] = avatar;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['origin'] = origin;
    data['joindate'] = joindate;
    data['booking'] = booking.map((v) => v.toJson()).toList();
    return data;
  }
}

class Booking {
  late final String bookingId;
  late final String bookingName;
  late final String bookingStartDate;
  late final String bookingEndDate;
  late final String bookingStatus;

  Booking(
      {required this.bookingId,
      required this.bookingName,
      required this.bookingStartDate,
      required this.bookingEndDate,
      required this.bookingStatus});

  Booking.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingName = json['booking_name'];
    bookingStartDate = json['booking_start_date'];
    bookingEndDate = json['booking_end_date'];
    bookingStatus = json['booking_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booking_id'] = bookingId;
    data['booking_name'] = bookingName;
    data['booking_start_date'] = bookingStartDate;
    data['booking_end_date'] = bookingEndDate;
    data['booking_status'] = bookingStatus;
    return data;
  }
}
