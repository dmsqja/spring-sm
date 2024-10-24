package edu.sm.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import ch.qos.logback.classic.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
    public static void saveFile(MultipartFile mf, String dir, String filename) {
        try {
            byte[] data = mf.getBytes();
            Path path = Paths.get(dir + "/" + filename);
            Files.write(path, data);
        } catch(Exception e) {
            Logger log = null;
            log.error("파일 저장 실패: " + e.getMessage());
            throw new RuntimeException("파일 저장 중 오류 발생");
        }
    }
}
