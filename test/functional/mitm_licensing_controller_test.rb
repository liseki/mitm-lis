require File.dirname(__FILE__) + '/../test_helper'
require 'mitm_licensing_controller'

# Re-raise errors caught by the controller.
class MitmLicensingController; def rescue_action(e) raise e end; end

class MitmLicensingControllerTest < Test::Unit::TestCase
  def setup
    @controller = MitmLicensingController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
