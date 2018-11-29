package entiy;

public class user {
		int id;
		String name;
		String password;
		public void setId(int id) {
			this.id = id;
		}
		public void setName(String name) {
			this.name = name;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public int getId() {
			return id;
		}
		public String getName() {
			return name;
		}
		public String getPassword() {
			return password;
		}
		@Override
		public String toString() {
		// TODO Auto-generated method stub
		return String.valueOf(id);
		}
}
