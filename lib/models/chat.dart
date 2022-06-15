class Chat {
  String? chatid;
  String? participants;

  Chat({this.chatid, this.participants});

  Chat.fromMap(Map<String, dynamic> map) {
    chatid = map['chatid'];
    participants = map['participants'];
  }

  Map<String, dynamic> toMap() {
    return{
      'chatid' : chatid,
      'participants' : participants,
         };
      }
   }