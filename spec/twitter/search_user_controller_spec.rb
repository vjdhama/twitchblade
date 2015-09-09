require "spec_helper"

module Twitter
  describe "SearchUserController" do
    before(:each) { @search = SearchUserController.new }

    context "#process" do
      it "should render header" do
        expect_any_instance_of(SearchUserInterface).to receive(:render_header)
        @search.process
      end

      it "should render requirements" do
        expect_any_instance_of(SearchUserInterface).to receive(:render_requirement)
        @search.process
      end
      
      it "should call render success on correct username" do
        allow_any_instance_of(SearchUserInterface).to receive(:get_username).and_return("vjdhama")
        allow_any_instance_of(SearchUserModel).to receive(:found_user?).and_return(true)
        expect_any_instance_of(SearchUserInterface).to receive(:render_success)
        @search.process
      end

      it "should call render failure on incorrect username" do
        allow_any_instance_of(SearchUserInterface).to receive(:get_username).and_return("vjdhama")
        allow_any_instance_of(SearchUserModel).to receive(:found_user?).and_return(false)
        expect_any_instance_of(SearchUserInterface).to receive(:render_failure)
        @search.process
      end
    end
  end
end
