class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:choose_type]
  def choose_type
  end
end
