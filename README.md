# genignore.sh

> Instantly generate a tailored `.gitignore` for any tech stack using [gitignore.io](https://www.toptal.com/developers/gitignore).

---

## Features

- Supports all languages, frameworks, and tools listed on gitignore.io
- Appends or overwrites existing `.gitignore`
- Backs up your current `.gitignore` before changes
- Fast, dependency-free (just needs `curl` and `bash`)
- Help and usage info built in

---

## Usage

Make it executable:
```bash
chmod +x genignore.sh
```

Generate a new .gitignore for Python, Node, and Visual Studio Code:
```bash
./genignore.sh python,node,visualstudiocode
```

Show help:
```bash
./genignore.sh --help
```

What does it do?
Fetches the best practice .gitignore from gitignore.io based on your keywords

Backs up your old .gitignore to .gitignore.bak

Overwrites or appends as you wish

Supported Keywords
Browse all supported platforms and keywords here:
https://www.toptal.com/developers/gitignore



## Example 
```bash
./genignore.sh python,django,linux,macos
```