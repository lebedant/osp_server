class WelcomeController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  $words = {}

  def data
    # p request.headers["Content-Length"]
    text = ActiveSupport::Gzip.decompress(request.raw_post)
    # p text
    text.split.each do |word|
      $words[word] = 1
    end
    # p @words
    # render plain: 'response'
    head :no_content
  end

  def count
    # p $words
    render plain: $words.size
  end
end
