require "spec_helper"

module Twitter
  describe "TwitterInterface" do
    let(:interface) { FollowInterface.new }

    it "should display error" do
      expect { interface.render_follow_error }.to output(/You cannnot follow yourself/).to_stdout
    end    

    it "should display success" do
      expect { interface.render_follow_success("vijay") }.to output(/You followed vijay/).to_stdout
    end
  end
end
