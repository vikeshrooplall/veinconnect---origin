class RegistrationsController <  Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: [:choose_type]
  def choose_type
  end

  def new
    super do |resource|
      if params[:user_type] == 'donor'
        resource.is_donor = true
        resource.build_donor if resource.donor.nil?
      elsif params[:user_type] == 'patient'
        resource.is_donor = false
        resource.build_patient if resource.patient.nil?
      end
    end
  end
end
