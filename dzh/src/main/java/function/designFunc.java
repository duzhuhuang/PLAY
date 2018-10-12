package function;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.pdao;
import entiy.picture;

@Service
public class designFunc {
@Autowired
pdao P;
public void addpic(int did,picture p) {
	if(P.check(did)<5)
	  P.addPicture(p);
	
}
public void delete(int pid) {
	P.delete(pid);
}

}
