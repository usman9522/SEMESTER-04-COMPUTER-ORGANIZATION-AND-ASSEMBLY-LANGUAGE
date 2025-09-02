# Semester-04-COAL

## Computer Organization and Assembly Language

Welcome to the COAL (Computer Organization and Assembly Language) repository! This repository contains weekly lab assignments and tasks related to x86 assembly language programming for the Computer Organization and Assembly Language course.

## 📚 Course Overview

This repository covers fundamental concepts in computer organization and low-level programming using x86 assembly language. The labs progress from basic assembly programming to more advanced topics including:

- Basic x86 assembly programming
- Character and string manipulation
- Number system conversions (Binary, Decimal, Hexadecimal)
- Input/output operations
- Loops and control structures
- Procedures and functions
- Memory manipulation
- Arithmetic operations

## 🗂️ Repository Structure

```
LABS/
├── lab1/          # Introduction to Assembly Language
├── lab2/          # Basic Assembly Programming
├── lab3/          # Character and ASCII Operations
├── lab4/          # Number System Conversions
├── lab5/          # Loops and Iterations
├── lab6/          # Advanced Programming Concepts
└── lab7/          # Procedures and Functions
```

## 📖 Lab Descriptions

### Lab 1: Introduction to Assembly Language
- **Files**: Screenshots and PDF instructions
- **Topics**: Basic assembly setup, first programs
- **Key Concepts**: Understanding assembly structure, basic syntax

### Lab 2: Basic Assembly Programming
- **Files**: `task3.asm` to `task8.asm`
- **Topics**: Basic I/O operations, character display
- **Key Concepts**: DOS interrupts, basic data manipulation

### Lab 3: Character and ASCII Operations  
- **Files**: `2task2.asm`, `2task5.asm`
- **Topics**: ASCII code manipulation, character operations
- **Key Concepts**: Character input/output, ASCII conversions

### Lab 4: Number System Conversions
- **Files**: `4task1.asm` to `4task5.asm`
- **Topics**: Binary, decimal, and hexadecimal conversions
- **Key Concepts**: 
  - Binary to hexadecimal conversion
  - Hexadecimal to binary conversion
  - ASCII to binary representation
  - Error handling for invalid inputs

### Lab 5: Loops and Iterations
- **Files**: `l5t1.asm` to `l5t5.asm`
- **Topics**: Loop structures, repetitive operations
- **Key Concepts**: For loops, while loops, nested iterations

### Lab 6: Advanced Programming Concepts
- **Files**: `l6t1.asm` to `l6t5.asm`
- **Topics**: Advanced programming techniques
- **Key Concepts**: Complex data manipulation, advanced algorithms

### Lab 7: Procedures and Functions
- **Files**: `l7t1.asm` to `l7t3.asm`
- **Topics**: Modular programming with procedures
- **Key Concepts**: Function calls, parameter passing, return values

## 🛠️ Prerequisites

- **Assembler**: MASM (Microsoft Macro Assembler) or compatible
- **Environment**: DOS or DOSBox for 16-bit assembly execution
- **Editor**: Any text editor (VS Code, Notepad++, etc.)

## 🚀 How to Run

### Using MASM:
```bash
# Assemble the source file
masm filename.asm

# Link the object file
link filename.obj

# Run the executable
filename.exe
```

### Using DOSBox:
1. Install DOSBox
2. Mount your working directory
3. Use MASM/TASM to assemble and link
4. Execute the program

## 📋 Common Assembly Structure

Most programs in this repository follow this structure:

```assembly
.model small        ; Memory model
.stack 100h        ; Stack size
.386               ; Processor directive (when needed)

.data              ; Data segment
    ; Variables and constants

.code              ; Code segment
main proc          ; Main procedure
    mov ax, @data  ; Initialize data segment
    mov ds, ax
    
    ; Program logic here
    
    mov ah, 4ch    ; Exit to DOS
    int 21h
main endp
end main
```

## 🔧 Key Assembly Concepts Covered

- **DOS Interrupts**: INT 21h for I/O operations
- **Registers**: AX, BX, CX, DX and their subdivisions
- **Memory Models**: Small model programming
- **Data Types**: DB (byte), DW (word), DD (double word)
- **Control Flow**: Jumps, loops, conditional statements
- **Procedures**: PROC and ENDP directives
- **String Operations**: String manipulation and processing

## 📝 Notes

- All programs are written for 16-bit x86 architecture
- Programs use DOS system calls for I/O operations
- Error handling is implemented in number conversion programs
- Screenshots are provided for visual verification of outputs

## 🤝 Contributing

This repository is for educational purposes. Feel free to:
- Report bugs in the assembly code
- Suggest improvements to existing programs
- Add comments for better code understanding

## 📄 License

This repository is for educational use in the Computer Organization and Assembly Language course.

---

**Course**: Computer Organization and Assembly Language (COAL)  
**Semester**: 04  
**Programming Language**: x86 Assembly Language
