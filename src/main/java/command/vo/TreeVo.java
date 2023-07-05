package command.vo;

public class TreeVo extends CommonVo{
	private int id;
	private int parent;
	private String text;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "TreeVo [id=" + id + ", parent=" + parent + ", text=" + text + "]";
	}

}
