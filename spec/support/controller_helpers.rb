  def current_user(stubs = {})
    @current_user #||= Factory(:user) 
  end

  def user_session(stubs = {}, user_stubs = {})
    @current_user_session #||= UserSession.create current_user
  end

  def login(session_stubs = {}, user_stubs = {})
    @current_user = Factory(:user)
    @current_user_session = UserSession.create current_user
    UserSession.stub!(:find).and_return(user_session(session_stubs, user_stubs))
  end

  def logout
    @current_user_session = nil
    @current_user = nil
  end

