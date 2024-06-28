;;;; -*- mode: lisp; syntax: common-lisp; base: 10; coding: utf-8-unix; external-format: (:utf-8 :eol-style :lf); -*-
;;;; threads.lisp: utilities for dealing with threads

(uiop:define-package #:meria/src/threads
  (:use #:cl
        #:marie))

(in-package #:meria/src/threads)

(def show-threads ()
  "Print a list of running threads."
  (loop :for thread :in (mp:list-all-processes)
        :do (format t "~A~%" thread)))

(def show-thread-names ()
  "Print a list of the names of the running threads."
  (loop :for thread :in (mp:list-all-processes)
        :do (format t "~A~%" (mp:process-name thread))))

(def find-threads (query)
  "Find threads matching QUERY."
  (remove-if-not (lambda (thread)
                   (string= query (mp:process-name thread)))
                 (mp:list-all-processes)))

(def destroy-threads (query)
  "Destroy threads matching QUERY."
  (loop :for thread :in (find-threads query)
        :do (mp:process-kill thread)))

(def destroy-other-threads (query)
  "Destroy threads not matching QUERY."
  (loop :for thread :in (mp:list-all-processes)
        :when (neg (string= query (mp:process-name thread)))
          :do (mp:process-kill thread)))
