module Twitter
  class StreamController
    def initialize(username)
      @model = StreamModel.new(username)
    end

    def process
      tweets = @model.get_all_tweets
      @interface = StreamInterface.new(tweets)
      @interface.render
      run
    end

    private 

    def run
      option = ""
      while option != "1" or option != "2"
        option = @interface.render_menu
        if option == "1"
          RetweetController.new(@model.data).process
        elsif option == "2"
          break
        else
          @interface.render_option_error
        end
      end
    end
  end
end