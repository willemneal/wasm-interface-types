;; parse-fail

(module
  (@interface func
    call-core $foo))

(; CHECK-ALL:
failed to find func named `$foo`
     --> tests/unresolved4.wat:5:15
      |
    5 |     call-core $foo))
      |               ^
;)
