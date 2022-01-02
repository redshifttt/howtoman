% HOWTOMAN(1) howtoman
% seanjbl [https://github.com/seanjbl](https://github.com/seanjbl)
% Jan 2022

# NAME
howtoman - a brief guide on how to read a man-page

# SYNOPSIS
man howtoman

# DESCRIPTION
**howtoman** is a brief guide on how to read a man-page. It aims to help people understand the mystical world of "the only command you need to know" and should be easy for anyone to read. You should already know what man is - see man(1).

# FORMATTING

**Note:** Formatting is only rendered if the terminal supports it.

**bold text** looks like this. It is used to signify something important.

*italics* looks like this. It is used to represent arguments and expressions. If less cannot render italics in the terminal it will instead render with an underline *like this*.

**CHAPTERS** look like this. This is used to break the man-page up into different sections.

[**-h**] - arguments inside of [ ] are optional.

*argument* ... means the argument can be repeated over and over again. The same thing goes for [*expression*] ...

**-a**|**-b** means the two options between the | cannot be used together

# CHAPTERS

Chapters, as mentioned previously, are the section headers that separate topics into their respective areas. They always sit at the start of the line, are bold and are all capital letters.

### Subheadings

Subheadings get used to break up chapters in the event there is a lot to cover in the chapter.

# HOW PAGES ARE RENDERED

As previously mentioned, sections get rendered by a program called less(1) which is a pager that lets a user view but not modify text that is inputted into it. man-pages are written in a format called groff(1), which is a minimal document creation language, then converted to the man-page format and rendered with less.

The colours in man-pages can also be changed - see THEMING MAN PAGES below.

# SECTIONS

man help documentation is split into sections which are used to categorise them. For example: shell commands get put in section 1, system calls in section 2, system administration commands in section 8 etc.

You can usually find what section a man-page is on by looking at the number following the title. An example of this is bash(1).

In order to go to a man-page and its section number you would run the following:

$ man 7 man

or

$ man man.7

which looks for **man** in **section 7**.

# THEMING MAN PAGES

man-pages can be themed to your liking. If you want to force *italics* to actually be italics then you can. You can change how bold fonts look and also all the colours. Or even if you don't like how far along you need to read you can change that too.

### Changing colours

Colours are changed by setting environment variables in your shell. For example:

```
export LESS_TERMCAP_md="*shell escape code*"
export LESS_TERMCAP_so="*shell escape code*"
export LESS_TERMCAP_se="*shell escape code*"
export LESS_TERMCAP_us="*shell escape code*"
export LESS_TERMCAP_ue="*shell escape code*"
export LESS_TERMCAP_me="*shell escape code*"
```

The variable LESS_TERMCAP_\* is split into 2 parts. LESS_TERMCAP and the 2 letters at the end. The 2 letters at the end control what gets themed. See termcap(5) to find what these letters are and what they correspond to. Then once you have what you want you can set an alias in your **bashrc** like this:

```
man(){
    export LESS_TERMCAP_md="$(tput bold; tput setaf 4)"
    export LESS_TERMCAP_so="$(tput bold; tput smso)"
    export LESS_TERMCAP_se="$(tput rmso; tput sgr0)"
    export LESS_TERMCAP_us="$(tput bold; tput smul; tput setaf 3)"
    export LESS_TERMCAP_ue="$(tput sgr0)"
    export LESS_TERMCAP_me="$(tput sgr0)"
    command man "$@"
}
```

which, when you type man into a shell, it will set those variables and open man and thus less with the colours you set.

### Changing the width

If you want to change the width you can put:

```
export MANWIDTH="80"
```

in your bash_profile in order to change where text wraps within a man-page.
