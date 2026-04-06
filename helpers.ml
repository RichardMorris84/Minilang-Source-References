// ============================================================================
// helpers.ml — Minilang v1.1 Comprehensive Demo: Classes, Collections, Tuples
// ============================================================================
// Demonstrates: classes, constructors, this, public/private fields/methods,
// constructor overloading, collections (array, list, map, set), tuples,
// string operations, optional chaining, nothing handling, try/catch/finally,
// throw, for-in iteration, break, continue

module helpers {

    // -----------------------------------------------------------------------
    // 1. IMPORTS
    // -----------------------------------------------------------------------
    from math import Point, pi;

    // -----------------------------------------------------------------------
    // 2. CONSTANTS AND VARIABLES
    // -----------------------------------------------------------------------
    public const version:string = "1.0.0";
    public const defaultCapacity:int = 16;
    public var instanceCount:int = 0;

    // -----------------------------------------------------------------------
    // 3. ENUMS
    // -----------------------------------------------------------------------
    public enum LogLevel {
        Debug = 0,
        Info = auto,
        Warning = auto,
        Error = auto,
        Fatal = auto
    }

    public enum Status {
        Active = 1,
        Inactive = 0
    }

    // -----------------------------------------------------------------------
    // 4. STRUCTS — demonstrating various field types
    // -----------------------------------------------------------------------

    public struct Config {
        name:string;
        maxRetries:int;
        timeout:float;
        verbose:bool;
    }

    public struct Pair {
        first:int;
        second:int;

        fn sum() -> int {
            return first + second;
        }

        fn diff() -> int {
            return first - second;
        }
    }

    // -----------------------------------------------------------------------
    // 5. CLASSES — reference types with identity
    // -----------------------------------------------------------------------

    // Basic class with constructor, fields, and methods
    public class Logger {
        public name:string;
        public level:LogLevel;
        messageCount:int;

        // Constructor
        fn init(name:string, level:LogLevel) -> nothing {
            this.name = name;
            this.level = level;
            this.messageCount = 0;
            instanceCount = instanceCount + 1;
        }

        // Constructor overload
        fn init(name:string) -> nothing {
            this.name = name;
            this.level = LogLevel.Info;
            this.messageCount = 0;
            instanceCount = instanceCount + 1;
        }

        // Public method
        public fn log(message:string) -> nothing {
            this.messageCount = this.messageCount + 1;
        }

        // Public method with return value
        public fn getMessageCount() -> int {
            return this.messageCount;
        }

        // Private method
        fn formatMessage(message:string) -> string {
            return this.name + ": " + message;
        }

        // Method using this reference
        public fn reset() -> nothing {
            this.messageCount = 0;
            this.level = LogLevel.Info;
        }
    }

    // Class demonstrating more patterns
    public class Container {
        public items:list<int>;
        public label:string;
        capacity:int;

        fn init(label:string, capacity:int) -> nothing {
            this.label = label;
            this.capacity = capacity;
            this.items = [];
        }

        fn init(label:string) -> nothing {
            this.label = label;
            this.capacity = defaultCapacity;
            this.items = [];
        }

        public fn addItem(item:int) -> bool {
            if (this.items.length() >= this.capacity) {
                return false;
            }
            this.items.append(item);
            return true;
        }

        public fn removeFirst() -> nothing {
            if (this.items.length() > 0) {
                this.items.remove(0);
            }
        }

        public fn getSize() -> int {
            return this.items.length();
        }

        public fn isEmpty() -> bool {
            return this.items.length() == 0;
        }

        public fn clear() -> nothing {
            this.items.clear();
        }
    }

    // Class with nothing-returning methods and field manipulation
    public class Counter {
        public value:int;

        fn init(start:int) -> nothing {
            this.value = start;
        }

        fn init() -> nothing {
            this.value = 0;
        }

        public fn increment() -> nothing {
            this.value += 1;
        }

        public fn decrement() -> nothing {
            this.value -= 1;
        }

        public fn addAmount(amount:int) -> nothing {
            this.value += amount;
        }

        public fn getAndReset() -> int {
            let old:int = this.value;
            this.value = 0;
            return old;
        }
    }

    // -----------------------------------------------------------------------
    // 6. FUNCTIONS DEMONSTRATING COLLECTIONS
    // -----------------------------------------------------------------------

    // --- LIST operations ---
    public fn createNumberList(count:int) -> list<int> {
        let nums:list<int> = [];
        for (let i:int = 0; i < count; i = i + 1) {
            nums.append(i);
        }
        return nums;
    }

    public fn filterPositive(numbers:list<int>) -> list<int> {
        let result:list<int> = [];
        for (n in numbers) {
            if (n > 0) {
                result.append(n);
            }
        }
        return result;
    }

    public fn listOperationsDemo() -> nothing {
        let items:list<int> = [10, 20, 30, 40, 50];

        // append
        items.append(60);

        // insert at index
        items.insert(0, 5);

        // remove at index
        items.remove(2);

        // length
        let size:int = items.length();

        // index access
        let first:int = items[0];
        let last:int = items[items.length() - 1];

        // index assignment
        items[0] = 999;

        // for-in iteration
        let total:int = 0;
        for (item in items) {
            total = total + item;
        }

        // clear
        items.clear();
    }

    // --- MAP operations ---
    public fn createLookup() -> map<string, int> {
        let lookup:map<string, int> = {"alpha": 1, "beta": 2, "gamma": 3};
        return lookup;
    }

    public fn mapOperationsDemo() -> nothing {
        // Map literal
        let ages:map<string, int> = {
            "Alice": 30,
            "Bob": 25,
            "Charlie": 35,
        };

        // Keyed access
        let aliceAge:int = ages["Alice"];

        // Missing key returns nothing
        let unknown:int = ages["Nobody"];

        // Keyed assignment
        ages["Dave"] = 28;

        // contains
        let hasAlice:bool = ages.contains("Alice");
        let hasFrank:bool = ages.contains("Frank");

        // remove
        ages.remove("Bob");

        // length
        let count:int = ages.length();

        // for-in iterates (key, value) tuples
        for (entry in ages) {
            let k:string = entry.0;
            let v:int = entry.1;
        }

        // clear
        ages.clear();
    }

    // --- SET operations ---
    public fn setOperationsDemo() -> nothing {
        // Set literal
        let colors:set<string> = set{"red", "green", "blue"};

        // add
        colors.add("yellow");

        // contains
        let hasRed:bool = colors.contains("red");
        let hasPurple:bool = colors.contains("purple");

        // remove
        colors.remove("green");

        // length
        let size:int = colors.length();

        // for-in iteration
        for (c in colors) {
            let current:string = c;
        }

        // clear
        colors.clear();
    }

    // --- ARRAY operations ---
    public fn arrayOperationsDemo() -> nothing {
        // Array literal (fixed-size)
        let data:array<int> = array[10, 20, 30, 40, 50];

        // Index access
        let first:int = data[0];
        let third:int = data[2];

        // Index assignment (allowed on arrays)
        data[0] = 99;

        // Out-of-range returns nothing
        let oob:int = data[100];

        // for-in iteration
        let sum:int = 0;
        for (val in data) {
            sum = sum + val;
        }
    }

    // -----------------------------------------------------------------------
    // 7. FUNCTIONS DEMONSTRATING TUPLES
    // -----------------------------------------------------------------------

    public fn makePair(a:int, b:string) -> (int, string) {
        return (a, b);
    }

    public fn makeTriple(x:int, y:int, z:int) -> (int, int, int) {
        return (x, y, z);
    }

    public fn swapPair(p:(int, string)) -> (string, int) {
        return (p.1, p.0);
    }

    public fn tupleDemo() -> nothing {
        // Tuple construction
        let pair:(int, string) = (42, "hello");
        let triple:(bool, int, float) = (true, 10, 3.14);

        // Tuple element access
        let first:int = pair.0;
        let second:string = pair.1;

        // Nested tuple usage
        let nested:(int, (string, bool)) = (1, ("test", false));
    }

    // -----------------------------------------------------------------------
    // 8. FUNCTIONS DEMONSTRATING NOTHING AND OPTIONAL CHAINING
    // -----------------------------------------------------------------------

    public fn maybeGetLogger(create:bool) -> Logger {
        if (create) {
            return Logger("maybe");
        }
        return nothing;
    }

    public fn optionalChainingDemo() -> nothing {
        // Optional member access ?.
        let logger:Logger = nothing;
        let maybeName:string = logger?.name;

        // Optional method call
        let maybeCount:int = logger?.getMessageCount();

        // Optional indexing ?[
        let items:list<int> = nothing;
        let maybeItem:int = items?[0];

        // Chained optional access
        let active:Logger = Logger("active");
        let name:string = active?.name;

        // Fallback operator ??
        let displayName:string = logger?.name ?? "Anonymous";
        let count:int = logger?.getMessageCount() ?? 0;

        // Nested fallback
        let a:int = nothing;
        let b:int = nothing;
        let c:int = 42;
        let result:int = a ?? b ?? c;
    }

    // -----------------------------------------------------------------------
    // 9. FUNCTIONS DEMONSTRATING EXCEPTION HANDLING
    // -----------------------------------------------------------------------

    public fn riskyDivide(a:int, b:int) -> int {
        return a / b;
    }

    public fn tryCatchDemo() -> nothing {
        // try/catch with single catch
        try {
            let x:int = riskyDivide(10, 0);
        } catch (e:DivideByZeroFault) {
            let caught:bool = true;
        }

        // try/catch with multiple catch clauses
        try {
            let items:list<int> = nothing;
            let val:int = items[0];
        } catch (e:NullReceiverFault) {
            let wasNull:bool = true;
        } catch (e:Fault) {
            let genericError:bool = true;
        }

        // try/finally
        let resource:int = 1;
        try {
            resource = 2;
        } finally {
            resource = 0;
        }

        // try/catch/finally combined
        try {
            let result:int = riskyDivide(100, 0);
        } catch (e:DivideByZeroFault) {
            let handled:bool = true;
        } finally {
            let cleanedUp:bool = true;
        }
    }

    public fn throwDemo() -> nothing {
        // throw statement
        throw Fault("Something went wrong");
    }

    // -----------------------------------------------------------------------
    // 10. FUNCTIONS DEMONSTRATING RESULT TYPE
    // -----------------------------------------------------------------------

    public fn parseNumber(s:string) -> result<int, string> {
        if (s == "") {
            return error("Empty string");
        }
        return ok(42);
    }

    public fn resultDemo() -> nothing {
        let good:result<int, string> = ok(100);
        let bad:result<int, string> = error("failed");

        // is_ok / is_error
        let isGood:bool = good.is_ok();
        let isBad:bool = bad.is_error();

        // value extraction
        let val:int = good.value();

        // error extraction
        let err:string = bad.error_value();

        // unwrap_or with fallback
        let safeVal:int = bad.unwrap_or(0);
        let goodVal:int = good.unwrap_or(-1);
    }

    // -----------------------------------------------------------------------
    // 11. FUNCTIONS DEMONSTRATING STRING OPERATIONS
    // -----------------------------------------------------------------------

    public fn stringDemo() -> nothing {
        // String literals with escapes
        let greeting:string = "Hello, World!";
        let withNewline:string = "line1\nline2";
        let withTab:string = "col1\tcol2";
        let withQuote:string = "She said \"hi\"";
        let withBackslash:string = "path\\to\\file";
        let withNull:string = "null\0char";
        let withUnicode:string = "\u0041\u0042\u0043";
        let withUnicode32:string = "\U00000041";
        let withCarriageReturn:string = "before\rafter";

        // String concatenation with +
        let full:string = greeting + " " + "How are you?";

        // Empty string
        let empty:string = "";
    }

    // -----------------------------------------------------------------------
    // 12. FUNCTIONS DEMONSTRATING CHAR LITERALS
    // -----------------------------------------------------------------------

    public fn charDemo() -> nothing {
        let letter:char = 'A';
        let digit:char = '9';
        let newline:char = '\n';
        let tab:char = '\t';
        let singleQuote:char = '\'';
        let backslash:char = '\\';
        let nullChar:char = '\0';
        let unicodeChar:char = '\u0041';
    }

    // -----------------------------------------------------------------------
    // 13. FUNCTIONS WITH VARIOUS LOOP PATTERNS
    // -----------------------------------------------------------------------

    public fn loopPatternsDemo() -> nothing {
        // While loop
        let i:int = 0;
        while (i < 10) {
            i = i + 1;
        }

        // C-style for loop
        for (let j:int = 0; j < 5; j = j + 1) {
            let squared:int = j * j;
        }

        // For loop with var init
        for (var k:int = 10; k > 0; k -= 1) {
            let value:int = k;
        }

        // For loop with compound assignment in step
        for (let m:int = 1; m < 100; m *= 2) {
            let power:int = m;
        }

        // For-in over list
        let names:list<string> = ["Alice", "Bob", "Charlie"];
        for (name in names) {
            let current:string = name;
        }

        // For-in over array
        let scores:array<int> = array[90, 85, 92, 78];
        for (score in scores) {
            let s:int = score;
        }

        // For-in over map (iterates key-value tuples)
        let lookup:map<string, int> = {"x": 1, "y": 2};
        for (entry in lookup) {
            let key:string = entry.0;
            let val:int = entry.1;
        }

        // For-in over set
        let unique:set<int> = set{1, 2, 3, 4, 5};
        for (item in unique) {
            let n:int = item;
        }

        // Break — exit loop early
        let target:int = 0;
        for (let b:int = 0; b < 100; b = b + 1) {
            if (b == 42) {
                target = b;
                break;
            }
        }

        // Continue — skip iteration
        let evenSum:int = 0;
        for (let c:int = 0; c < 20; c = c + 1) {
            if (c % 2 != 0) {
                continue;
            }
            evenSum = evenSum + c;
        }

        // Nested loops with break
        for (let outer:int = 0; outer < 5; outer = outer + 1) {
            for (let inner:int = 0; inner < 5; inner = inner + 1) {
                if (inner == 3) {
                    break;
                }
            }
        }
    }

    // -----------------------------------------------------------------------
    // 14. FUNCTIONS DEMONSTRATING ALL ASSIGNMENT OPERATORS
    // -----------------------------------------------------------------------

    public fn assignmentOpsDemo() -> nothing {
        let x:int = 100;

        // Simple assignment
        x = 50;

        // Compound assignment operators
        x += 10;    // 60
        x -= 5;     // 55
        x *= 2;     // 110
        x /= 10;    // 11
        x %= 3;     // 2

        // Assignment to collection elements
        let items:list<int> = [1, 2, 3];
        items[0] = 99;

        let data:map<string, int> = {"a": 1};
        data["b"] = 2;
    }

    // -----------------------------------------------------------------------
    // 15. FUNCTION DEMONSTRATING BOOLEAN EXPRESSIONS
    // -----------------------------------------------------------------------

    public fn booleanDemo() -> nothing {
        let a:bool = true;
        let b:bool = false;

        // Boolean operators
        let andResult:bool = a and b;
        let orResult:bool = a or b;
        let notResult:bool = not a;

        // Short-circuit evaluation
        let shortAnd:bool = false and true;
        let shortOr:bool = true or false;

        // Complex boolean expressions
        let complex:bool = (a or b) and (not b);
        let nested:bool = not (a and b) or (a and not b);
    }

    // -----------------------------------------------------------------------
    // 16. FUNCTION DEMONSTRATING COMPARISON AND EQUALITY
    // -----------------------------------------------------------------------

    public fn comparisonDemo() -> nothing {
        let x:int = 10;
        let y:int = 20;

        // Comparison operators
        let lt:bool = x < y;
        let le:bool = x <= y;
        let gt:bool = x > y;
        let ge:bool = x >= y;

        // Equality operators
        let eq:bool = x == y;
        let ne:bool = x != y;

        // Nothing equality
        let n:int = nothing;
        let isNothing:bool = n == nothing;
        let isNotNothing:bool = n != nothing;

        // Collection equality (by contents)
        let list1:list<int> = [1, 2, 3];
        let list2:list<int> = [1, 2, 3];
        let listsEqual:bool = list1 == list2;

        // Class equality (by identity)
        let c1:Counter = Counter(0);
        let c2:Counter = Counter(0);
        let c3:Counter = c1;
        let sameObject:bool = c1 == c3;
        let diffObject:bool = c1 != c2;
    }

    // -----------------------------------------------------------------------
    // 17. FUNCTION DEMONSTRATING UNARY AND ARITHMETIC EXPRESSIONS
    // -----------------------------------------------------------------------

    public fn arithmeticDemo() -> nothing {
        let a:int = 42;
        let b:int = 7;

        // Arithmetic operators
        let sum:int = a + b;
        let diff:int = a - b;
        let prod:int = a * b;
        let quot:int = a / b;
        let rem:int = a % b;

        // Unary negation
        let neg:int = -a;
        let doubleNeg:int = -(-a);

        // Operator precedence: * before +
        let prec1:int = 2 + 3 * 4;       // 14, not 20
        let prec2:int = (2 + 3) * 4;     // 20

        // Float arithmetic
        let f1:float = 3.14;
        let f2:float = 2.71;
        let fSum:float = f1 + f2;
        let fProd:float = f1 * f2;

        // String concatenation with +
        let greeting:string = "Hello" + " " + "World";

        // Decimal arithmetic
        let d1:decimal = 10.25d;
        let d2:decimal = 3.75d;
        let dSum:decimal = d1 + d2;
    }

    // -----------------------------------------------------------------------
    // 18. FUNCTION DEMONSTRATING NOTHING AND DEFAULT VALUES
    // -----------------------------------------------------------------------

    public fn defaultValuesDemo() -> nothing {
        // Explicit nothing assignment
        let x:int = nothing;
        let s:string = nothing;
        let b:bool = nothing;
        let f:float = nothing;

        // Typed declaration without initializer gets default value
        let defaultInt:int;          // 0
        let defaultBool:bool;        // false
        let defaultChar:char;        // '\0'
        let defaultString:string;    // ""
        let defaultFloat:float;      // 0.0

        // Default collection values
        let defaultList:list<int>;           // empty list
        let defaultMap:map<string, int>;     // empty map
        let defaultSet:set<int>;             // empty set
    }

    // -----------------------------------------------------------------------
    // 19. FUNCTION DEMONSTRATING SYSTEM CALLS
    // -----------------------------------------------------------------------

    public fn systemCallsDemo() -> nothing {
        // System call to get current time
        let now:int = syscall("GET_TIME", []);

        // System call to read environment variable
        let path:array<string> = syscall("GET_ENV", ["PATH"]);

        // System call to execute external command
        syscall("PRINT", ["Hello World!", "stdout"]);
        syscall("PRINT", ["This is a generic error message.", "stderr"]);
        


    }

    // -----------------------------------------------------------------------
    // 20. BLOCK SCOPING DEMO
    // -----------------------------------------------------------------------

    public fn scopingDemo() -> nothing {
        let x:int = 1;
        {
            // Inner block — new scope
            let y:int = 2;
            let z:int = x + y;
        }
        // y and z are no longer in scope here
        let w:int = x;
    }
}
