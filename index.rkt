#lang racket

(require web-server/servlet
         web-server/servlet-env
         web-server/dispatchers/dispatch-servlets)

;; DEBUG-PORT: the port number to run on when we're not currently running on Heroku
(define DEBUG-PORT 8000)

; onHeroku: (nothing) -> Boolean
; Are we on Heroku?
(define onHeroku (if (getenv "port") true false))

; getPort: (nothing) -> Number
; Get the port to listen on
(define getPort (if onHeroku (getenv "port") DEBUG-PORT))

; start: Request -> Response
; This is where the home page logic goes...
(define (start req)
  (response/xexpr
   `(html (head (title "Racket")) (body (p "Hello, home page!")))))

; Start the server
(serve/servlet start
               #:port getPort
               #:servlet-path "/"
               #:servlets-root "./servlets")