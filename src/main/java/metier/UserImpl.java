package metier;

import java.util.ArrayList;
import java.util.List;

public class UserImpl implements IUser {
	
	List<User> list = new ArrayList<>();
	
	@Override
	public void addUser(User user ) {
		list.add(user);
	}

	public List<User> getList() {
		return list;
	}
	
	
	
	public void setList(List<User> list) {
		this.list = list;
	}
	

	@Override
	public void removeUser(int id) {
		list.remove(id-1);
	}
	
	
	
	@Override
	public User getUserById(int id) {
		for(User user : list) {
			if(user.getId() == id) {
				return user;
			}
		}
		return null;
	}
	
	
	
	
	public void updateUser(User _user) {
	    for (int i = 0; i < list.size(); i++) {
	        User user = list.get(i);
	        if (user.getId() == _user.getId()) {
	            list.set(i, _user);
	            break; // Once updated, no need to continue searching
	        }
	    }
	}
	
	

}
