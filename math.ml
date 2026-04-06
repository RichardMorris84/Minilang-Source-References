// ============================================================================
// math.ml — Minilang v1.1 Comprehensive Demo: Module with Math Utilities
// ============================================================================
// Demonstrates: modules, public/private visibility, functions, overloading,
// default parameters, ref parameters, const, var, structs, enums, result type

module math {

    // -----------------------------------------------------------------------
    // 1. IMPORTS (must appear before non-import members)
    // -----------------------------------------------------------------------
    import helpers;
    from helpers import Logger;

    // -----------------------------------------------------------------------
    // 2. CONSTANTS (const declarations at module scope)
    // -----------------------------------------------------------------------
    public const pi:float = 3.14159;
    public const e:float = 2.71828;
    public const tau:float = 6.28318;
    public const maxIterations:int = 1000;
    const internalPrecision:int = 16;

    // -----------------------------------------------------------------------
    // 3. MODULE-LEVEL VARIABLES (var declarations at module scope)
    // -----------------------------------------------------------------------
    public var lastResult:float = 0.0;
    var callCount:int = 0;

    // -----------------------------------------------------------------------
    // 4. ENUMS — named integral constant sets
    // -----------------------------------------------------------------------

    // Explicit integer values
    public enum RoundingMode {
        Floor = 0,
        Ceil = 1,
        Round = 2,
        Truncate = 3
    }

    // Using auto for sequential values
    public enum Operation {
        Add = 0,
        Subtract = auto,
        Multiply = auto,
        Divide = auto,
        Modulo = auto
    }

    // -----------------------------------------------------------------------
    // 5. STRUCTS — user-defined value types
    // -----------------------------------------------------------------------

    // Basic struct with named fields
    public struct Point {
        x:float;
        y:float;
    }

    // Struct with more fields
    public struct Vector3 {
        x:float;
        y:float;
        z:float;
    }

    // Struct with a method
    public struct Rectangle {
        width:float;
        height:float;

        fn area() -> float {
            return width * height;
        }

        fn perimeter() -> float {
            return 2.0 * (width + height);
        }
    }

    // -----------------------------------------------------------------------
    // 6. FUNCTIONS — basic, public/private, return types
    // -----------------------------------------------------------------------

    // Public function with two parameters and a return type
    public fn add(a:int, b:int) -> int {
        callCount = callCount + 1;
        return a + b;
    }

    // Function overloading by parameter types
    public fn add(a:float, b:float) -> float {
        callCount = callCount + 1;
        lastResult = a + b;
        return a + b;
    }

    // Function overloading by parameter count
    public fn add(a:int, b:int, c:int) -> int {
        return a + b + c;
    }

    public fn subtract(a:int, b:int) -> int {
        return a - b;
    }

    public fn multiply(a:int, b:int) -> int {
        return a * b;
    }

    public fn divide(a:float, b:float) -> result<float, string> {
        if (b == 0.0) {
            return error("Division by zero");
        }
        return ok(a / b);
    }

    public fn modulo(a:int, b:int) -> int {
        return a % b;
    }

    // -----------------------------------------------------------------------
    // 7. DEFAULT PARAMETERS
    // -----------------------------------------------------------------------

    // Defaulted parameters must follow non-defaulted ones
    public fn power(base:float, exponent:int = 2) -> float {
        let result:float = 1.0;
        for (let i:int = 0; i < exponent; i = i + 1) {
            result = result * base;
        }
        lastResult = result;
        return result;
    }

    public fn clamp(value:float, low:float = 0.0, high:float = 1.0) -> float {
        if (value < low) {
            return low;
        }
        if (value > high) {
            return high;
        }
        return value;
    }

    // -----------------------------------------------------------------------
    // 8. REF PARAMETERS — aliasing caller storage
    // -----------------------------------------------------------------------

    // ref parameter: modifies the caller's variable directly
    public fn increment(ref x:int) -> nothing {
        x += 1;
    }

    public fn swap(ref a:int, ref b:int) -> nothing {
        let temp:int = a;
        a = b;
        b = temp;
    }

    public fn doubleValue(ref val:float) -> nothing {
        val *= 2.0;
    }

    // -----------------------------------------------------------------------
    // 9. FUNCTIONS RETURNING nothing
    // -----------------------------------------------------------------------

    // Explicit return; in a nothing-returning function
    public fn resetState() -> nothing {
        lastResult = 0.0;
        callCount = 0;
        return;
    }

    // Implicit return at end of nothing-returning function (no return needed)
    public fn incrementCallCount() -> nothing {
        callCount = callCount + 1;
    }

    // -----------------------------------------------------------------------
    // 10. PRIVATE (module-internal) FUNCTIONS
    // -----------------------------------------------------------------------

    fn validate(n:int) -> bool {
        return n >= 0 and n <= maxIterations;
    }

    fn square(x:float) -> float {
        return x * x;
    }

    // -----------------------------------------------------------------------
    // 11. FUNCTIONS USING STRUCTS
    // -----------------------------------------------------------------------

    public fn makePoint(x:float, y:float) -> Point {
        let p:Point = Point { x: x, y: y };
        return p;
    }

    public fn distance(a:Point, b:Point) -> float {
        let dx:float = b.x - a.x;
        let dy:float = b.y - a.y;
        return power(dx * dx + dy * dy, 1);
    }

    public fn translatePoint(p:Point, dx:float, dy:float) -> Point {
        let result:Point = Point { x: p.x + dx, y: p.y + dy };
        return result;
    }

    // -----------------------------------------------------------------------
    // 12. FUNCTIONS USING ENUMS
    // -----------------------------------------------------------------------

    public fn applyOperation(op:Operation, a:int, b:int) -> int {
        if (op == Operation.Add) {
            return a + b;
        }
        if (op == Operation.Subtract) {
            return a - b;
        }
        if (op == Operation.Multiply) {
            return a * b;
        }
        if (op == Operation.Divide) {
            return a / b;
        }
        if (op == Operation.Modulo) {
            return a % b;
        }
        return 0;
    }

    // -----------------------------------------------------------------------
    // 13. FUNCTIONS USING RESULT TYPE
    // -----------------------------------------------------------------------

    public fn safeDivide(a:int, b:int) -> result<int, string> {
        if (b == 0) {
            return error("Cannot divide by zero");
        }
        return ok(a / b);
    }

    public fn sqrt(x:float) -> result<float, string> {
        if (x < 0.0) {
            return error("Cannot take square root of negative number");
        }
        // Simple Newton's method approximation
        let guess:float = x / 2.0;
        for (let i:int = 0; i < 20; i = i + 1) {
            guess = (guess + x / guess) / 2.0;
        }
        return ok(guess);
    }

    // -----------------------------------------------------------------------
    // 14. FUNCTIONS WITH VARIOUS LOOP PATTERNS
    // -----------------------------------------------------------------------

    public fn factorial(n:int) -> int {
        let result:int = 1;
        let i:int = 2;
        while (i <= n) {
            result = result * i;
            i = i + 1;
        }
        return result;
    }

    public fn fibonacci(n:int) -> int {
        if (n <= 0) {
            return 0;
        }
        if (n == 1) {
            return 1;
        }
        let a:int = 0;
        let b:int = 1;
        for (let i:int = 2; i <= n; i = i + 1) {
            let temp:int = b;
            b = a + b;
            a = temp;
        }
        return b;
    }

    public fn sumList(numbers:list<int>) -> int {
        let total:int = 0;
        for (num in numbers) {
            total = total + num;
        }
        return total;
    }

    // -----------------------------------------------------------------------
    // 15. NUMERIC TYPE VARIETY
    // -----------------------------------------------------------------------

    public fn addDecimals(a:decimal, b:decimal) -> decimal {
        return a + b;
    }

    public fn byteMath(a:u8, b:u8) -> u8 {
        return a + b;
    }

    public fn longMath(a:i64, b:i64) -> i64 {
        return a * b;
    }

    public fn floatMath(a:f32, b:f32) -> f32 {
        return a + b;
    }

    public fn doubleMath(a:f64, b:f64) -> f64 {
        return a * b;
    }
}
