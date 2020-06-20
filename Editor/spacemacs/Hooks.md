# Hooks

https://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html

**48.2.2 Hooks**

*Hooks* are an important mechanism for customizing Emacs. A hook is a Lisp variable which holds a list of functions, to be called on some well-defined occasion. (This is called *running the hook*.) The individual functions in the list are called the *hook functions* of the hook. For example, the hook kill-emacs-hook runs just before exiting Emacs (see [Exiting](https://www.gnu.org/software/emacs/manual/html_node/emacs/Exiting.html#Exiting)).

Most hooks are *normal hooks*. This means that when Emacs runs the hook, it calls each hook function in turn, with no arguments. We have made an effort to keep most hooks normal, so that you can use them in a uniform way. Every variable whose name ends in ‘-hook’ is a normal hook.

A few hooks are *abnormal hooks*. Their names end in ‘-functions’, instead of ‘-hook’ (some old code may also use the deprecated suffix ‘-hooks’). What makes these hooks abnormal is the way its functions are called—perhaps they are given arguments, or perhaps the values they return are used in some way. For example, find-file-not-found-functions is abnormal because as soon as one hook function returns a non-nil value, the rest are not called at all (see [Visiting](https://www.gnu.org/software/emacs/manual/html_node/emacs/Visiting.html#Visiting)). The documentation of each abnormal hook variable explains how its functions are used.

You can set a hook variable with setq like any other Lisp variable, but the recommended way to add a function to a hook (either normal or abnormal) is to use add-hook, as shown by the following examples. See [Hooks](http://www.gnu.org/software/emacs/manual/html_node/elisp/Hooks.html#Hooks) in The Emacs Lisp Reference Manual, for details.

Most major modes run one or more *mode hooks* as the last step of initialization. Mode hooks are a convenient way to customize the behavior of individual modes; they are always normal. For example, here’s how to set up a hook to turn on Auto Fill mode in Text mode and other modes based on Text mode:

**(add-hook 'text-mode-hook 'auto-fill-mode)**

This works by calling auto-fill-mode, which enables the minor mode when no argument is supplied (see [Minor Modes](https://www.gnu.org/software/emacs/manual/html_node/emacs/Minor-Modes.html#Minor-Modes)). Next, suppose you don’t want Auto Fill mode turned on in LaTeX mode, which is one of the modes based on Text mode. You can do this with the following additional line:

**(add-hook 'latex-mode-hook (lambda () (auto-fill-mode -1)))**

Here we have used the special macro lambda to construct an anonymous function (see [Lambda Expressions](http://www.gnu.org/software/emacs/manual/html_node/elisp/Lambda-Expressions.html#Lambda-Expressions) in The Emacs Lisp Reference Manual), which calls auto-fill-mode with an argument of -1 to disable the minor mode. Because LaTeX mode runs latex-mode-hook after running text-mode-hook, the result leaves Auto Fill mode disabled.

Here is a more complex example, showing how to use a hook to customize the indentation of C code:

```lisp
(setq my-c-style
  '((c-comment-only-line-offset . 4)

    (c-cleanup-list . (scope-operator
                       empty-defun-braces
                       defun-close-semi))))

(add-hook 'c-mode-common-hook
  (lambda () (c-add-style "my-style" my-c-style t)))
```



Major mode hooks also apply to other major modes *derived* from the original mode (see [Derived Modes](http://www.gnu.org/software/emacs/manual/html_node/elisp/Derived-Modes.html#Derived-Modes) in The Emacs Lisp Reference Manual). For instance, HTML mode is derived from Text mode (see [HTML Mode](https://www.gnu.org/software/emacs/manual/html_node/emacs/HTML-Mode.html#HTML-Mode)); when HTML mode is enabled, it runs text-mode-hook before running html-mode-hook. This provides a convenient way to use a single hook to affect several related modes. In particular, if you want to apply a hook function to any programming language mode, add it to prog-mode-hook; Prog mode is a major mode that does little else than to let other major modes inherit from it, exactly for this purpose.

It is best to design your hook functions so that the order in which they are executed does not matter. Any dependence on the order is asking for trouble. However, the order is predictable: the hook functions are executed in the order they appear in the hook.

If you play with adding various different versions of a hook function by calling add-hook over and over, remember that all the versions you added will remain in the hook variable together. You can clear out individual functions by calling remove-hook, or do (setq *hook-variable* nil) to remove everything.

If the hook variable is buffer-local, the buffer-local variable will be used instead of the global variable. However, if the buffer-local variable contains the element t, the global hook variable will be run as well.