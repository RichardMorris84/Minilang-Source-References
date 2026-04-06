// ============================================================================
// main.ml — Minilang v1.1 Comprehensive Demo: Root Application Scope
// ============================================================================
// Demonstrates: root-scope declarations, imports, entry point (main),
// all statement types, all expression forms, all operators, all literal types,
// struct/class/enum usage, collections, tuples, result, optional chaining,
// fallback (??), try/catch/finally, throw, for-in, break, continue, ref calls,
// and interaction between modules
//
// NOTE: root-scope declarations cannot use `public`

// ============================================================================
// ROOT-SCOPE IMPORTS
// ============================================================================
import math;
from math import add, subtract, multiply, divide, modulo;
from math import power, clamp, increment, swap, doubleValue;
from math import Point, Vector3, Rectangle, RoundingMode, Operation;
from math import safeDivide, sqrt, factorial, fibonacci, sumList;
from math import pi, e, tau;
from math import makePoint, distance, translatePoint, applyOperation;
from math import addDecimals, byteMath, longMath, floatMath, doubleMath;
from math import resetState, incrementCallCount;
from helpers import Logger, Container, Counter, Config, Pair;
from helpers import LogLevel, Status;
from helpers import version, defaultCapacity;
from helpers import createNumberList, filterPositive;
from helpers import listOperationsDemo, mapOperationsDemo, setOperationsDemo, arrayOperationsDemo;
from helpers import makePair, makeTriple, swapPair, tupleDemo;
from helpers import maybeGetLogger, optionalChainingDemo;
from helpers import riskyDivide, tryCatchDemo, throwDemo;
from helpers import parseNumber, resultDemo;
from helpers import stringDemo, charDemo;
from helpers import loopPatternsDemo, assignmentOpsDemo;
from helpers import booleanDemo, comparisonDemo, arithmeticDemo;
from helpers import defaultValuesDemo, scopingDemo;

// ============================================================================
// ROOT-SCOPE CONSTANTS (immutable, must have initializer)
// ============================================================================
const appName:string = "Minilang Demo";
const appVersion:int = 1;
const maxItems:int = 100;
const greeting:string = "Hello, Minilang!";
const debugMode:bool = false;
const scaleFactor:float = 2.5;

// ============================================================================
// ROOT-SCOPE VARIABLES (mutable shared storage)
// ============================================================================
var globalCounter:int = 0;
var lastMessage:string = "";
var isRunning:bool = true;

// ============================================================================
// ROOT-SCOPE ENUMS
// ============================================================================
enum AppState {
    Initializing = 0,
    Ready = auto,
    Running = auto,
    ShuttingDown = auto,
    Stopped = auto
}

enum Priority {
    Low = 1,
    Medium = 2,
    High = 3
}

// ============================================================================
// ROOT-SCOPE STRUCTS
// ============================================================================
struct Color {
    r:int;
    g:int;
    b:int;
}

struct Dimensions {
    width:float;
    height:float;

    fn area() -> float {
        return width * height;
    }
}

// ============================================================================
// ROOT-SCOPE CLASSES
// ============================================================================
class AppContext {
    public state:AppState;
    public name:string;
    startTime:int;

    fn init(name:string) -> nothing {
        this.name = name;
        this.state = AppState.Initializing;
        this.startTime = 0;
    }

    public fn setState(newState:AppState) -> nothing {
        this.state = newState;
    }

    public fn getName() -> string {
        return this.name;
    }

    fn getStartTime() -> int {
        return this.startTime;
    }
}

// ============================================================================
// ROOT-SCOPE FUNCTION DECLARATIONS
// ============================================================================

// ---------------------------------------------------------------------------
// Functions demonstrating all literal types
// ---------------------------------------------------------------------------
fn literalsDemo() -> nothing {
    // Integer literals
    let zero:int = 0;
    let positive:int = 42;
    let large:int = 1000000;
    let leadingZero:int = 007;

    // Float literals
    let simple:float = 1.0;
    let precise:float = 3.14;
    let scientific:float = 6.02e23;
    let sciNeg:float = 1.5E-9;
    let sciPos:float = 10e3;

    // Decimal literals
    let dec1:decimal = 10d;
    let dec2:decimal = 10.25d;
    let dec3:decimal = 1e3d;
    let dec4:decimal = 9.5E-4D;

    // Boolean literals
    let yes:bool = true;
    let no:bool = false;

    // Nothing literal
    let absent:int = nothing;
    let noString:string = nothing;

    // String literals (with all escape sequences)
    let str:string = "hello world";
    let escaped:string = "tab\there\nnewline";
    let quotes:string = "say \"hi\"";
    let backslash:string = "c:\\path";
    let nullStr:string = "null\0here";
    let cr:string = "return\rhere";
    let unicode4:string = "\u0048\u0065\u006C\u006C\u006F";
    let unicode8:string = "\U00000048\U00000069";

    // Char literals
    let ch:char = 'A';
    let esc:char = '\n';
    let quote:char = '\'';
    let bslash:char = '\\';
    let nul:char = '\0';
    let tab:char = '\t';
    let uniCh:char = '\u0041';

    // List literal
    let nums:list<int> = [1, 2, 3, 4, 5];
    let emptyList:list<string> = [];
    let trailingComma:list<int> = [10, 20, 30,];

    // Map literal
    let dict:map<string, int> = {"one": 1, "two": 2, "three": 3};
    let emptyMap:map<int, string> = {};
    let trailingMap:map<string, bool> = {"a": true, "b": false,};

    // Set literal
    let uniqueNums:set<int> = set{1, 2, 3, 4, 5};

    // Array literal
    let fixedArr:array<int> = array[10, 20, 30];

    // Tuple literals
    let pair:(int, string) = (1, "one");
    let triple:(bool, int, float) = (true, 42, 3.14);
    let quadruple:(int, int, int, int) = (1, 2, 3, 4);
}

// ---------------------------------------------------------------------------
// Function demonstrating all expression forms and operators
// ---------------------------------------------------------------------------
fn expressionsDemo() -> nothing {
    // --- Arithmetic operators ---
    let a:int = 10;
    let b:int = 3;
    let sum:int = a + b;         // 13
    let diff:int = a - b;        // 7
    let prod:int = a * b;        // 30
    let quot:int = a / b;        // 3
    let rem:int = a % b;         // 1

    // --- Unary operators ---
    let neg:int = -a;            // -10
    let notTrue:bool = not true; // false
    let doubleNeg:int = -(-a);   // 10

    // --- Comparison operators ---
    let lt:bool = a < b;
    let le:bool = a <= b;
    let gt:bool = a > b;
    let ge:bool = a >= b;

    // --- Equality operators ---
    let eq:bool = a == b;
    let ne:bool = a != b;
    let nothingEq:bool = nothing == nothing;  // true
    let nothingNe:bool = nothing != nothing;  // false

    // --- Boolean operators with short-circuit ---
    let andResult:bool = true and false;       // false
    let orResult:bool = false or true;         // true
    let complex:bool = (a > 0) and (b > 0) or (a == b);
    let chained:bool = true and true and false;

    // --- Fallback operator ?? ---
    let maybe:int = nothing;
    let fallback:int = maybe ?? 99;            // 99
    let present:int = 42;
    let kept:int = present ?? 0;               // 42
    let chainedFb:int = nothing ?? nothing ?? 7;

    // --- String concatenation ---
    let hello:string = "Hello" + ", " + "World!";

    // --- Grouping / parenthesized expressions ---
    let grouped:int = (a + b) * (a - b);       // 13 * 7 = 91

    // --- Operator precedence ---
    let prec1:int = 2 + 3 * 4;                // 14
    let prec2:int = (2 + 3) * 4;              // 20
    let prec3:bool = 1 < 2 and 3 > 1;         // true
    let prec4:bool = true or false and false;  // true (and binds tighter)

    // --- Tuple element access ---
    let t:(int, string) = (10, "ten");
    let tFirst:int = t.0;
    let tSecond:string = t.1;

    // --- Struct field access ---
    let p:Point = makePoint(3.0, 4.0);
    let px:float = p.x;
    let py:float = p.y;
}

// ---------------------------------------------------------------------------
// Function demonstrating all statement types
// ---------------------------------------------------------------------------
fn statementsDemo() -> nothing {
    // --- let declaration ---
    let x:int = 1;
    let y:int;
    let a, b, c:int = 0;
    let inferred = 42;

    // --- var declaration (inside function - note: semantics spec allows let for locals) ---
    // var is for module/root scope; let is for locals. Demonstrating both valid forms.

    // --- const declaration ---
    const localConst:int = 999;
    const inferredConst = "hello";

    // --- Block statement (nested scope) ---
    {
        let inner:int = 10;
        let scoped:string = "only here";
    }

    // --- if statement ---
    if (x == 1) {
        let matched:bool = true;
    }

    // --- if/else ---
    if (x > 0) {
        let positive:bool = true;
    } else {
        let nonPositive:bool = true;
    }

    // --- if/else if/else chain ---
    if (x < 0) {
        let neg:bool = true;
    } else if (x == 0) {
        let zero:bool = true;
    } else if (x == 1) {
        let one:bool = true;
    } else {
        let other:bool = true;
    }

    // --- while loop ---
    let counter:int = 0;
    while (counter < 5) {
        counter = counter + 1;
    }

    // --- C-style for loop ---
    for (let i:int = 0; i < 10; i = i + 1) {
        let squared:int = i * i;
    }

    // --- for loop with assignment-like step ---
    let n:int = 1;
    for (n = 0; n < 10; n += 1) {
        let val:int = n;
    }

    // --- for loop with compound operators ---
    for (let m:int = 1; m < 256; m *= 2) {
        let pow2:int = m;
    }

    // --- for loop with var init ---
    for (var idx:int = 0; idx < 3; idx += 1) {
        let current:int = idx;
    }

    // --- for-in loop ---
    let items:list<int> = [10, 20, 30];
    for (item in items) {
        let value:int = item;
    }

    // --- break statement ---
    for (let i:int = 0; i < 100; i = i + 1) {
        if (i == 10) {
            break;
        }
    }

    // --- continue statement ---
    let odds:int = 0;
    for (let i:int = 0; i < 20; i = i + 1) {
        if (i % 2 == 0) {
            continue;
        }
        odds = odds + 1;
    }

    // --- return statement (with value, in other functions) ---
    // --- return; (no value, valid in nothing-returning functions like this one) ---

    // --- expression statement ---
    incrementCallCount();

    // --- assignment statements (all operators) ---
    let v:int = 100;
    v = 50;
    v += 10;
    v -= 5;
    v *= 2;
    v /= 11;
    v %= 3;

    // --- throw statement ---
    // (Demonstrated in tryCatchFullDemo below)

    // --- try/catch ---
    try {
        let result:int = 10 / 0;
    } catch (e:DivideByZeroFault) {
        let caught:bool = true;
    }

    // --- try/finally ---
    let cleanup:int = 0;
    try {
        cleanup = 1;
    } finally {
        cleanup = 0;
    }

    // --- try/catch/finally ---
    try {
        let risky:int = riskyDivide(1, 0);
    } catch (e:DivideByZeroFault) {
        let handled:bool = true;
    } finally {
        let done:bool = true;
    }

    // --- try with multiple catch clauses ---
    try {
        let obj:Logger = nothing;
        obj.log("test");
    } catch (e:NullReceiverFault) {
        let nullErr:bool = true;
    } catch (e:ArithmeticFault) {
        let mathErr:bool = true;
    } catch (e:Fault) {
        let anyErr:bool = true;
    }
}

// ---------------------------------------------------------------------------
// Function demonstrating struct usage
// ---------------------------------------------------------------------------
fn structDemo() -> nothing {
    // Named construction
    let p:Point = Point { x: 10.0, y: 20.0 };
    let v:Vector3 = Vector3 { x: 1.0, y: 2.0, z: 3.0 };

    // Field access
    let px:float = p.x;
    let vy:float = v.y;

    // Field update (copies the struct)
    let p2:Point = p;
    p2.x = 99.0;

    // Struct with methods
    let rect:Rectangle = Rectangle { width: 10.0, height: 5.0 };
    let area:float = rect.area();
    let perim:float = rect.perimeter();

    // Struct from function
    let origin:Point = makePoint(0.0, 0.0);
    let moved:Point = translatePoint(origin, 5.0, 3.0);

    // Root-scope struct
    let red:Color = Color { r: 255, g: 0, b: 0 };
    let dim:Dimensions = Dimensions { width: 800.0, height: 600.0 };
    let screenArea:float = dim.area();

    // Imported struct usage
    let cfg:Config = Config { name: "test", maxRetries: 3, timeout: 5.0, verbose: true };
    let pr:Pair = Pair { first: 10, second: 20 };
    let pairSum:int = pr.sum();
    let pairDiff:int = pr.diff();
}

// ---------------------------------------------------------------------------
// Function demonstrating class usage
// ---------------------------------------------------------------------------
fn classDemo() -> nothing {
    // Construction with different overloads
    let log1:Logger = Logger("main", LogLevel.Debug);
    let log2:Logger = Logger("secondary");

    // Public field access
    let name:string = log1.name;
    let level:LogLevel = log1.level;

    // Public method calls
    log1.log("Starting application");
    log1.log("Processing data");
    let count:int = log1.getMessageCount();

    // Method modifying internal state
    log1.reset();

    // Container class
    let box:Container = Container("storage", 5);
    let added1:bool = box.addItem(10);
    let added2:bool = box.addItem(20);
    let added3:bool = box.addItem(30);
    let size:int = box.getSize();
    let empty:bool = box.isEmpty();
    box.removeFirst();
    box.clear();

    // Counter class
    let ctr:Counter = Counter(100);
    ctr.increment();
    ctr.increment();
    ctr.decrement();
    ctr.addAmount(50);
    let val:int = ctr.getAndReset();

    // Default constructor
    let zeroCtr:Counter = Counter();
    zeroCtr.increment();

    // Class identity comparison
    let c1:Counter = Counter(0);
    let c2:Counter = Counter(0);
    let c3:Counter = c1;
    let same:bool = c1 == c3;       // true (same identity)
    let diff:bool = c1 != c2;       // true (different objects)

    // Root-scope class
    let ctx:AppContext = AppContext("MyApp");
    ctx.setState(AppState.Running);
    let ctxName:string = ctx.getName();
}

// ---------------------------------------------------------------------------
// Function demonstrating enum usage
// ---------------------------------------------------------------------------
fn enumDemo() -> nothing {
    // Enum member access
    let state:AppState = AppState.Ready;
    let priority:Priority = Priority.High;
    let mode:RoundingMode = RoundingMode.Round;
    let op:Operation = Operation.Multiply;
    let logLvl:LogLevel = LogLevel.Warning;
    let status:Status = Status.Active;

    // Enum comparison
    if (state == AppState.Ready) {
        let isReady:bool = true;
    }

    // Enum as function argument
    let result:int = applyOperation(Operation.Add, 10, 20);
    let result2:int = applyOperation(Operation.Multiply, 5, 6);

    // Enum in if/else chain
    if (priority == Priority.Low) {
        let msg:string = "low";
    } else if (priority == Priority.Medium) {
        let msg:string = "medium";
    } else if (priority == Priority.High) {
        let msg:string = "high";
    }

    // Enum nothing
    let noState:AppState = nothing;
    let isNothing:bool = noState == nothing;
}

// ---------------------------------------------------------------------------
// Function demonstrating collection operations
// ---------------------------------------------------------------------------
fn collectionsDemo() -> nothing {
    // --- List ---
    let numbers:list<int> = [1, 2, 3, 4, 5];
    numbers.append(6);
    numbers.insert(0, 0);
    numbers.remove(3);
    let len:int = numbers.length();
    let first:int = numbers[0];
    numbers[1] = 99;
    numbers.clear();

    // List of strings
    let words:list<string> = ["hello", "world"];
    let w:string = words[0];

    // Nested list (list of lists)
    let matrix:list<list<int>> = [[1, 2], [3, 4], [5, 6]];
    let row:list<int> = matrix[0];
    let cell:int = matrix[0][1];

    // --- Map ---
    let scores:map<string, int> = {"Alice": 95, "Bob": 87};
    let aliceScore:int = scores["Alice"];
    scores["Charlie"] = 92;
    let has:bool = scores.contains("Bob");
    scores.remove("Bob");
    let mapLen:int = scores.length();
    let missing:int = scores["Nobody"];    // returns nothing

    // Map with int keys
    let lookup:map<int, string> = {1: "one", 2: "two", 3: "three"};

    // --- Set ---
    let tags:set<string> = set{"important", "urgent", "review"};
    tags.add("new");
    let hasTag:bool = tags.contains("urgent");
    tags.remove("review");
    let setLen:int = tags.length();
    tags.clear();

    // --- Array ---
    let data:array<int> = array[10, 20, 30, 40, 50];
    let d0:int = data[0];
    data[2] = 999;
    // Array is fixed-size: no append, insert, remove, or clear
    let oob:int = data[100];    // returns nothing (out of range)

    // --- For-in iteration on all collection types ---
    let items:list<int> = [10, 20, 30];
    for (item in items) {
        let v:int = item;
    }

    let entries:map<string, int> = {"a": 1, "b": 2};
    for (entry in entries) {
        let key:string = entry.0;
        let val:int = entry.1;
    }

    let vals:set<int> = set{1, 2, 3};
    for (v in vals) {
        let n:int = v;
    }

    let arr:array<int> = array[5, 10, 15];
    for (elem in arr) {
        let e:int = elem;
    }

    // Empty collection literals
    let emptyList:list<int> = [];
    let emptyMap:map<string, int> = {};

    // Trailing commas in literals
    let trailingList:list<int> = [1, 2, 3,];
    let trailingMap:map<string, int> = {"x": 1, "y": 2,};
}

// ---------------------------------------------------------------------------
// Function demonstrating tuple operations
// ---------------------------------------------------------------------------
fn tuplesDemo() -> nothing {
    // Tuple construction
    let pair:(int, string) = (42, "answer");
    let triple:(int, int, int) = (1, 2, 3);
    let mixed:(bool, float, string, int) = (true, 3.14, "pi", 3);

    // Tuple element access
    let first:int = pair.0;
    let second:string = pair.1;
    let t2:int = triple.2;

    // Tuple from function
    let result:(int, string) = makePair(99, "bottles");
    let tri:(int, int, int) = makeTriple(10, 20, 30);

    // Tuple swap
    let swapped:(string, int) = swapPair((1, "one"));

    // Trailing comma in tuple literal
    let trailingPair:(int, int) = (1, 2,);
}

// ---------------------------------------------------------------------------
// Function demonstrating result type usage
// ---------------------------------------------------------------------------
fn resultDemo2() -> nothing {
    // Result constructors
    let good:result<int, string> = ok(42);
    let bad:result<int, string> = error("something failed");

    // is_ok / is_error
    let isGood:bool = good.is_ok();
    let isBad:bool = bad.is_error();
    let notBad:bool = good.is_error();

    // value extraction
    let val:int = good.value();

    // error extraction
    let err:string = bad.error_value();

    // unwrap_or with fallback
    let safe:int = bad.unwrap_or(0);
    let kept:int = good.unwrap_or(-1);

    // Result from functions
    let divResult:result<int, string> = safeDivide(10, 3);
    if (divResult.is_ok()) {
        let quotient:int = divResult.value();
    }

    let divByZero:result<int, string> = safeDivide(10, 0);
    if (divByZero.is_error()) {
        let errMsg:string = divByZero.error_value();
    }

    let sqrtResult:result<float, string> = sqrt(25.0);
    let sqrtVal:float = sqrtResult.unwrap_or(0.0);

    let negSqrt:result<float, string> = sqrt(-1.0);
    let negVal:float = negSqrt.unwrap_or(0.0);

    // Result from helpers module
    let parsed:result<int, string> = parseNumber("123");
    let emptyParse:result<int, string> = parseNumber("");
}

// ---------------------------------------------------------------------------
// Function demonstrating optional chaining and fallback
// ---------------------------------------------------------------------------
fn optionalDemo() -> nothing {
    // Optional member access ?.
    let logger:Logger = nothing;
    let name:string = logger?.name;               // nothing

    // Optional method call
    let count:int = logger?.getMessageCount();     // nothing

    // Optional indexing ?[
    let items:list<int> = nothing;
    let elem:int = items?[0];                      // nothing

    // Non-nothing optional access
    let active:Logger = Logger("live");
    let liveName:string = active?.name;            // "live"

    // Fallback operator ??
    let display:string = logger?.name ?? "Unknown";
    let fallbackCount:int = logger?.getMessageCount() ?? -1;

    // Chained fallback
    let x:int = nothing;
    let y:int = nothing;
    let z:int = 5;
    let result:int = x ?? y ?? z;                  // 5

    // Optional chaining in conditions
    if (logger?.name != nothing) {
        let hasName:bool = true;
    }

    // Optional on collections
    let maybeList:list<int> = nothing;
    let maybeLen:int = maybeList?.length();
    let safeLen:int = maybeList?.length() ?? 0;
}

// ---------------------------------------------------------------------------
// Function demonstrating ref parameter calls
// ---------------------------------------------------------------------------
fn refDemo() -> nothing {
    // ref call with local variable
    let n:int = 10;
    increment(*n);
    // n is now 11

    // ref with swap
    let a:int = 1;
    let b:int = 2;
    swap(*a, *b);
    // a is now 2, b is now 1

    // ref with float
    let val:float = 5.0;
    doubleValue(*val);
    // val is now 10.0

    // ref with root-scope variable
    increment(*globalCounter);
}

// ---------------------------------------------------------------------------
// Function demonstrating exception handling
// ---------------------------------------------------------------------------
fn exceptionDemo() -> nothing {
    // try/catch — single clause
    try {
        let result:int = 10 / 0;
    } catch (e:DivideByZeroFault) {
        lastMessage = "Caught divide by zero";
    }

    // try/catch — multiple clauses
    try {
        let obj:Counter = nothing;
        obj.increment();
    } catch (e:NullReceiverFault) {
        lastMessage = "Null receiver";
    } catch (e:Fault) {
        lastMessage = "Generic fault";
    }

    // try/finally
    let resource:int = 0;
    try {
        resource = 1;
        let x:int = 10 / 0;
    } finally {
        resource = 0;
    }

    // try/catch/finally
    let status:string = "init";
    try {
        status = "running";
        let arr:array<int> = nothing;
        let v:int = arr[0];
    } catch (e:NullReceiverFault) {
        status = "error";
    } finally {
        status = "cleanup";
    }

    // Nested try blocks
    try {
        try {
            let bad:int = 1 / 0;
        } catch (e:DivideByZeroFault) {
            lastMessage = "Inner catch";
        }
        lastMessage = "After inner try";
    } catch (e:Fault) {
        lastMessage = "Outer catch";
    } finally {
        lastMessage = "Outer finally";
    }

    // Catch specific fault types
    try {
        let r:result<int, string> = error("fail");
        let v:int = r.value();
    } catch (e:InvalidResultAccessFault) {
        lastMessage = "Invalid result access";
    }
}

// ---------------------------------------------------------------------------
// Function demonstrating nothing and default values
// ---------------------------------------------------------------------------
fn nothingDemo() -> nothing {
    // Explicit nothing assignment
    let x:int = nothing;
    let s:string = nothing;
    let b:bool = nothing;
    let f:float = nothing;
    let c:char = nothing;
    let d:decimal = nothing;
    let p:Point = nothing;
    let log:Logger = nothing;
    let items:list<int> = nothing;
    let lookup:map<string, int> = nothing;

    // nothing equality
    let isNoth:bool = x == nothing;
    let isNotNoth:bool = x != nothing;
    let nothEq:bool = nothing == nothing;

    // Typed declaration without initializer (gets default)
    let defInt:int;              // 0
    let defBool:bool;            // false
    let defChar:char;            // '\0'
    let defStr:string;           // ""
    let defFloat:float;          // 0.0
    let defList:list<int>;       // empty list
    let defMap:map<string, int>; // empty map
    let defSet:set<int>;         // empty set
}

// ---------------------------------------------------------------------------
// Function demonstrating numeric type variety
// ---------------------------------------------------------------------------
fn numericTypesDemo() -> nothing {
    // Default integer and float
    let i:int = 42;
    let f:float = 3.14;

    // Sized integer types
    let a:i8 = 127;
    let b:i16 = 32000;
    let c:i32 = 100000;
    let d:i64 = 9999999999;

    // Unsigned integer types
    let ua:u8 = 255;
    let ub:u16 = 65000;
    let uc:u32 = 100000;
    let ud:u64 = 9999999999;

    // Sized float types
    let fa:f32 = 1.5;
    let fb:f64 = 2.718281828;

    // Decimal type
    let dec:decimal = 10.25d;
    let dec2:decimal = 99d;

    // Cross-module numeric functions
    let decSum:decimal = addDecimals(10d, 20d);
    let byteSum:u8 = byteMath(100, 50);
    let longProd:i64 = longMath(1000000, 1000000);
    let fResult:f32 = floatMath(1.5, 2.5);
    let dResult:f64 = doubleMath(2.0, 3.0);
}

// ---------------------------------------------------------------------------
// Function demonstrating complex control flow
// ---------------------------------------------------------------------------
fn controlFlowDemo() -> nothing {
    // While with break
    let i:int = 0;
    while (true) {
        if (i >= 10) {
            break;
        }
        i += 1;
    }

    // While with continue
    let sum:int = 0;
    let j:int = 0;
    while (j < 20) {
        j += 1;
        if (j % 3 == 0) {
            continue;
        }
        sum += j;
    }

    // For with empty parts
    let k:int = 0;
    for (; k < 5; ) {
        k += 1;
    }

    // Nested loops
    let total:int = 0;
    for (let x:int = 0; x < 5; x += 1) {
        for (let y:int = 0; y < 5; y += 1) {
            total += x * y;
        }
    }

    // Nested loops with break in inner
    for (let x:int = 0; x < 10; x += 1) {
        for (let y:int = 0; y < 10; y += 1) {
            if (y > 3) {
                break;
            }
            total += 1;
        }
    }

    // For-in with break
    let data:list<int> = [5, 10, 15, 20, 25];
    let found:int = 0;
    for (d in data) {
        if (d == 15) {
            found = d;
            break;
        }
    }

    // For-in with continue
    let positiveSum:int = 0;
    let mixed:list<int> = [1, -2, 3, -4, 5];
    for (m in mixed) {
        if (m < 0) {
            continue;
        }
        positiveSum += m;
    }

    // Deep nesting
    if (true) {
        for (let i:int = 0; i < 3; i += 1) {
            while (i < 2) {
                {
                    let innerBlock:int = i;
                }
                break;
            }
        }
    }
}

// ---------------------------------------------------------------------------
// Function using module-level state
// ---------------------------------------------------------------------------
fn moduleStateDemo() -> nothing {
    // Read and write root-scope vars
    globalCounter = 0;
    globalCounter += 1;
    lastMessage = "updated";
    isRunning = false;

    // Read root-scope constants
    let name:string = appName;
    let ver:int = appVersion;
    let max:int = maxItems;
    let greet:string = greeting;
    let debug:bool = debugMode;

    // Read imported module constants
    let piVal:float = pi;
    let eVal:float = e;
    let tauVal:float = tau;
    let ver2:string = version;
    let cap:int = defaultCapacity;

    // Modify imported module state
    resetState();
    incrementCallCount();

    // Read/write imported module vars via functions
    let fib10:int = fibonacci(10);
    let fact5:int = factorial(5);
    let listSum:int = sumList([1, 2, 3, 4, 5]);
}

// ---------------------------------------------------------------------------
// Function demonstrating interaction between modules
// ---------------------------------------------------------------------------
fn crossModuleDemo() -> nothing {
    // Using math module functions
    let sum:int = add(10, 20);
    let sum3:int = add(1, 2, 3);
    let fSum:float = add(1.5, 2.5);
    let diff:int = subtract(10, 3);
    let prod:int = multiply(4, 5);
    let mod:int = modulo(17, 5);

    // Math with default params
    let squared:float = power(5.0);
    let cubed:float = power(5.0, 3);
    let clamped:float = clamp(1.5);
    let clamped2:float = clamp(50.0, 0.0, 100.0);

    // Math module structs
    let p1:Point = makePoint(0.0, 0.0);
    let p2:Point = makePoint(3.0, 4.0);
    let dist:float = distance(p1, p2);
    let p3:Point = translatePoint(p1, 10.0, 20.0);

    // Math module enums
    let result:int = applyOperation(Operation.Add, 100, 200);
    let result2:int = applyOperation(Operation.Divide, 100, 5);

    // Math module results
    let divResult:result<int, string> = safeDivide(100, 7);
    let sqrtResult:result<float, string> = sqrt(144.0);
    let failResult:result<float, string> = sqrt(-9.0);

    // Helpers module functions
    let nums:list<int> = createNumberList(10);
    let pos:list<int> = filterPositive([-3, -1, 0, 1, 2, 5]);

    // Helpers module classes
    let logger:Logger = Logger("crossModule", LogLevel.Debug);
    logger.log("Cross-module call");

    let container:Container = Container("mixed");
    container.addItem(42);

    let ctr:Counter = Counter(0);
    ctr.increment();
    ctr.addAmount(100);
    let ctrVal:int = ctr.value;

    // Helpers module tuples
    let pair:(int, string) = makePair(1, "first");
    let triple:(int, int, int) = makeTriple(10, 20, 30);
}

// ============================================================================
// ENTRY POINT — main function
// ============================================================================
fn main() -> nothing {
    // Call every demo function to exercise all language features

    // Literals and expressions
    literalsDemo();
    expressionsDemo();

    // All statement types
    statementsDemo();

    // Type system demos
    structDemo();
    classDemo();
    enumDemo();

    // Collections
    collectionsDemo();
    tuplesDemo();

    // Result type
    resultDemo2();

    // Optional chaining and nothing
    optionalDemo();
    nothingDemo();

    // Ref parameters
    refDemo();

    // Exception handling
    exceptionDemo();

    // Numeric types
    numericTypesDemo();

    // Control flow patterns
    controlFlowDemo();

    // Module state and cross-module interaction
    moduleStateDemo();
    crossModuleDemo();

    // Call demos from helpers module directly
    listOperationsDemo();
    mapOperationsDemo();
    setOperationsDemo();
    arrayOperationsDemo();
    tupleDemo();
    optionalChainingDemo();
    tryCatchDemo();
    resultDemo();
    stringDemo();
    charDemo();
    loopPatternsDemo();
    assignmentOpsDemo();
    booleanDemo();
    comparisonDemo();
    arithmeticDemo();
    defaultValuesDemo();
    scopingDemo();
}
