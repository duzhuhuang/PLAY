package function;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.SQLDao;
import dao.userDao;
import entiy.company;

@Service
public class companyFunction {
@Autowired
SQLDao dao;

public company login(String name) {
	
	return dao.selectcompany(name);
}

public int check(String name) {
	return dao.checkName(name);
	
}
@Transactional
public void addcompany(company p) {
	dao.add(p);
}
@Transactional
public void updateComp(company p) {
	dao.update(p);
}


}
