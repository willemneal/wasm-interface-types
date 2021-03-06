(module
  (import "" "" (memory $mem 1))
  (data (i32.const 0) "hello there")
  (func $greeting (result i32 i32)
    i32.const 0    ;; offset of string in memory
    i32.const 11   ;; length
  )
  (@interface func (export "greeting") (result string)
    call-core $greeting
    memory-to-string $mem
  )
)

(; CHECK-ALL:
(module
  (type (;0;) (func (result i32 i32)))
  (import "" "" (memory (;0;) 1))
  (func $greeting (type 0) (result i32 i32)
    i32.const 0
    i32.const 11)
  (data (;0;) (i32.const 0) "hello there")
  (@interface type (;0;) (func (result string)))
  (@interface func (;0;) (type 0)
    call-core $greeting
    memory-to-string)
  (@interface export "greeting" (func 0)))
;)
