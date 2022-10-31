# TypeScript Version of the Pen class and some samples

```ts
class Pen {
  InkColor: string;
  PointType: string;
  Brand: String;
  InkAmount: Number;

  Draw() {
    this.InkAmount = this.InkAmount - 1;
  }

  Refill() {
    this.InkAmount = 10;
  }
}

// Let's make a first pen and fill in its properties
let FirstPen: Pen = new Pen();
FirstPen.InkColor = "Green";
FirstPen.PointType = "Ballpoint";
FirstPen.Brand = "Bic";
FirstPen.InkAmount = 10.0;

// Let's make a second pen and fill in its properties

let SecondPen: Pen = new Pen();
SecondPen.InkColor = "Blue";
SecondPen.PointType = "Gel";
SecondPen.Brand = "Papermate";
SecondPen.InkAmount = 3.5;

// Let's print out information about the two pens!

console.log(`${FirstPen.InkColor} ${FirstPen.PointType} by ${FirstPen.Brand} with ink amount ${FirstPen.InkAmount}`);
console.log(`${SecondPen.InkColor} ${SecondPen.PointType} by ${SecondPen.Brand} with ink amount ${SecondPen.InkAmount}`);

// Now let's call some methods of the two pens

console.log(FirstPen.InkAmount);
FirstPen.Draw();
FirstPen.Draw();
SecondPen.Draw();
console.log("First pen's ink level:");
console.log(FirstPen.InkAmount);
console.log("Second pen's ink level:");
console.log(SecondPen.InkAmount);
SecondPen.Refill();
console.log("Second pen got a refill! Its level is now:")
console.log(SecondPen.InkAmount);

```
