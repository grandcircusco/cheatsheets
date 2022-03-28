This is a full API producer, implementing full CRUD.



### Model: AvCharacter.java

```java
package co.grandcircus.AvengersApi;

import java.util.List;

import org.springframework.data.annotation.*;
import org.springframework.data.mongodb.core.mapping.Document;

@Document("characters")
public class AvCharacter {
	@Id
	public String id;
	
	private String name;
	private Integer strength;
	private Boolean good;
	private List<String> skills;
	
	public AvCharacter() {}
	
	public AvCharacter(String name, Integer strength, Boolean good, List<String> skills) {
		this.name = name;
		this.strength = strength;
		this.good = good;
		this.skills = skills;
	}
	
	// Getters and Setters
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getStrength() {
		return this.strength;
	}
	
	public void setStrength(Integer strength) {
		this.strength = strength;
	}
	
	public Boolean getGood() {
		return good;
	}
	
	public void setGood(Boolean good) {
		this.good = good;
	}
	
	public List<String> getSkills() {
		return skills;
	}

	public void setSkills(List<String> skills) {
		this.skills = skills;
	}

}
```

### Repository: CharacterRepository.java

```java
package co.grandcircus.AvengersApi;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface CharacterRepository extends MongoRepository<AvCharacter, String> {
	List<AvCharacter> findBySkills(String skill);
}
```

### Controller: CharacterController.java

```java
package co.grandcircus.AvengersApi;

import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;

@RestController
public class CharacterController {
	@Autowired
	private CharacterRepository ch_repo;
	
	
	@GetMapping("/reset")
	public String reset() {
		
		// Delete all
		ch_repo.deleteAll();
		
		// Add characters
		
		AvCharacter ac = new AvCharacter("Iron Man",8,true, Arrays.asList("flying", "fighting", "intelligence"));
		ch_repo.insert(ac);
		
		ac = new AvCharacter("Thor",9,true, Arrays.asList("fighting", "strength"));
		ch_repo.insert(ac);
		
		ac = new AvCharacter("Hulk",10,true, Arrays.asList("fighting", "strength", "jumping"));
		ch_repo.insert(ac);
		
		ac = new AvCharacter("Black Panther",8, true, Arrays.asList("stealth", "intelligence", "fighting"));
		ch_repo.insert(ac);

		ac = new AvCharacter("Dr. Strange",7,true, Arrays.asList("magic", "intelligence"));
		ch_repo.insert(ac);
		
		ac = new AvCharacter("Thanos",9,false, Arrays.asList("strength", "intelligence"));
		ch_repo.insert(ac);
		
		return "Data reset.";

	}
	
	// C(R)UD -- Read All
	
	@GetMapping("/character")
	public List<AvCharacter> readAll(@RequestParam(required=false) String skill) {
		if (skill != null) {
			return ch_repo.findBySkills(skill);
		}
		else {
			return ch_repo.findAll();
		}
	}
	
	// C(R)UD -- Read One
	
	@GetMapping("/character/{id}")
	public AvCharacter readOne(@PathVariable("id") String id) {
		return ch_repo.findById(id).orElseThrow(() -> new CharacterNotFoundException(id) );
	}
	
	// (C)RUD -- Create
	@PostMapping("/character")
	@ResponseStatus(HttpStatus.CREATED)
	public AvCharacter create(@RequestBody AvCharacter avchar) {
		ch_repo.insert(avchar);
		return avchar;
	}
	
	// CRU(D) -- Delete
	@DeleteMapping("/character/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void delete(@PathVariable("id") String id) {
		ch_repo.deleteById(id);
	}
	
	// CR(U)D -- Update
	@PutMapping("/character")
	public AvCharacter update(@RequestBody AvCharacter avchar) {
		return ch_repo.save(avchar);
	}
	
	@ResponseBody
	@ExceptionHandler(CharacterNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	String characterNotFoundHandler(CharacterNotFoundException ex) {
		return ex.getMessage();
	}	
}
```

### CharacterNotFoundException.java

```java
package co.grandcircus.AvengersApi;

public class CharacterNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public CharacterNotFoundException(String id) {
		super("Could not find character with id " + id);
	}
}
```


