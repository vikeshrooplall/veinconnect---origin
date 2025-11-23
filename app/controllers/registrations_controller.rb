class RegistrationsController <  Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: [:choose_type]
  def choose_type
  end

  def new
    super do |resource|
      if params[:user_type] == 'donor'
        resource.is_donor = true
        resource.build_donor_profile if resource.donor_profile.nil?
      end
    end
  end
end
