shared_examples "requires log-in" do
  it "redirects to login template" do
    clear_current_user
    action
    expect(response).to redirect_to login_path 
  end
end

shared_examples "requires admin" do
  it "redirects to root path" do
    set_current_user user
    #require 'pry';binding.pry
    action
    expect(response).to redirect_to root_path
  end
end