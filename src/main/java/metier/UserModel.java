package metier;

import java.util.ArrayList;
import java.util.List;

public class UserModel {
	List<User>  list  = new ArrayList<>();
	private int ID;

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	
	public void clearListById(int id) {
		list.remove(id-1);
	}
	
	public void clearList() {
		list.removeAll(list);
	}
	
	public int getID() {
		return ID;
	}

	public  void setID(int iD) {
		ID = iD;
	}

}
