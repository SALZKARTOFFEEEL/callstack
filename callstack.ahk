/*
  callstack()
  by SALZKARTOFFEEEL
  at https://github.com/SALZKARTOFFEEEL/callstack/tree/legacy


  callstack() returns an array of objects that represents the callstack.

  Each object has three keys: file, line, function.
  The length of the array can be used to determine the stack size.
  You can limit the amount of array entries returned by passing limit.


  This was written for AHK v1.1.X. (legacy)
*/


callstack(limit := -1) {
  stack := array()
  if (limit >= 0)
    stack.setCapacity(limit)

  loop {
    e := exception("", -A_Index)
    stack.push({"file": e.file, "line": e.line, "func": e.what})
  } until (A_Index-1 == limit || -A_Index . "" == e.what)
  stack.pop()
  return stack
}