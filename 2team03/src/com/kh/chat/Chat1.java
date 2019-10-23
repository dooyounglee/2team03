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

@ServerEndpoint("/broadcasting")
public class Chat1 {

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		System.out.println("broadcasting:"+clients.size());
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) throws IOException {
		// Add session to the connected sessions set
		System.out.println("세션열림"+session+new Date().getTime());
		clients.add(session);
		System.out.println("broadcasting:"+clients.size());
	}

	@OnClose
	public void onClose(Session session) throws IOException {
		// Remove session from the connected sessions set
		System.out.println("세션닫힘"+session+new Date());
		clients.remove(session);
	}
}
