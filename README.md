# `callstack()`
Retrieves the current callstack.

## Definition
```autohotkey
stack := callstack(limit := -1)
```
* `limit` – _integer_: The amount of callstack entires to return.
  * if `limit` is positive or 0, `stack.length` equals `limit`.
* `stack` – _array_ of _maps_: The current callstack (including the call to `callstack()` itself).
  * Each entry represents one entry in the callstack.
  * Each entry is a map. Each map has three keys:
    * `file` – _string_: The **full path of the file** the entry of the callstack points to.
    * `line` – _integer_: The **line number of the line** the entry of the callstack points to.
    * `func` – _string_: The **name of the function** the entry of the callstack points to.

## Example
```
test1() => test2()
test2() => test3()
test3() => callstack()

strStack := ""
for entry in test1() {
  strStack .= (
    "Line: " entry["line"] "`n"
    "File: " entry["file"] "`n"
    "Func: " entry["func"] "`n"
    "----`n"
  )
}
msgbox strStack
```
