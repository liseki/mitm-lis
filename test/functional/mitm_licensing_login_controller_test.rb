require File.dirname(__FILE__) + '/../test_helper'
require 'mitm_licensing_login_controller'

# Re-raise errors caught by the controller.
class MitmLicensingLoginController; def rescue_action(e) raise e end; end

class MitmLicensingLoginControllerTest < Test::Unit::TestCase
  def setup
    @controller = MitmLicensingLoginController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
