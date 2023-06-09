package com.ssafy.reslow.infra.storage;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface StorageService {
	String uploadFile(MultipartFile file) throws IOException;

	void deleteFile(String fileUrl) throws IOException;

}
