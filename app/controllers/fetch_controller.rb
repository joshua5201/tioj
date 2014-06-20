class FetchController < ApplicationController
  before_action :authenticate
  layout false
  
  def testdata
    @testdata = Testdatum.find(params[:tid])
    if params[:input]
      @path = @testdata.test_input
    else
      @path = @testdata.test_output
    end
    send_file(@path.to_s)
  end
  
  def submission
    @submission = Submission.where("`result` = 'queued' OR `result` = ''").first
    if @submission
      @result = @submission.id.to_s
      @result += "\n"
      @result += @submission.problem_id.to_s
      @result += "\n"
      @result += @submission.user_id.to_s
      @result += "\n"
      @result += @submission.compiler.to_s
      @result += "\n"
      @result += @submission.code.to_s
      @result += "\n"
    else
      @result = "-1\n"
    end
    render text: @result
  end
  
private
  def authenticate
    if not params[:key]
      redirect_to root_path
      return
    end
    if params[:key] != '31415926'
      redirect_to root_path
      return
    end
  end
end
