# Welcome to MkDocs

For full documentation visit [mkdocs.org](https://mkdocs.org).

- [ ] one
- [x] two
- [ ] three

++ctrl+alt+delete++


### Grouping code blocks

``` bash tab="Bash"
#!/bin/bash

echo "Hello world!"
```

``` c tab="C"
#include <stdio.h>

int main(void) {
    printf("Hello world!\n");
}
```

``` c++ tab="C++"
#include <iostream>

int main() {
    std::cout << "Hello world!" << std::endl;
      return 0;
}
```

``` c# tab="C#"
using System;

class Program {
    static void Main(string[] args) {
          Console.WriteLine("Hello world!");
            }
}
```


### Highlighting specific lines

``` python hl_lines="3 4"
""" Bubble sort """
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```

### MathJax

\[3 < 4\]

\begin{align}
    p(v_i=1|\mathbf{h}) & = \sigma\left(\sum_j w_{ij}h_j + b_i\right) \\
    p(h_j=1|\mathbf{v}) & = \sigma\left(\sum_i w_{ij}v_i + c_j\right)
\end{align}

$$
\frac{n!}{k!(n-k)!} = \binom{n}{k}
$$

### Caret

This is the ^^Caret^^.

### Tilde

text has ~~gone~~.

### Fontawesome

:fa-coffee:

### Define list

定義
:    foobar
