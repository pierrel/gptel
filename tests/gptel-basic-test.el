;;; gptel-basic-test.el --- Basic tests for gptel -*- lexical-binding: t; -*-

(require 'ert)
(require 'gptel)

(ert-deftest gptel-merge-plists-overrides-later-values ()
  "Later property lists override earlier ones."
  (should (equal (gptel--merge-plists (list :a 1 :b 2)
                                     (list :b 3 :c 4))
                 '(:a 1 :b 3 :c 4))))

(ert-deftest gptel-strip-mode-suffix-basic ()
  "Removing the -mode suffix returns the base language name."
  (should (equal (gptel--strip-mode-suffix 'text-mode) "text"))
  (should (equal (gptel--strip-mode-suffix 'yaml-mode) "Yaml")))

(ert-deftest gptel-parse-directive-string ()
  "Parsing a plain string directive wraps it in a list."
  (should (equal (gptel--parse-directive "Example") '("Example"))))

(provide 'gptel-basic-test)

;;; gptel-basic-test.el ends here
