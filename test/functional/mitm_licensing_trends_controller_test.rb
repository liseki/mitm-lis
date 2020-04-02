require File.dirname(__FILE__) + '/../test_helper'
require 'mitm_licensing_trends_controller'

# Re-raise errors caught by the controller.
class MitmLicensingTrendsController; def rescue_action(e) raise e end; end

class MitmLicensingTrendsControllerTest < Test::Unit::TestCase
  def setup
    @controller = MitmLicensingTrendsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
