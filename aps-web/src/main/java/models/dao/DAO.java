package models.dao;

import java.util.List;
import java.util.Optional;

public interface DAO<T> {
	
	public List<T> findAll();
	
	public Optional<T> findById(Integer id);
	
	public T save(T obj);
	
	public void deleteById(Integer id);
	
}
