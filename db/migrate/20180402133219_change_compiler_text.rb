class ChangeCompilerText < ActiveRecord::Migration
  def up
    Submission.where(compiler: 'c++').find_each do |sub|
      sub.update!(compiler: 'c++98')
    end
    Submission.where(compiler: 'c').find_each do |sub|
      sub.update!(compiler: 'c90')
    end
  end
end
