class PracticeController < ApplicationController
  def index
    @title = params[:title]
  # respond_toメソッド => 結果をどのフォーマットで返すかを指定している
  respond_to do |format|
    # turbolinkが有効でないとき
    format.html
    # turbolinkが有効なとき
    format.js # => 次にindex.js.erbが呼ばれる
  end
  end
end
