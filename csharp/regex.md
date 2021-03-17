# Regular Expression Examples

Remember to include the using statement:

```
using System.Text.RegularExpressions;
```

Examples:

```cs
Regex re = new Regex(@"^[a-z]$");
Console.WriteLine(re.IsMatch("a")); // Should be true
Console.WriteLine(re.IsMatch("A")); // Should be false
Console.WriteLine(re.IsMatch("ab")); // Should be false

// Any three lowercase letters: One way to do it
re = new Regex(@"^[a-z][a-z][a-z]$");
Console.WriteLine(re.IsMatch("abc")); // Should be true
Console.WriteLine(re.IsMatch("ab"));  // Should be false

// Any three lowercase letters: Another way
re = new Regex(@"^[a-z]{3}$");
Console.WriteLine(re.IsMatch("abc")); // Should be true
Console.WriteLine(re.IsMatch("ab"));  // Should be false

// Anywhere from 1 to three lowercase letters
re = new Regex(@"^[a-z]{1,3}$");
Console.WriteLine(re.IsMatch("abc")); // Should be true
Console.WriteLine(re.IsMatch("ab"));  // Should be true

// Start with lowercase letter, followed by three uppercase letters
re = new Regex(@"^[a-z][A-Z]{3}$");
Console.WriteLine(re.IsMatch("aXYZ"));  // Should be true
Console.WriteLine(re.IsMatch("aXY"));   // Should be false
Console.WriteLine(re.IsMatch("aaaa"));  // Should be false

// Between 1 and five alphanumeric characters
// Example:     ab123@xyz12.
// This will work:
// re = new Regex(@"^[a-zA-Z0-9]{1,5}$");
// But instead we can use a character class, \w (but technically \w allows underscore _ but that's okay)
re = new Regex(@"^\w{1,5}$");
Console.WriteLine(re.IsMatch("a"));       // True
Console.WriteLine(re.IsMatch("ab"));      // True
Console.WriteLine(re.IsMatch("aB1"));     // True
Console.WriteLine(re.IsMatch("ab123"));   // True
Console.WriteLine(re.IsMatch("ab1B45"));  // False

// Between 1 and five alphanumeric characters, an @ symbol, between 1 and five alphanumeric characters, then a dot.
// Parts:
//     \w{1,5}              @                 \w{1,5}             \.
//     1-5 characters       At symbol         1-5 characters      Literal dot
re = new Regex(@"^\w{1,5}@\w{1,5}\.$");
Console.WriteLine(re.IsMatch("abc@a123."));

// One digit
// Could do this:
// re = new Regex(@"^[0-9]$");
// But there's a character class
re = new Regex(@"^\d$");
Console.WriteLine(re.IsMatch("3"));   // Should be true
Console.WriteLine(re.IsMatch("a"));   // Should be false

// Between 3 and 5 digits
re = new Regex(@"^\d{3,5}$");
Console.WriteLine(re.IsMatch("123"));    // Should be true
Console.WriteLine(re.IsMatch("1233"));   // Should be true
Console.WriteLine(re.IsMatch("12389"));  // Should be true
Console.WriteLine(re.IsMatch("12"));     // Should be false
Console.WriteLine(re.IsMatch("aaa"));    // Should be false

// Exactly three digits, surrounded by parentheses
// Example (123)
// Example (555)
// Example (248)
// Parts
//       \(             \d{3}                     \)
//       Left paren     Exactly three digits      right paren
re = new Regex(@"^\(\d{3}\)$");
Console.WriteLine(re.IsMatch("(248)"));    // Should be true

// Exactly two digits, a slash, then exactly two digits
// Example 12/05
re = new Regex(@"^\d\d/\d\d$");
Console.WriteLine(re.IsMatch("12/05"));   // Should be true
Console.WriteLine(re.IsMatch("12a05"));   // Should be false

// Exactly two digits, a period, then exactly two digits
// Example 12.05
re = new Regex(@"^\d\d\.\d\d$");
Console.WriteLine(re.IsMatch("12.05"));   // Should be true
Console.WriteLine(re.IsMatch("12a05"));   // Should be false
```
