#coding: utf-8

module Codegenlib
  module CppHelper

    def textize(txt)
      "_T(\"#{txt}\")"
    end
    
    def commentize(comment)
      comment ? comment.gsub(/^/, "//") : ""
    end

    def comment_to_s(comment)
      commentize comment
    end
  

  end
end
