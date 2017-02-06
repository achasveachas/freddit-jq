module UsersHelper
  def ban_button
    @user.banned ? "Unban User" : "Ban User"
  end

  def admin_button
    @user.admin ?  "Revoke Admin Privilages" : "Make Admin"
  end
end
