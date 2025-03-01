# Spring Boot CRUD Operations

## 📌 Introduction
CRUD (Create, Read, Update, Delete) operations are essential for building RESTful APIs and database-driven applications. This guide covers the **best practices** and **professional implementation** of CRUD operations using **Spring Boot**.

---

## 📂 Project Structure
src/ ├── main/ │ ├── java/com/example/ │ │ ├── controller/ # REST Controllers │ │ ├── entity/ # JPA Entities │ │ ├── repository/ # Data Access Layer │ │ ├── service/ # Business Logic Layer │ │ ├── exception/ # Custom Exception Handling ├── resources/ │ ├── application.properties # Database Configurations ├── test/ # Unit and Integration Tests

---

## 🚀 CRUD Operations

### **1️⃣ Entity Layer (Model)**
Defines the database table structure using JPA.
```java
import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(unique = true, nullable = false)
    private String email;

    // Getters and Setters
}
2️⃣ Repository Layer (Data Access)
Handles database interactions using JpaRepository.


import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}

3️⃣ Service Layer (Business Logic)
Encapsulates business logic and interacts with the repository layer.


import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));
    }

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public User updateUser(Long id, User updatedUser) {
        User existingUser = getUserById(id);
        existingUser.setName(updatedUser.getName());
        existingUser.setEmail(updatedUser.getEmail());
        return userRepository.save(existingUser);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}

4️⃣ Controller Layer (REST API)
Exposes CRUD endpoints.


import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/{id}")
    public User getUserById(@PathVariable Long id) {
        return userService.getUserById(id);
    }

    @PostMapping
    public User createUser(@RequestBody User user) {
        return userService.createUser(user);
    }

    @PutMapping("/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User user) {
        return userService.updateUser(id, user);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
    }
}

✅ Best Practices
📍 1. Data Validation
Use Jakarta Validation API to enforce field constraints.


import jakarta.validation.constraints.*;

public class UserDTO {
    @NotNull
    private String name;

    @Email
    @NotNull
    private String email;

    // Getters and Setters
}

📍 2. Exception Handling
Centralized exception handling using @ControllerAdvice.


import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<String> handleException(RuntimeException ex) {
        return new ResponseEntity<>(ex.getMessage(), HttpStatus.BAD_REQUEST);
    }
}
📍 3. Pagination and Sorting
Enhance API efficiency with Pageable.


import org.springframework.data.domain.*;

@GetMapping("/users/paginated")
public Page<User> getUsersPaginated(@RequestParam int page, @RequestParam int size) {
    return userRepository.findAll(PageRequest.of(page, size, Sort.by("name")));
}
📍 4. Security (JWT & OAuth)
Secure API endpoints with Spring Security & JWT.


@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
            .anyRequest().authenticated()
            .and().httpBasic();
    }
}
🧪 CRUD Testing (Unit & Integration)
Write JUnit tests for API reliability.


import static org.assertj.core.api.Assertions.assertThat;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UserServiceTest {
    @Test
    void contextLoads() {
        assertThat(true).isTrue();
    }
}

✅ Summary Checklist
✔ Entity Layer - JPA annotations (@Entity, @Table, @Id).
✔ Repository Layer - Extend JpaRepository for built-in CRUD methods.
✔ Service Layer - Implement business logic (@Service).
✔ Controller Layer - Expose REST APIs (@RestController).
✔ Validation - Use @Valid, @NotNull, @Email.
✔ Exception Handling - Implement global error handling (@ControllerAdvice).
✔ Pagination & Sorting - Use Pageable for efficient data retrieval.
✔ Security - Protect endpoints with Spring Security & JWT.
✔ Logging & Monitoring - Use SLF4J, Prometheus & Grafana.
✔ Testing - Write JUnit & Integration tests.
✔ Deployment - Use Docker & CI/CD pipelines.
