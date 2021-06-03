# The least you need to know for using async methods

**Only async methods can call other async methods**

What that means is:

*If you're trying to call an async method, you have to make
the method you're in async, and add the word "await" before
the method call.*

Async methods MUST have a return type of **Task&lt;something&gt;** or just a **Task**

But they actually just return whatever is in the &lt;something&gt;.

Do not use void! If you don't want the method to return anything, "Task" for the return type.

