package metier;



public interface IUser {

	public void addUser(User user);
	public void removeUser(int id);
	public User getUserById(int id);
	public void updateUser(User _user);
	

}
