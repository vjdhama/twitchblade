module Twitter
  class FollowController
    def initialize(follower, followed)
      @follower = follower
      @followed = followed
      @model = FollowModel.new(@follower, @followed)
      @interface = FollowInterface.new
    end

    def process
      if @follower == @followed
        @interface.render_follow_error 
      else 
        @model.save
        @interface.render_follow_success(@followed)
      end
    end
  end
end
