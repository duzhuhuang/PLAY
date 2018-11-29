package servers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.DAO;
import dao.entiy;

@Service
public class SeachServers {
@Autowired
DAO D;
	public List<entiy> search(String word)
	{
		List<entiy>rs=null;
		try{
		rs= D.prior(word);
		rs.addAll(D.match(word));
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}
}
