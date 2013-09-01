class CodeGeneratorsController < ApplicationController
  def generate
    unless params[:res] 
      @res = {type: :yaml,
       from_code: "" 
      }
    else
      @res = params[:res]
    end
  end
end
