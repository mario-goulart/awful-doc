#! /bin/sh
#|
exec csi -s $0 "$@"
|#

(use utils posix)

(define sections 
  '(main
    tutorial
    application-server
    deploying
    ssl
    parameters
    procedures
    tips-tricks
    examples
    the-name
    faq
    bugs
    license
    version-history))

(for-each (lambda (section)
            (print (read-all (make-pathname "doc" (symbol->string section)))))
          sections)
