# Compiler Construction Laboratory (CC Lab)

**Student Details:**
- **Name:** Himesh Bhure
- **PRN:** 24070521013
- **Class / Semester:** Semester V, Section A
- **Subject:** Compiler Construction Lab (CC Lab)

---

## 📌 Repository Overview

This repository contains practical implementations for Compiler Construction Laboratory experiments using **Lex (Flex)** and **Yacc (Bison)**. The experiments cover fundamental compiler phases including lexical analysis, syntax analysis (parsing), error recovery, and intermediate code generation (Three Address Code).

---

## 🛠️ Prerequisites & Tools

To compile and run the programs, ensure you have the following installed on your system (Linux, macOS, or Windows via WSL / MinGW / Cygwin):

- **Flex** (Fast Lexical Analyzer Generator)
- **Bison / Yacc** (Parser Generator)
- **GCC** (GNU Compiler Collection)

### Installation Guide:
- **Ubuntu / Debian:**
  ```bash
  sudo apt-get update
  sudo apt-get install flex bison build-essential
  ```
- **Fedora / CentOS:**
  ```bash
  sudo dnf install flex bison gcc
  ```
- **macOS (Homebrew):**
  ```bash
  brew install flex bison
  ```
- **Windows:**
  Use WSL (Windows Subsystem for Linux) or install MinGW / MSYS2 with `flex` and `bison` packages.

---

## 🚀 Compilation & Execution Instructions

### 1. For Lex-only Programs (`.l`):
```bash
# Generate C source from Lex specification
flex filename.l

# Compile with GCC (link with libfl if required)
gcc lex.yy.c -o program

# Execute the binary
./program
```

### 2. For Lex + Yacc Programs (`.l` and `.y`):
```bash
# Generate y.tab.c and y.tab.h from Yacc specification
yacc -d filename.y
# Or using bison: bison -d filename.y

# Generate lex.yy.c from Lex specification
flex filename.l

# Compile both C files together (link math library -lm if needed)
gcc y.tab.c lex.yy.c -o program -lm

# Execute the binary
./program
```

---

## 📂 Experiments Index

| Experiment | Directory | Files | Description |
| :--- | :--- | :--- | :--- |
| **Exp 1** | `p1/` | `p1.l` | Count single-line comments in a string/program |
| **Exp 2** | `p2/` | `exp2.l` | Count comments, keywords, identifiers, words, spaces, and lines |
| **Exp 3** | `p3/` | `exp3.l` | Count words starting with 'a'/'A' and numbers (integers/floats) |
| **Exp 4** | `p4/` | `exp4.l`, `exp4.y` | Syntax validator for arithmetic expressions with precedence |
| **Exp 5** | `p5/` | `p5.l` | Invert/toggle case (uppercase to lowercase and vice versa) |
| **Exp 6** | `p6/` | `p6.l`, `p6hd.l` | Number base converter (Decimal to Hex & Hex to Decimal) |
| **Exp 7** | `p7/` | `exp7.l` | Recognize strings/lines ending with the suffix `com` |
| **Exp 8** | `p8/` | `exp8.l`, `exp8.y` | Postfix (RPN) arithmetic expression evaluator |
| **Exp 9** | `p9/` | `p9.l`, `p9.y` | Advanced infix calculator with `++`, `--`, `^`, `%`, and error recovery |
| **Exp 10** | `p10/` | `p10.l`, `p10.y` | Syntax validator for `for` loops and ternary operator statements |
| **Exp 11** | `p11/` | `p11.l`, `p11.y` | Syntax validator for C-style variable declarations |
| **Exp 12** | `p12/` | `p12.l`, `p12.y` | Three Address Code (TAC) generator and arithmetic evaluator |

---

## 📝 Experiment Details & Usage

### Experiment 1: Single-Line Comment Counter
- **Directory:** `p1/`
- **File:** `p1.l`
- **Description:** Scans the input text, counts occurrences of single-line comments starting with `//`, and prints the total count.
- **Run Commands:**
  ```bash
  cd p1
  flex p1.l
  gcc lex.yy.c -o p1
  ./p1
  ```

---

### Experiment 2: Lexical Analyzer for Code Metrics
- **Directory:** `p2/`
- **File:** `exp2.l`
- **Description:** Analyzes input source code and tabulates metrics: single-line comments, keywords (`int`, `char`, `float`, `if`, `else`, `return`), valid identifiers, total words, spaces, and line count.
- **Run Commands:**
  ```bash
  cd p2
  flex exp2.l
  gcc lex.yy.c -o exp2
  ./exp2
  ```

---

### Experiment 3: Words Starting with 'a'/'A' & Number Counter
- **Directory:** `p3/`
- **File:** `exp3.l`
- **Description:** Identifies and counts words that begin with 'a' or 'A', as well as numbers in integer, decimal, and scientific notation formats (e.g., `123`, `45.67`, `1.2e+3`).
- **Run Commands:**
  ```bash
  cd p3
  flex exp3.l
  gcc lex.yy.c -o exp3
  ./exp3
  ```

---

### Experiment 4: Arithmetic Expression Syntax Validator
- **Directory:** `p4/`
- **Files:** `exp4.l`, `exp4.y`
- **Description:** Parses arithmetic expressions involving numbers, `+`, `-`, `*`, `/`, and parentheses `( )`, checking whether the expression follows valid grammar rules.
- **Run Commands:**
  ```bash
  cd p4
  yacc -d exp4.y
  flex exp4.l
  gcc y.tab.c lex.yy.c -o exp4
  ./exp4
  ```

---

### Experiment 5: Case Converter (Toggle Case)
- **Directory:** `p5/`
- **File:** `p5.l`
- **Description:** Reads alphabetic input characters and toggles their case: converts uppercase letters to lowercase and lowercase letters to uppercase.
- **Run Commands:**
  ```bash
  cd p5
  flex p5.l
  gcc lex.yy.c -o p5
  ./p5
  ```

---

### Experiment 6: Number Base Conversion (Hex ↔ Decimal)
- **Directory:** `p6/`
- **Files:**
  - `p6.l`: Decimal to Hexadecimal converter.
  - `p6hd.l`: Hexadecimal to Decimal converter.
- **Run Commands:**
  ```bash
  cd p6
  # Decimal to Hex:
  flex p6.l
  gcc lex.yy.c -o p6
  ./p6

  # Hex to Decimal:
  flex p6hd.l
  gcc lex.yy.c -o p6hd
  ./p6hd
  ```

---

### Experiment 7: String Pattern Recognition (Suffix 'com')
- **Directory:** `p7/`
- **File:** `exp7.l`
- **Description:** Recognizes whether an input line ends with the suffix `com` (e.g. `example.com`), printing a matching confirmation message.
- **Run Commands:**
  ```bash
  cd p7
  flex exp7.l
  gcc lex.yy.c -o exp7
  ./exp7
  ```

---

### Experiment 8: Postfix (RPN) Expression Evaluator
- **Directory:** `p8/`
- **Files:** `exp8.l`, `exp8.y`
- **Description:** Evaluates arithmetic expressions provided in Reverse Polish Notation (Postfix) supporting `+`, `-`, `*`, `/`, `%`, and `^`.
- **Run Commands:**
  ```bash
  cd p8
  yacc -d exp8.y
  flex exp8.l
  gcc y.tab.c lex.yy.c -o exp8 -lm
  ./exp8
  ```

---

### Experiment 9: Infix Calculator with Error Recovery
- **Directory:** `p9/`
- **Files:** `p9.l`, `p9.y`
- **Description:** An infix calculator supporting operator precedence (`+`, `-`, `*`, `/`, `%`, `^`), unary increment/decrement (`++`, `--`), parentheses, division-by-zero checks, and Yacc error recovery (`yyerrok`).
- **Run Commands:**
  ```bash
  cd p9
  yacc -d p9.y
  flex p9.l
  gcc y.tab.c lex.yy.c -o p9 -lm
  ./p9
  ```

---

### Experiment 10: Control Structure Syntax Analyzer
- **Directory:** `p10/`
- **Files:** `p10.l`, `p10.y`
- **Description:** Validates grammar for:
  1. `for` loops (e.g., `for (i = 0; i < 10; i++)`)
  2. Conditional ternary expressions (e.g., `x = (a > b) ? true : false;`)
- **Run Commands:**
  ```bash
  cd p10
  yacc -d p10.y
  flex p10.l
  gcc y.tab.c lex.yy.c -o p10
  ./p10
  ```

---

### Experiment 11: Variable Declaration Syntax Validator
- **Directory:** `p11/`
- **Files:** `p11.l`, `p11.y`
- **Description:** Validates variable declarations in C supporting data types `int`, `float`, `char`, `double` followed by comma-separated identifiers and terminated with a semicolon (e.g. `int a, b, c;`).
- **Run Commands:**
  ```bash
  cd p11
  yacc -d p11.y
  flex p11.l
  gcc y.tab.c lex.yy.c -o p11
  ./p11
  ```

---

### Experiment 12: Intermediate Code Generator (Three Address Code)
- **Directory:** `p12/`
- **Files:** `p12.l`, `p12.y`
- **Description:** Generates Three Address Code (TAC) statements with temporary variables (`t1`, `t2`, ...) for arithmetic expressions with operator precedence and computes the final evaluation result.
- **Run Commands:**
  ```bash
  cd p12
  yacc -d p12.y
  flex p12.l
  gcc y.tab.c lex.yy.c -o p12
  ./p12
  ```

---

## 👤 Author
- **Himesh Bhure**
- **PRN:** `24070521013`
- **Branch / Year:** Computer Engineering / Semester V (Section A)

