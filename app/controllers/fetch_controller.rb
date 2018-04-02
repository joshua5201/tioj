class FetchController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_key
  layout false
  
  def interlib
    @problem = Problem.find(params[:pid])
    @interlib = @problem.interlib.to_s + "\n"
    render text: @interlib
  end
  
  def sjcode
    @problem = Problem.find(params[:pid])
    @sjcode = @problem.sjcode.to_s + "\n"
    render text: @sjcode
  end
  
  def code
    @submission = Submission.find(params[:sid])
    @code = @submission.code.to_s + "\n"
    render text: @code
  end
  
  def testdata_meta
    @problem = Problem.find(params[:pid])
    @result = @problem.testdata.count.to_s + " "
    @problem.testdata.order("id ASC").each do |t|
      @result += t.id.to_s + " "
      @result += t.updated_at.to_i.to_s + "\n"
    end
    render text: @result
  end
  
  def testdata_limit
    @problem = Problem.find(params[:pid])
    @result = ""
    @problem.testdata.order("id ASC").each do |t|
      @result += t.limit.time.to_s + " "
      @result += t.limit.memory.to_s + "\n"
    end
    render text: @result
  end
  
  def write_result
    @_result = params[:result]
    @submission = Submission.find(params[:sid])
    @submission.update(:_result => @_result)
    if @_result == "CE"
      @submission.update(:result => "CE", :score => 0)
    elsif @_result == "ER"
      @submission.update(:result => "ER", :score => 0)
    else
      update_verdict
    end
    render :nothing => true
  end

  def write_message
    @_message = params[:message]
    @submission = Submission.find(params[:sid])
    @submission.update(:message => @_message)
    logger.info @_message
    render :nothing => true
  end
  
  def update_verdict
    #score
    @_result = @_result.split("/")
    @score = 0
    @problem = @submission.problem
    @problem.testdata_sets.each do |s|
      @correct = true
      Range.new(s.from, s.to).each do |i|
	if @_result[i*3] != "AC"
	  @correct = false
	end
      end
      if @correct == true
	@score += s.score
      end
    end
    @submission.update(:score => @score)
    
    #verdict
    if params[:status] == "OK"
      @tdcount = @problem.testdata.count
      @result = 0
      ttime = 0
      tmem = 0
      (0..(@tdcount-1)).each do |i|
	if @v2i[@_result[i*3]]
	  @result = @result > @v2i[@_result[i*3]] ? @result : @v2i[@_result[i*3]]
	else
	  @result = 9
	end
        ttime += @_result[i*3+1].to_i
        tmem = @_result[i*3+2].to_i > tmem ? @_result[i*3+2].to_i : tmem
      end
      @submission.update(:result => @i2v[@result], :total_time => ttime, :total_memory => tmem)
    end
    
  end
  
  def testdata
    @testdata = Testdatum.find(params[:tid])
    if params[:input]
      @path = @testdata.test_input
    else
      @path = @testdata.test_output
    end
    send_file(@path.to_s)
  end
  
  def validating
    @submission = Submission.find(params[:sid])
    @submission.update(:result => "Validating")
    render :nothing => true
  end
  
  def submission
    @submission = Submission.where("`result` = 'queued' AND `contest_id` IS NOT NULL").first
    if not @submission
      @submission = Submission.where("`result` = 'queued'").first
    end
    if @submission
      @result = @submission.id.to_s
      @result += "\n"
      @result += @submission.problem_id.to_s
      @result += "\n"
      @result += @submission.problem.problem_type.to_s
      @result += "\n"
      @result += @submission.user_id.to_s
      @result += "\n"
      @result += @submission.compiler.to_s
      @result += "\n"
    else
      @result = "-1\n"
    end
    render text: @result
  end
  
private
  def authenticate_key
    if (not params[:key]) or params[:key] != Tioj::Application.config.fetch_key
      render :nothing => true
      return
    end
  end
end
