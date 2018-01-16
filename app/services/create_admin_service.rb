class CreateAdminService
  def call
    u = User.new(role: 'admin', email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD'])
    u.skip_confirmation!
    u.save!
    return u
  end
end
