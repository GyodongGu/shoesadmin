package admin.shoes.app.dto;

public class codeDTO {
	private String code_id;
	private String code_type;
	private String code_name;
	private String code_use;
	private String code_explain;
	
	public String getCode_id() {
		return code_id;
	}
	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}
	public String getCode_type() {
		return code_type;
	}
	public void setCode_type(String code_type) {
		this.code_type = code_type;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getCode_use() {
		return code_use;
	}
	public void setCode_use(String code_use) {
		this.code_use = code_use;
	}
	public String getCode_explain() {
		return code_explain;
	}
	public void setCode_explain(String code_explain) {
		this.code_explain = code_explain;
	}
	
	@Override
	public String toString() {
		return "codeDTO [code_id=" + code_id + ", code_type=" + code_type + ", code_name=" + code_name + ", code_use="
				+ code_use + ", code_explain=" + code_explain + "]";
	}
	
	
}
