---
layout: null
---

<style>
html {
	font-family: Arial, Helvetica, sans-serif;
	background-color: #181a1b;
	color: #e8e6e3;
}

body {
	max-width: 100ch;
	margin: auto;
	padding: 0 1rem;
}

h1 {
	margin: 4rem 0;
	text-align: center;
}

hr {
	margin: 2rem;
	border: 1px solid #666;
}

div.highlight {
	background-color: #121414;
	padding: 1rem;
}

pre.highlight {
	margin: 0;
}

code {
	overflow-x: auto;
	white-space: pre-line;
}
</style>

# thorio.github.io

This currently only contains a setup script for personal use.

The dotfiles repo is private because it contains personal information, but you can substitute my public mirror.  
In `setup.sh`, replace:
```diff
< export DOTFILES_REPO=git@github.com:thorio/dotfiles.git
---
> export DOTFILES_REPO=https://github.com/thorio/dotfiles-public.git
```

The script will still prompt you to add a deploy key, but you can safely skip this step.

* * *

## Installation

Run script:

```bash
. <(curl https://thorio.github.io/setup.sh)
```
