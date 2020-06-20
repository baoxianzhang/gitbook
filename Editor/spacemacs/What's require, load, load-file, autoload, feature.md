# What's require, load, load-file, autoload, feature

http://ergoemacs.org/emacs/elisp_library_system.html

**Emacs Lisp's Library System: What's require, load, load-file, autoload, feature?**

By Xah Lee. Date: 2010-07-13. Last updated: 2014-04-10.

This page explains emacs library system. For example, what's the difference between library, package, features? And what's the difference between {load-file, load, require,autoload}?

**File/Package Loading Mechanisms**

Emacs lisp's module system is a primitive system, centered on loading file, with some slightly high level things such as its {*features*, autoload, require}. However, nothing is strict or enforced by elisp.

| **Function Name** | **Purpose**                                       | **Tech Detail**                                              | **Comment**                                                  |
| ----------------- | ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| load-file         | Load a specific file.                             | Load one specific file. (“.el” or “.elc” file name extentions are not auto added, but “.gz” is.) | Use this when you don't want emacs to guess the file name extention of “.el”, “.elc” or none. |
| load              | Load a file.                                      | Load a file by searching thru var load-path. Argument should be just the file name without full path, such as (load "undo"). It'll auto add “.elc” for compiled version if exist, or add “.el”, or with “.gz”. | Use this if the exact file path is not known in advance.     |
| require           | Load a package if it has not already been loaded. | Checks the var features, if symbol is not there, then call load to load it. File name is guessed from the feature name, or specified in the optional argument. | Best used in elisp libraries or scripts, similar to other lang's “require” or “import”. |
| autoload          | Load a file only when a function is called.       | Associate a function name with a file path. When the function is called, load the file, and execute the function. | If you are writing a major mode, have your package installation go by autoload if possible. It saves startup time. |

- [(info "(elisp) How Programs Do Loading")](http://ergoemacs.org/emacs_manual/elisp/How-Programs-Do-Loading.html)
- [(info "(emacs) Lisp Libraries")](http://ergoemacs.org/emacs_manual/emacs/Lisp-Libraries.html)
- [(info "(elisp) Loading")](http://ergoemacs.org/emacs_manual/elisp/Loading.html)

See also: [Emacs Lisp: How to Name Your Major Mode](http://ergoemacs.org/emacs/elisp_naming_your_mode.html).

**What's Library, Package, Feature?**

**No Namespace**

Emacs lisp the language does not have namespace. Everything is global, with dynamic scope, with some shadowing mechanism. So, don't expect library or module to be language defined namespace constructs like [Perl or Python's module system](http://xahlee.info/perl-python/writing_a_module.html) or [Java's Package system](http://xahlee.info/java-a-day/package.html). (note: emacs 24 added lexical scoping for variables, using a directive. It must be specified in each file, and applies to that file's let only.)

**What's the difference between a Package ＆ Library?**

These words are used losely, and do NOT have TECHNICAL definitions in elisp.

**library** → elisp file(s) containing a collection of useful stuff. For example, the command comment-dwim is defined in newcomment.el, which is a library of functions.

**package** → any useful elisp library for emacs users. ➢ for example: major mode or minor mode.

The term “module” is not used by emacs.

**Emacs's Concept of Feature**

[What's Emacs Lisp feature?](http://ergoemacs.org/emacs/elisp_feature_name.html)

**Package/Library/Feature are not Managed**

There is no absolute relation between any concept of package/library/feature/autoload facilities and the file name.

By convention, if a elisp file name is xyz-mode.el, it OFTEN provides a lisp symbol “xyz-mode” as its feature name (if it does at all), and the command to invoke the mode is OFTEN named “xyz-mode”. Sometimes the “-mode” part is omitted in any of {file name, feature symbol name, command name}.

This is only a lose convention. There are a lot exceptions. For example:

- The file lisp-mode.el provides the symbol lisp-mode as feature, and is invoked by a command named emacs-lisp-mode.
- The cua-base.el file provides symbols cua-base and cua as features, and is invoked by a command named cua-mode.
- The text-mode.el file does not provide any symbol for feature. It is invoked by a command named text-mode.
- The file desktop.el provides the symbol desktop as feature, and the command name to invoke it is desktop-save-mode.

All the above means, you could have a file named Joe-xyz-mode_v2.1.el, which provides a feature named “abc”, while the command name to activate it may be “opq”, and it might be displayed in mode line as “OPQ helper”. And, this file can be considered as a package or library.

Isn't all this “no namespace”, “not managed” module system very bad?

Yes it is.

Though, it's just the state of software. Many most popular langs, such as C, C++, [PHP](http://xahlee.info/php/index.html), do worse. They don't have a module system neither, and they load a file by “include”. Note that even Scheme Lisp didn't have module system, until R6RS, released in 2007, and the new module system defined in it is widely criticized, and R6RS caused Scheme community to split.