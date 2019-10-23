package com.kh.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat/{room_no}")
public class Chat {

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session, @PathParam("room_no") int room_no) throws IOException {
		System.out.println(message);
		System.out.println("chat:"+clients.size());
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			
			for (Session client : clients) {
				if (!client.equals(session)/* && (int)(client.getUserProperties().get("room_no"))==room_no*/) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session, @PathParam("room_no") int room_no) throws IOException {
		// Add session to the connected sessions set
		session.getUserProperties().put("room_no", room_no);
		
		//세션에서 불러온 닉네임 담고
		
		System.out.println("세션열림"+session+new Date().getTime());
		clients.add(session);
		//onMessage("입장", session, room_no);
		System.out.println("chat:"+clients.size());
	}

	@OnClose
	public void onClose(Session session, @PathParam("room_no") int room_no) throws IOException {
		// Remove session from the connected sessions set
		System.out.println("세션닫힘"+session+new Date());
		clients.remove(session);
		onMessage("{\"text\":\"딴사람이 퇴장했어요.\",\"nick\":\"\"}", session, room_no);//jsp에선 호출이 안돼서 어쩔수없이 여기서.
	}
}
