class ResultsController < ApplicationController
  def index
    @result = Result.all
  end
  
  def record
    # TODO
    send_data(Base64.decode64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='),
      type: 'image/gif', disposition: 'inline')
  end
end
