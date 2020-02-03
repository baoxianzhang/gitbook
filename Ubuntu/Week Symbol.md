# Week Symbol

https://en.wikipedia.org/wiki/Weak_symbol

A **weak symbol** denotes a specially annotated symbol during linking of [Executable and Linkable Format](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format) (ELF) [object files](https://en.wikipedia.org/wiki/Object_file). By default, without any annotation, a symbol in an object file is **strong**. During linking, a strong symbol can override a weak symbol of the same name. In contrast, two strong symbols that share a name yield a link error during link-time. When linking a binary executable, a weakly [declared](https://en.wikipedia.org/wiki/Declaration_(computer_programming)) symbol does not need a definition. In comparison, (by default) a declared strong symbol without a definition triggers an undefined symbol link error.

Weak symbols are not mentioned by C or C++ language standards; as such, inserting them into code is not very portable. Even if two platforms support the same or similar syntax for marking symbols as weak, the semantics may differ in subtle points, e.g. whether weak symbols during dynamic linking at runtime lose their semantics or not.[[1\]](https://en.wikipedia.org/wiki/Weak_symbol#cite_note-dynamic-1)

**Pragma**[[edit](https://en.wikipedia.org/w/index.php?title=Weak_symbol&action=edit&section=2)]

*// function declaration* #pragma weak power2 int power2(int x);

**Attribute**[[edit](https://en.wikipedia.org/w/index.php?title=Weak_symbol&action=edit&section=3)]

*// function declaration* int __attribute__((weak)) power2(int x);   *// or* int power2(int x) __attribute__((weak)); *// variable declaration;* **extern** int __attribute__((weak)) global_var;