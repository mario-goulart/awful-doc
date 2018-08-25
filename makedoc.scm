#! /bin/sh
#|
exec csi -s $0 "$@"
|#

(import scheme)
(cond-expand
 (chicken-4
  (use utils posix))
 (chicken-5
  (import (chicken io)
          (chicken pathname)))
 (else
  (error "Unsupported CHICKEN version.")))

(define sections
  '(main
    tutorial
    application-server
    deploying
    ssl
    parameters
    procedures
    macros
    tips-tricks
    examples
    the-name
    faq
    bugs
    license
    version-history))

(for-each (lambda (section)
            (print
             (with-input-from-file
                 (make-pathname "doc" (symbol->string section))
               read-string)))
          sections)
