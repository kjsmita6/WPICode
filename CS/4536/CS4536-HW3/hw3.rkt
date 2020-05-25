#lang plai-typed
#| 
Language, parsing, desugaring and interpretation for the language including
Mutation (multiple arguments)
|#

;; useful placeholder while developing
(define (undefined) (error 'undefined "") )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Types (and fundamental operators)
;;
;; Expressions
;;
; type used to capture a with-binding
(define-type DefS
  [defS (name : symbol) (val : ExprS)])

(define-type ExprC
  [numC (n : number)]
  [plusC (l : ExprC) (r : ExprC)]
  [multC (l : ExprC) (r : ExprC)]
  [idC (i : symbol)]
  [appC (f : ExprC) (args : (listof ExprC))]
  [if0C (c : ExprC) (t : ExprC) (e : ExprC)]
  [lamC (args : (listof symbol)) (body : ExprC)]
  [boxC (arg : ExprC)]
  [unboxC (arg : ExprC)]
  [setboxC (b : ExprC) (v : ExprC)]
  [seqC (b1 : ExprC) (b2 : ExprC)]
  [setC (var : symbol) (arg : ExprC)]
  )

(define-type ExprS
  [numS (n : number)]
  [plusS (l : ExprS) (r : ExprS)]
  [bminusS (l : ExprS) (r : ExprS)]
  [multS (l : ExprS) (r : ExprS)]
  [idS (i : symbol)]
  [appS (f : ExprS) (args : (listof ExprS))]
  [if0S (c : ExprS) (t : ExprS) (e : ExprS)]
  [lamS (args : (listof symbol)) (body : ExprS)]
  [withS (bindings : (listof DefS)) (body : ExprS)]
  [boxS (arg : ExprS)]
  [unboxS (arg : ExprS)]
  [setboxS (b : ExprS) (v : ExprS)]
  [seqS (exprs : (listof ExprS))]
  [setS (var : symbol) (arg : ExprS)]
  )

;;
;; Values
;;
(define-type Value
  [numV (n : number)]
  [boxV (l : Location)]
  [closV (params : (listof symbol)) (body : ExprC) (env : Env)])

;; error-checking function for extracting the location of a box
(define (boxloc [v : Value]) : Location
  (if (boxV? v)
      (boxV-l v)
      (error 'boxloc "type error: argument was not a box")))

;;
;; Environments
;;
(define-type-alias Env (listof Binding))
(define-type Binding
  [bind (name : symbol) (loc : Location)])

;; mt-env : Env
(define mt-env empty)

;; extend-env : Binding x Env -> Env
(define extend-env cons)

;; return first value bound to id in env, or raise error if id is not found
;; lookup : symbol x Env -> Location
(define (lookup [id : symbol] [env : Env]) : Location
  (cond [(empty? env) (error 'lookup (string-append "unbound identifier " (to-string id)))]
        [(cons? env) (if (symbol=? id (bind-name (first env)))
                         (bind-loc (first env))
                         (lookup id (rest env)))]))


;;
;; Stores
;;
(define-type-alias Store (listof Storage))
(define-type Storage
  [cell (location : Location) (val : Value)])
(define-type-alias Location number)

;; mt-store : Store
(define mt-store empty)

;; fetch : Location x  Store -> Value
(define (fetch [loc : Location] [sto : Store]) : Value
  (cond [(empty? sto) (error 'fetch "Memory address out of bounds")]
        [(cons? sto) (if (= loc (cell-location (first sto)))
                         (cell-val (first sto))
                         (fetch loc (rest sto)))]))

;; Implemented here as cons, trusting that store-lookup will fetch the
;; "most recent" Storage with the given Location.  Fragile....
;; override-store : Storage x Store -> Store
;;(define override-store cons)
;; A more robust implementation, not relying on implementation of fetch
;; override-store : Storage x Store -> Store
(define (override-store [c : Storage] [sto : Store]) : Store
  (let* ((loc (cell-location c))
         (val (cell-val c)))
    (cond [(empty? sto) 
           (list c)]
          [(cons? sto) (if (= loc (cell-location (first sto)))
                           (cons c (rest sto))
                           (cons (first sto) (override-store c (rest sto))))]
          )))
           
;;list-update-store : (listof Location) x (list of Value) x Store -> Store
;; essentially, iterate override-store, but take locations and values separately
;; assumes locs and vals have the same length
;; 
;; It matters that the updates are processed in the order given by the input lists.
(define (list-update-store [locs : (listof Location)]
                             [vals : (listof Value)]
                             [sto : Store]) : Store
  (cond [(empty? locs) sto]
        [(cons?  locs)
         (let ((sto1 (override-store (cell (first locs) (first vals)) sto)))
           (list-update-store (rest locs) (rest vals) sto1))]))

;;
;; Results
;;
;; Interpreting an Expr returns this
(define-type Result
  [v*s (v : Value) (s : Store)])
;; Interpreting a list of Expr returns this
;; useful when evaluating a list of arguments to a function, for example
(define-type Results
  [vs*s (vs : (listof Value)) (s : Store)])


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Parsing and desugaring

;; parse : s-expression -> ExprS
(define (parse [s : s-expression]) : ExprS
  (cond
    [(s-exp-number? s) (numS (s-exp->number s))]
    [(s-exp-symbol? s) (idS (s-exp->symbol s))]
    [(s-exp-list? s)
     (let ([sl (s-exp->list s)])
       (cond
         ;; built-in construct or calling function through an identifier
         [(s-exp-symbol? (first sl)) 
          (case (s-exp->symbol (first sl))
            [(+) (parse-arith s)]
            [(*) (parse-arith s)]
            [(-) (parse-arith s)]
            [(if0) (if0S (parse (second sl))
                         (parse (third sl)) (parse (fourth sl)))]
            [(fun) (lamS (map s-exp->symbol (s-exp->list (second sl)))
                         (parse (third sl)))]
            [(with) (withS (map (lambda (b) 
                                  (let ([bl (s-exp->list b)])
                                    (defS (s-exp->symbol (first bl))
                                      (parse (second bl)))))
                                (s-exp->list (second sl)))
                           (parse (third sl)))]
            [(box) (boxS (parse (second sl)))]
            [(unbox) (unboxS (parse (second sl)))]
            [(setbox) (setboxS (parse (second sl))
                               (parse (third sl)))]
            [(seq) (seqS (map parse (rest sl)))]
            [(set) (parse-set s)]
            [else ;; must be a function application
             (appS (idS (s-exp->symbol (first sl)))
                   (map parse (rest sl)))])]
         [else ;; must be a function application
          (appS (parse (first sl))
                (map parse (rest sl)))]))]
    [else (error 'parse "unexpected syntax")]))


;; ASSSUMES s satisfies s-exp-list? (call this from parse...)
;; CHECKS for having exactly two arguments
;; parses an s-expression into a "set" expression
;; parse-set : s-expression -> ExprS
(define (parse-set [s : s-expression]) : ExprS
   (let ([sl (s-exp->list s)])
     (cond
       [(not (= 3 (length sl)))
        (error 'parse-set "wrong number of arguments")]

       [else (setS (s-exp->symbol (second sl))
                   (parse (third sl)))]
       )))


;; ASSSUMES s satisfies s-exp-list? (call this from parse...)
;; CHECKS for having exactly two arguments
;; parses an s-expression into an arithmentic expression
;; parse-arith : s-expression -> ExprS
(define (parse-arith [s : s-expression]) : ExprS
   (let ([sl (s-exp->list s)])
     (cond
       [(not (= 3 (length sl)))
        (error 'parse-arith "wrong number of arguments")]
         ;; built-in construct or calling function through an identifier
         [(s-exp-symbol? (first sl)) 
          (case (s-exp->symbol (first sl))
            [(+) (plusS (parse (second sl)) (parse (third sl)))]
            [(*) (multS (parse (second sl)) (parse (third sl)))]
            [(-) (bminusS (parse (second sl)) (parse (third sl)))]
            [else (error 'parse-arith "not an arithmetic expression")]
            )])))

  
;; desugar : ExprS -> ExprC
(define (desugar [as : ExprS]) : ExprC
  (type-case ExprS as
    [numS (n) (numC n)]
    [plusS (l r) (plusC (desugar l)
                        (desugar r))]
    [multS (l r) (multC (desugar l)
                        (desugar r))]
    [bminusS (l r) (plusC (desugar l)
                          (multC (numC -1) (desugar r)))]
    [idS (i) (idC i)]
    [lamS (params body)
          (if (duplicates? params)
              (error 'desugar (string-append "binding name multiple times: "
                                             (to-string params)))
              (lamC params (desugar body)))]
    [appS (f args) (appC (desugar f) (map desugar args))]
    [if0S (c t e) (if0C (desugar c) (desugar t) (desugar e))]
    [withS (bindings body)
           (desugar (appS (lamS (map defS-name bindings) body)
                          (map defS-val bindings)))]
    [boxS (arg) (boxC (desugar arg))]
    [unboxS (arg) (unboxC (desugar arg))]
    [setboxS (arg val) (setboxC (desugar arg) (desugar val))]
    ;;[seqS (e1 e2) (seqC (desugar e1) (desugar e2))]
    [seqS (exprs)
          (cond [(empty? exprs)
                 (error 'desugar "empty seq not allowed")]
                 [(empty? (rest exprs))
                  (desugar (first exprs))]
                 [else
                  (seqC  (desugar (first exprs))
                         (desugar (seqS (rest exprs))))])]
    [setS (var arg) (setC var (desugar arg))]
    ))



;; Utilities
;; -----------------

;; True if the two lists have *different* lengths
;; different-length? :  (listof 'a) x (listof 'b) -> boolean
  (define (different-length? lst1 lst2) : boolean
  (not (= (length lst1) (length lst2))))

; helper to check for duplicate names
;; duplicates : (listof 'a) -> boolean
(define (duplicates? lst)
  (cond [(empty? lst) false]
        [(cons? lst) (or (member (first lst) (rest lst))
                         (duplicates? (rest lst)))]))

;; complaint when string-list has duplicates
(define (multiple-names-error tag string-list)
  (error tag (string-append "name occurs multiple times: " string-list)))

;; essentially, iterate extend-env, but take names and locations separately
;; assumes names and locs have the same length
;; pushes bindings on to env stack in order of input lists
;; list-add-to-env : (listof symbol x  (listof Location) x  Env ->Env
(define (list-add-to-env [names : (listof symbol)] [locs : (listof Location)] [env : Env]) : Env
  (cond [(empty? names) env]
        [(cons? names)
         (let ((env1 (extend-env (bind (first names) (first locs)) env)))
           (list-add-to-env (rest names) (rest locs) env1))]))
                                     


;; operators on numVs
;; ------------------

;; num+ : Value x Value -> Value
(define (num+ [l : Value] [r : Value]) : Value
  (if (numV? l)
      (if (numV? r)
          (numV (+ (numV-n l) (numV-n r)))
          (error 'num+ "type error: second argument was not a number"))
      (error 'num+ "type error: first argument was not a number")))

;; num* : Value x Value -> Value
(define (num* [l : Value] [r : Value]) : Value
  (if (numV? l)
      (if (numV? r)
          (numV (* (numV-n l) (numV-n r)))
          (error 'num* "type error: second argument was not a number"))
      (error 'num* "type error: first argument was not a number")))

;; num0? : Value -> boolean
(define (num0? [v : Value]) : boolean
  (if (numV? v) 
      (zero? (numV-n v))
      (error 'num0? "type error: argument was not a number")))




;; Generating new numbers
;; and lists of numbers
;; -------------------

;; The let-lambda idiom together with mutation *in Racket*
;; lets us generate numbers as needed.

;; each time this is called (with no arguments)
;; it returns the "next" number
;; new-number-demo : -> number
(define new-number-demo
  (let ([n 0])
    (lambda ()
      (begin
        (set! n (+ 1 n))
        n ))))

;; Here we generate a list of k new numbers
;; new-number-list : number -> (listof number)
(define new-number-list
  (let ([n 0])
    (lambda (k)
      (if (zero? k)
          empty
          (begin
            (set! n (+ 1 n))
            (cons n (new-number-list (- k 1)))
            )))))

;; In case we just need one new number
;; CRUCIALLY important that this uses the same state as new-number-list;
;; that's why we don't just use a separate function (like new-number-demo above)
;; new-number-demo : -> number
(define (new-number) (first (new-number-list 1)))

;; new-loc :-> Location
(define new-loc new-number)
;; new-loc-list : -> (listof Location)
(define new-loc-list new-number-list)




;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The Interpreter

;; interp : ExprC  x Env x  Store -> Result
(define (interp [a : ExprC] [env : Env] [sto : Store]) : Result
    (type-case ExprC a
      [numC (n) (v*s (numV n) sto)]
      [plusC (l r) (type-case Result (interp l env sto)
                     [v*s (v-l s-l)
                          (type-case Result (interp r env s-l)
                            [v*s (v-r s-r)
                                 (v*s (num+ v-l v-r) s-r)])])]
      [multC (l r) (type-case Result (interp l env sto)
                     [v*s (v-l s-l)
                          (type-case Result (interp r env s-l)
                            [v*s (v-r s-r)
                                 (v*s (num* v-l v-r) s-r)])])]
      [idC (i) (v*s (fetch (lookup i env) sto) sto)] 
      [lamC (params body) (v*s (closV params body env) sto)]
      [appC (f a) (apply f a env sto)]
      [if0C (c t e) (type-case Result (interp c env sto)
                      [v*s (v-a s-a)
                           (if (num0? v-a)
                               (interp t env s-a)
                               (interp e env s-a))])]
      [boxC (a) (type-case Result (interp a env sto)
                  [v*s (v-a s-a)
                       (let ([where (new-loc)])
                         (v*s (boxV where)
                              (override-store (cell where v-a)
                                              s-a)))])]    
      [unboxC (a) (type-case Result (interp a env sto)
                    [v*s (v-a s-a)
                         (if (boxV? v-a)
                             (v*s (fetch (boxloc v-a) s-a) s-a)
                             (error 'interp "type error -- unbox not given a box"))])]
      [setboxC (b v) (type-case Result (interp b env sto)
                       [v*s (v-b s-b)
                            (type-case Result (interp v env s-b)
                              [v*s (v-v s-v)
                                   (v*s v-v
                                        (override-store (cell (boxloc v-b)
                                                              v-v)
                                                        s-v))])])]    
      [seqC (b1 b2) (type-case Result (interp b1 env sto)
                      [v*s (v-b1 s-b1)
                           (interp b2 env s-b1)])]
      [setC (var val) (type-case Result (interp val env sto)
                        [v*s (v-val s-val)
                             (let ([where (lookup var env)])
                               (v*s v-val
                                    (override-store (cell where v-val)
                                                    s-val)))])]
      ))


;; ASSUMES f evaluates to a closure, and that the closure passes the
;; checks in compute-closure
;; apply : ExprC x (listof ExprC) x Env x Sto -> Value
(define (apply  [f : ExprC] [args : (listof ExprC) ] [env : Env] [sto : Store] ) : Result
  (let* (
         (num-args   (length args))
         ;; eval the function
         (f-result (compute-closure f env sto (length args)) )
         (f-value  (v*s-v f-result) )
         (f-store  (v*s-s f-result) )
         ;; extract the closure fields
         (f-params (closV-params f-value))
         (f-bdy  (closV-body f-value))
         (f-env  (closV-env f-value))
         
         ;; eval the arguments.  Note f-store!
         (args-results  (interp-list args env f-store))
         (args-values   (vs*s-vs args-results))
         (args-store    (vs*s-s args-results))
         ;; make a new environment and a new store
         (new-locs      (new-loc-list num-args))
         (new-env       (list-add-to-env f-params new-locs f-env))
         (new-store     (list-update-store new-locs args-values args-store))
         )
    ;; go for it
    (interp f-bdy new-env new-store)
    ))

;;
;; Interpreter Utilities
;; ----------------------
;; interp-list : (listof ExprC)  x Env x  Store -> (listof Value)
;; this evaluates left-to-right
;; all exprs evaluated in the same Environment
;; (but of course the Store is threaded)
(define (interp-list [exprs : (listof ExprC)] [env : Env] [sto : Store]) : Results
  (cond [(empty? exprs)
         (vs*s empty sto)]
        [(cons? exprs)
         (let* (
                (result1 (interp (first exprs) env sto))
                (value1    (v*s-v result1))
                (store1    (v*s-s result1))
                (results-rest (interp-list (rest exprs) env store1))
                (values-rest  (vs*s-vs results-rest))
                (store-rest   (vs*s-s results-rest))
                )
           (vs*s (cons value1 values-rest) store-rest) 
           )]))

;; Evaluate the first argument w.r.t. the given environment and store
;; check that the result is a closure,
;; and that the number of parameters equals the final argument, 
;; and that there are no repeated parameters in that closure.

;; compute-closure :  ExprC x Env x Store x number ->  Result
(define (compute-closure  [f : ExprC] [env : Env] [sto : Store] [n : number]) : Result
  ;; evaluate the function 
  (type-case Result (interp f env sto)
             [v*s (func-value s-f)
                  (cond
                     ;; if func-value not a closure we have a bug
                    [(not (closV? func-value))
                     (error 'compute-closure "given a non-closure")]
                    
                    [else ;; extract the parts of the closure
                     (let ((params (closV-params func-value))
                           (f-bdy  (closV-body func-value))
                           (f-env  (closV-env func-value)))
                       ;; check that the closure is appropriate for this application
                       (cond [(not (= (length params) n))
                              (error 'compute-closure "parameter and argument lengths don't match")]
                              ;; (length-mismatch-error 'compute-closure params n)]
                             [(duplicates? params)
                              (error 'compute-closure "duplicate parameters")]
                             
                             ;; ok, all is good
                             [else (v*s func-value s-f)]
                             ))])]))


                     
;; Putting it all together

;; a run-command just returning values
(define (run-v sexp)
     (v*s-v (interp (desugar (parse sexp)) mt-env mt-store)))

;; a run-command returning values and stores
(define (run sexp)
     (interp (desugar (parse sexp)) mt-env mt-store))

(define (run-adt exp)
     (interp exp mt-env mt-store))

(test
 (run-v '(with ((x 3))
               (+ (seq (set x 5) x) 
                  x)))
      (numV 10))

(test (run-v '(with ((x 3))
                  (+ x (seq (set x 5) x)) 
                  ))
      (numV 8))


(run-v
 '(with (( y 0))
       (with ((w (fun (x) (seq (set y 5) y))))
             (w y)))
)
