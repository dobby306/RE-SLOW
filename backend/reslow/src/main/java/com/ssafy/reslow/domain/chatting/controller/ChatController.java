package com.ssafy.reslow.domain.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.reslow.domain.chatting.dto.ChatRoomList;
import com.ssafy.reslow.domain.chatting.entity.ChatMessage;
import com.ssafy.reslow.domain.chatting.repository.ChatMessageRepository;
import com.ssafy.reslow.domain.chatting.service.ChatService;
import com.ssafy.reslow.domain.member.repository.MemberRepository;
import com.ssafy.reslow.domain.member.service.MemberService;
import com.ssafy.reslow.global.common.FCM.FirebaseCloudMessageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {
	private final MemberRepository memberRepository;
	private final ChatMessageRepository chatMessageRepository;
	private final ChatService chatService;
	private final MemberService memberService;
	private final FirebaseCloudMessageService firebaseCloudMessageService;

	// 채팅방 생성 - 토픽 생성, roomId 저장
	@PostMapping("/{roomId}")
	public Map<String, String> createChatRoom(@PathVariable String roomId, @RequestBody Map<String, Long> userList) {
		// roomId 저장
		chatService.createChattingRoom(roomId, userList);

		HashMap<String, String> map = new HashMap<>();
		map.put("room", roomId);
		return map;
	}

	// 채팅방 입장 = web socket에 들어왔을 때
	@PostMapping("/enter/{roomId}")
	public Map<String, String> enterChatRoom(@PathVariable String roomId, Authentication authentication) {
		Long memberNo = Long.parseLong(authentication.getName());
		// subscribe
		chatService.enterChattingRoom(roomId, memberNo);

		HashMap<String, String> map = new HashMap<>();
		map.put("enter", "ok");
		return map;
	}

	// 채팅방 나감 = web socket에서 나옴
	@PostMapping("/quit/{roomId}")
	public Map<String, String> quitChatRoom(@PathVariable String roomId, Authentication authentication) {
		Long memberNo = Long.parseLong(authentication.getName());
		// quit room
		chatService.quitChattingRoom(roomId, memberNo);

		HashMap<String, String> map = new HashMap<>();
		map.put("quit", "ok");
		return map;
	}

	// 채팅방 목록확인
	@GetMapping("/roomList")
	public List<ChatRoomList> chatRoomList(Authentication authentication) {
		Long memberNo = Long.parseLong(authentication.getName());
		return chatService.giveChatRoomList(chatService.findRoom(memberNo), memberNo);
	}

	// 채팅방 내용확인
	@GetMapping("/detail/{roomId}")
	public Slice<ChatMessage> chatRoomDetail(Authentication authentication, @PathVariable String roomId,
		Pageable pageable) {
		Long memberNo = Long.parseLong(authentication.getName());
		return chatService.showChatDetail(memberNo, roomId, pageable);
	}

	@PostMapping("/addChatTest")
	public void aa(@RequestBody ChatMessage message) {
		ChatMessage room = ChatMessage.of(message.getRoomId(), message.getUser(), message.getContent(),
			message.getDateTime());
		chatMessageRepository.save(room);
	}

	// 채팅방 삭제
	@DeleteMapping("/{roomId}")
	public Map<String, String> deleteTopic(@PathVariable String roomId, Authentication authentication) {
		Long memberNo = Long.parseLong(authentication.getName());
		chatService.leaveChattingRoom(roomId, memberNo);

		HashMap<String, String> map = new HashMap<>();
		map.put("roomId", roomId);
		return map;
	}

	// FCM 토큰 등록
	@PostMapping("/fcm/token")
	public Map<String, String> registerUserToken(
		@RequestBody Map<String, String> token,
		Authentication authentication) {
		Long memberNo = Long.parseLong(authentication.getName());
		return memberService.addDeviceToken(memberNo, token.get("preToken"), token.get("newToken"));
	}

	// FCM 토큰 삭제
	@DeleteMapping("/fcm/token")
	public Map<String, String> deleterUserToken(
		@RequestBody Map<String, String> token,
		Authentication authentication) {
		Long memberNo = Long.parseLong(authentication.getName());
		return memberService.deleteDeviceToken(memberNo, token.get("token"));
	}

	// 존재하는 채팅방인지 확인
	@GetMapping("/check/{roomId}")
	public Map<String, Boolean> checkRoomId(@PathVariable String roomId) {
		return chatService.checkRoomId(roomId);
	}
}
