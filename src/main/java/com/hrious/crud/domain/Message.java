package com.hrious.crud.domain;

import java.util.HashMap;
import java.util.Map;

public class Message {

	// 100 操作成功, 200 操作失败
	private Integer code;
	private String hint;
	private Map<String, Object> extend = new HashMap<String, Object>();
	
	public Message add(String key, Object value) {
		this.extend.put(key, value);
		return this;
	}
	
	public static Message success() {
		return new Message(100, "操作成功", new HashMap<String, Object>());
	}
	
	public static Message fail() {
		return new Message(200, "操作失败", new HashMap<String, Object>());
	}
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Message(Integer code, String hint, Map<String, Object> extend) {
		super();
		this.code = code;
		this.hint = hint;
		this.extend = extend;
	}

	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getHint() {
		return hint;
	}
	public void setHint(String hint) {
		this.hint = hint;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
}
