# coding: utf-8

module Codegenlib

  module IniCommentGenerator
  
    def comment_to_s(comment)
      comment ? comment.gsub(/^/, ";") : ""
    end
  
  end
  
end
