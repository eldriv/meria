;;;; -*- mode: lisp; syntax: common-lisp; base: 10; coding: utf-8-unix; external-format: (:utf-8 :eol-style :lf); -*-
;;;; driver.lisp: top-level definitions for the tests

(uiop:define-package #:pierre/t/driver
  (:nicknames #:pierre-t)
  (:use #:uiop/common-lisp
        #:marie)
  (:use-reexport #:pierre/t/run))

(provide "pierre/t")
(provide "PIERRE/T")
