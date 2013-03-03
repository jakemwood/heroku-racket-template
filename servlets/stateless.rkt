#lang web-server

(require web-server/http)

(provide interface-version stuffer start)

(define interface-version 'stateless)

(define stuffer
  (stuffer-chain
   serialize-stuffer
   (md5-stuffer (build-path (find-system-path 'home-dir) ".urls"))))

(define (start req) (response/xexpr `(html (head (title "test")) (body (p "test")))))

