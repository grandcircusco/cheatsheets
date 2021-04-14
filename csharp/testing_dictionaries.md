Sample dictionary code:

```cs
    public class Names
    {
        // Maps apple => 10
        //      banana => 20
        public Dictionary<string, int> quantities = new Dictionary<string, int>();

        public void addQuantity(string item, int num)
        {
            if (quantities.ContainsKey(item) == true)
            {
                // Found it, so add instead of set

                // Get current value
                int current = quantities[item];
                // Add in additional amount (num)
                current += num;
                // Save back into dictionary
                quantities[item] = current;

                // Or just do this:
                // quantities[item] += num;
            }
            else
            {
                // Did not find it so just set
                quantities[item] = num;
            }
        }
    }
```

Sample test:

```
[Fact]
public void TestQuantities()
{
    Items names = new Items();
    names.addQuantity("apple", 10);
    names.addQuantity("apple", 6);

    int amount = names.quantities["apple"];
    Assert.Equal(16, amount);
}
```
