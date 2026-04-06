# Minilang for Visual Studio Code

Syntax highlighting, language configuration, and code snippets for the **Minilang v1.1** programming language.

## Features

- **Syntax Highlighting** for `.ml` and `.mll` files
  - Keywords, control flow, types, literals, operators
  - Module, struct, class, enum, and function declarations
  - String/char escape sequences (including `\uXXXX` and `\UXXXXXXXX`)
  - Decimal literals with `d`/`D` suffix
  - Fault types, result constructors (`ok`/`error`), built-in methods
  - Optional chaining (`?.`, `?[`) and fallback (`??`) operators

- **Language Configuration**
  - Comment toggling (`//` and `/* */`)
  - Bracket matching and auto-closing
  - Indentation rules
  - Folding support

- **Code Snippets** — `fn`, `class`, `struct`, `enum`, `module`, `if`, `for`, `forin`, `try`, `main`, and more

## Installation

### From source (development)

1. Copy or symlink this folder into your VS Code extensions directory:
   - **macOS**: `~/.vscode/extensions/minilang`
   - **Windows**: `%USERPROFILE%\.vscode\extensions\minilang`
   - **Linux**: `~/.vscode/extensions/minilang`
2. Restart VS Code (or run **Developer: Reload Window**)
3. Open any `.ml` file — syntax highlighting activates automatically

### Quick install (macOS)

```bash
ln -s "$(pwd)" ~/.vscode/extensions/minilang
```

Then reload VS Code.

## Supported File Types

| Extension | Description |
|-----------|-------------|
| `.ml`     | Minilang source file |
| `.mll`    | Minilang linked library |

## Language Feature Coverage

The grammar covers all Minilang v1.1 syntax:

- **Declarations**: `module`, `import`/`from...import`, `fn`, `struct`, `class`, `enum`, `let`, `var`, `const`
- **Modifiers**: `public`, `ref`
- **Control Flow**: `if`, `else`, `while`, `for`, `for...in`, `break`, `continue`, `return`
- **Exception Handling**: `try`, `catch`, `finally`, `throw`
- **Types**: `int`, `i8`–`i64`, `u8`–`u64`, `float`, `f32`, `f64`, `decimal`, `bool`, `char`, `string`, `nothing`, `never`
- **Collections**: `array<T>`, `list<T>`, `map<K,V>`, `set<T>`, `result<T,E>`, tuples
- **Operators**: `+`, `-`, `*`, `/`, `%`, `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `==`, `!=`, `<`, `<=`, `>`, `>=`, `->`, `and`, `or`, `not`, `?.`, `?[`, `??`
- **Literals**: integers, floats, decimals (`d`/`D`), strings, chars, booleans, `nothing`, list/map/set/array literals, tuples
- **Fault Types**: `Fault`, `NullReceiverFault`, `DivideByZeroFault`, etc.
