  def current_user(stubs = {})
    @current_user #||= Factory(:user) 
  end

  def user_session(stubs = {}, user_stubs = {})
    @current_user_session #||= UserSession.create current_user
  end

  def login(session_stubs = {}, user_stubs = {})
    puts "logged in"
    @current_user = Factory(:user)
    @current_user_session = UserSession.create current_user
    UserSession.stub!(:find).and_return(user_session(session_stubs, user_stubs))
  end

  def logout
    @current_user_session = nil
    @current_user = nil
  end

#  def self.login_user
    #activate_authlogic
    #@my_user = Factory(:user)
    #UserSession.create(@my_user)
    #controller.stub!(:current_user).and_return(@my_user)
  #end # login_user
 
