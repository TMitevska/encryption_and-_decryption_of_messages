package com.tamara.security.encryption.application.stringData;

import org.springframework.stereotype.Controller;


@Controller
public class NS {
	
		public static final String encryptionType = "Тип на енкрипција:";
		public static final String message = "Порака: ";	
		public static final String cipher = "Шифрирана порака: ";	
		public static final String plaintext = "Обична порака: ";
		public static final String send = "Испрати порака ";
		public static final String title = "Енкрипција и декрипција на пораки ";
		public static final String exchange = "Размена на пораки помеѓу два корисника ";
		
		
		public static final String noEncryption = "Без енкрипција и декрипција на порака ";
		public static final String caesar = "Цезар енкрипција на порака";
		public static final String railFence1 = "Rail Fence енкрипција на порака по дијагонала";
		public static final String railFence2 = "Rail Fence енкрипција на порака со матрица ";
		
}