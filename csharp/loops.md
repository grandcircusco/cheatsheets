# Loops

## For Loops

### Basic for loop structure

```cs
for (int i=0; i<10; i++) {
    Console.WriteLine("Next Number");
    Console.WriteLine(i);
}
```

Here are the parts of the loop:

| Part       | What it does                                            |
| ---------- | --------------------------------------------------------|
| int i = 0  | Creates the variable and initializes it to 0            |
| i < 10     | Expression that gets evaluated *before* each iteration  |
| i++        | Statement that runs at *end* of each iteration          |

Since the expression gets evaluated before the loop runs, this loop prints out the numbers 0 through 9 (not 10).

> ---
> 
> REMEMBER: The counter variable only exists inside the loop.
> 
> ---


### Even Numbers

Here's a loop that prints out even numbers; look closely at the the third part, i = i + 2:

```cs
for (int i=0; i<10; i = i + 2) {
    Console.WriteLine("Next Number");
    Console.WriteLine(i);
}
```
It starts at 0, then 2, then 4. The final number it prints is 8. (Think about why!)

### Counting Down

Here's a loop that counts down from 10 to 0:

```
for (int i=10; i >= 0; i--) {
    Console.WriteLine("Next Number");
    Console.WriteLine(i);
}
```

The first number it prints is 10. The final number is 0. (Think about why!)

## While Loops

```cs
int i = 0;
while ( i < 10) {
    Console.WriteLine("Next Number");
    Console.WriteLine(i);
    i++;
}
```

The while loop's expression is tested **before** each iteration.

> ---
> 
> REMEMBER: Expressions evaluate to either **true** or **false**.
> 
> ---

> ---
> 
> REMEMBER: If the expression starts out false, the code inside the loop will never run.
> 
> ---

## Do While Loops

Do until loops evaluate the expression at the end of each iteration.

```cs
int i = 0;
do {
    Console.WriteLine("Next Number");
    Console.WriteLine(i);
    i++;
} while (i < 10);
```

> ---
> 
> REMEMBER: Because the evaluation happens at the end, the do while loop always runs *at least once*.
>
> ---

