package project.sungho.chat;
//package project.sungho.chat;
//
//import java.util.Date;
//import java.util.Map;
//import java.util.concurrent.ConcurrentHashMap;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.socket.CloseStatus;
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//import com.google.gson.Gson;
//
//import project.hm.hmp001_d001.service.Hmp001_d001Service;
//import project.jeongha.member.vo.MemberVO;
//import project.sungho.chat.VO.ChatroomVO;
//import project.sungho.chat.VO.MessageVO;
//
//public class ChatWebSocketHandler extends TextWebSocketHandler {
//	
//	@Autowired
//	MemberVO memberVO;
//	
//	@Autowired
//	MessageVO messageVO;
//	
//	@Autowired
//	ChatroomVO chatroomVO;
//
//	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
//
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		log(session.getId() + " 연결 됨");
//		
//		users.put(session.getId(), session);		
//	}
//
//	@Override
//	public void afterConnectionClosed(
//			WebSocketSession session, CloseStatus status) throws Exception {
//		log(session.getId() + " 연결 종료됨");
//		users.remove(session.getId());
//	}
//
//	@Override
//	protected void handleTextMessage(
//			WebSocketSession session, TextMessage message) throws Exception {
//		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
//		
//		Map<String, Object> map = null;
//		
//
//	      MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
//
//	      System.out.println("1 : " + messageVO.toString());
//
//
//	      ChatroomVO roomVO  = new ChatroomVO();
//	      roomVO.setChat_Id((messageVO.getChat_Id())); //채팅아이디
//	      roomVO.setTUTOR_USER_user_id(messageVO.()); //튜터
//	      roomVO.setMem_Id(messageVO.getMem_Id()); //유저
//
//	      ChatroomVO croom =null;
//	      if(!messageVO.getUSER_user_id().equals(messageVO.getTUTOR_USER_user_id())) {
//	    	  System.out.println("a");
//
//
//
//	    	  if(dao.isRoom(roomVO) == null ) {
//	    		  System.out.println("b");
//	    		  dao.createRoom(roomVO);
//	    		  System.out.println("d");
//	    		  croom = dao.isRoom(roomVO);
//
//	    	  }else {
//	    		  System.out.println("C");
//	    		  croom = dao.isRoom(roomVO);
//	    	  }
//	      }else {
//
//  		  croom = dao.isRoom(roomVO);
//  	  }
//
//	      messageVO.setCHATROOM_chatroom_id(croom.getChatroom_id());
//	      if(croom.getUSER_user_id().equals(messageVO.getMessage_sender())) {
//
//	    	  messageVO.setMessage_receiver(roomVO.getTUTOR_USER_user_id());
//	      }else {
//	    	  messageVO.setMessage_receiver(roomVO.getUSER_user_id());
//	      }
//
//
//
//
//	      for (WebSocketSession websocketSession : connectedUsers) {
//	         map = websocketSession.getAttributes();
//	         memberVO login = (memberVO) map.get("login");
//
//	         //받는사람
//	         if (login.getUser_id().equals(messageVO.getMessage_sender())) {
//
//	            Gson gson = new Gson();
//	            String msgJson = gson.toJson(messageVO);
//	            websocketSession.sendMessage(new TextMessage(msgJson));
//	         }
//
//
//	      }
//	   }
//
//	@Override
//	public void handleTransportError(
//			WebSocketSession session, Throwable exception) throws Exception {
//		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
//	}
//
//	private void log(String logmsg) {
//		System.out.println(new Date() + " : " + logmsg);
//	}
//
//}
