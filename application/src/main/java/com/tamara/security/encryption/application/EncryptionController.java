package com.tamara.security.encryption.application;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tamara.security.encryption.application.stringData.NS;

@Controller
public class EncryptionController {
	
	@RequestMapping( value = "/" , method = RequestMethod.GET)
	public String welcome(Map<String, Object> model) {
		model.put("message", NS.message);
		model.put("send", NS.send);
		model.put("title", NS.title);
		model.put("exchange", NS.exchange);
		model.put("encryptionType", NS.encryptionType);
		return "welcome";
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String products(@RequestParam String encryptionType,@RequestParam String message, Map<String, Object> model) {
		model.put("plaintext", NS.plaintext);
		model.put("cipher", NS.cipher);
		model.put("message", message);
		model.put("title", NS.title);
		if(Integer.parseInt(encryptionType) == 0) {
			model.put("encryptionType", NS.noEncryption);
			model.put("encryptedMessage", message);
		}
		else if(Integer.parseInt(encryptionType) == 1) {
			model.put("encryptionType", NS.caesar);
			model.put("encryptedMessage", caesarEncryption(message));
		}
		else if(Integer.parseInt(encryptionType) == 2) {
			model.put("encryptionType", NS.railFence1);
			model.put("encryptedMessage", railForceDiagonalEncryption(message));
		}
		else {
			model.put("encryptionType", NS.railFence2);
			model.put("encryptedMessage", railForceMatrixEncryption(generateRandomKey(),message));
		}
		return "encryption";
	}
	
	@RequestMapping(value = "/generatePdf", method = RequestMethod.POST)
	public String generatePdf( @RequestParam Map<String,String> allRequestParams,  Map<String, Object> model) {
		return "pdfInfo";
	}
	
	
	public String caesarEncryption(String message) {
		char[] messageArray = message.toLowerCase().toCharArray();
        String ceasarResult ="";
        for(int i = 0;i < messageArray.length; i++) {
        	if(Character.isAlphabetic(messageArray[i])) {
        		char c;
        		if((int)(messageArray[i])+3 > 122) 
        			c = (char) (97 + ((int)(messageArray[i])+3-123));
        		else
        			c = (char) ((int)(messageArray[i])+3);
        		ceasarResult += c;
        	}else {
        		ceasarResult += messageArray[i];
        	}
        }
		return ceasarResult.toUpperCase();
	}
	
	public String railForceDiagonalEncryption(String message) {
			char[] messageArray = message.toLowerCase().toCharArray();
			int rowNumber=3;
	        String railFenceresult = "";
	        int characterPerRown = messageArray.length / rowNumber;
	        int extraCharactersPerRow = messageArray.length % rowNumber;
	        for(int i = 0;i < rowNumber; i++) {
	        	for(int j = 0;j < characterPerRown; j++) {
	        		railFenceresult += messageArray[j*rowNumber + i];
	        	}
	        	if(extraCharactersPerRow > 0) {
	        		extraCharactersPerRow--;
	        		railFenceresult += messageArray[characterPerRown*rowNumber + i ];
	        	}
	        }
	        return railFenceresult.toUpperCase() ;
	}
	 static String railForceMatrixEncryption(ArrayList<Integer> key, String message) {
	    	String result = "";
	    	char[] plaintext = message.toLowerCase().toCharArray();
	    	int rowNumber = plaintext.length / key.size();
	    	char[][] messageMatrix = new char [rowNumber][key.size()];; 
	    	if(plaintext.length % key.size() != 0) { 
	    		messageMatrix = new char [rowNumber+1][key.size()];
	    		rowNumber ++;
	    	}
	    	for(int i = 0;i< rowNumber;i++) {
	    		for(int j=0;j<key.size();j++) {
	    			if((i*key.size())+j < plaintext.length)
	    				messageMatrix[i][j]= plaintext[(i*key.size())+j];
	    			else
	    				messageMatrix[i][j]= '~';
	    		}
	    	}
	    	for(int i=0;i<key.size();i++) {
	    		int column=9;
	    		int columnIndex=-1;
	    		for(int j=0;j<key.size();j++) {
	    			if( key.get(j) < column ) {
	    				column = key.get(j);
	    				columnIndex = j;
	    			}
	    		}
	    		if(columnIndex != -1) {
	    			key.set(columnIndex, 9);
	    			for(int k=0;k<messageMatrix.length;k++) {
	    				if(messageMatrix[k][columnIndex] != '~')
	    					result += messageMatrix[k][columnIndex];
	    			}
	    		}
	    	}
	    	return result;
	    }
	 
	public ArrayList<Integer> generateRandomKey() {
		int keyLength = (int )(Math.random() * 8 + 1);
		ArrayList<Integer> key = new ArrayList<Integer>(keyLength);
		for(int i=0;i<keyLength;i++) {
			key.add(i+1);
		}
		Collections.shuffle(key);
		return key;
	}
}
