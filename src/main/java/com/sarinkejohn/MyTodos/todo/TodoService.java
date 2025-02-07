package com.sarinkejohn.MyTodos.todo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

import org.springframework.stereotype.Service;

import jakarta.validation.Valid;

@Service
public class TodoService {
	private static List<Todo> todos = new ArrayList<>();
	private static int todoCount = 0;
	static {
		todos.add(new Todo(++todoCount, "sarinke", "Learn new skill", LocalDate.now().plusYears(1), false));
		todos.add(new Todo(++todoCount, "munny", "Learn new recipe", LocalDate.now().plusYears(2), false));
		todos.add(new Todo(++todoCount, "farhia", "Learn new std 4 book", LocalDate.now().plusYears(8), false));
		todos.add(new Todo(++todoCount, "rukaiya", "Watch new cartoon", LocalDate.now().plusYears(4), false));
	}

	public List<Todo> findByUsername(String username) {
		return todos;
	};

	public void addTodo(String username, String description, LocalDate targetDate, boolean done) {

		Todo todo = new Todo(++todoCount, username, description, targetDate, done);
		todos.add(todo);

	}

	public void deleteById(int id) {

		Predicate<? super Todo> predicate = todo -> todo.getId() == id;
		todos.removeIf(predicate);

	}

	public Todo findById(int id) {
		Predicate<? super Todo> predicate = todo -> todo.getId() == id;
		Todo todo = todos.stream().filter(predicate).findFirst().get();
		return todo;

	}

	public void updateTodo(@Valid Todo todo) {
		deleteById(todo.getId());
		todos.add(todo);
		
	}

	
}
