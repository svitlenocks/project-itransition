module LockControllerConcern
  extend ActiveSupport::Concern

  included do
    before_action :method3
  end

  def method3
    flash[:notice] = "Hello, I'm a concern!"
  end
end